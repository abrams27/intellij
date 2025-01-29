package com.google.idea.blaze.base.sync

import com.google.idea.blaze.base.model.BlazeProjectData
import com.google.idea.blaze.base.model.primitives.LanguageClass
import com.intellij.openapi.application.writeAction
import com.intellij.openapi.module.StdModuleTypes
import com.intellij.openapi.project.Project
import com.intellij.platform.backend.workspace.WorkspaceModel
import com.intellij.platform.backend.workspace.impl.WorkspaceModelInternal
import com.intellij.platform.backend.workspace.virtualFile
import com.intellij.platform.workspace.jps.JpsFileDependentEntitySource
import com.intellij.platform.workspace.jps.JpsFileEntitySource
import com.intellij.platform.workspace.jps.JpsGlobalFileEntitySource
import com.intellij.platform.workspace.jps.entities.ModuleTypeId
import com.intellij.platform.workspace.storage.EntitySource
import com.intellij.platform.workspace.storage.MutableEntityStorage
import com.intellij.platform.workspace.storage.impl.url.toVirtualFileUrl
import com.intellij.workspaceModel.ide.legacyBridge.impl.java.JAVA_SOURCE_ROOT_ENTITY_TYPE_ID
import org.jetbrains.plugins.bsp.config.rootDir
import org.jetbrains.plugins.bsp.coroutines.BspCoroutineService
import org.jetbrains.plugins.bsp.magicmetamodel.impl.workspacemodel.impl.WorkspaceModelUpdaterImpl
import org.jetbrains.plugins.bsp.workspacemodel.entities.BspEntitySource
import org.jetbrains.plugins.bsp.workspacemodel.entities.GenericModuleInfo
import org.jetbrains.plugins.bsp.workspacemodel.entities.JavaModule
import org.jetbrains.plugins.bsp.workspacemodel.entities.JavaSourceRoot
import java.nio.file.Path

class XD {
  fun xd(project: Project, projectBasePath: Path, blazeProjectData: BlazeProjectData) {
    BspCoroutineService.getInstance(project).start {
      val workspaceModel = WorkspaceModel.getInstance(project)
      val virtualFileUrlManager = workspaceModel.getVirtualFileUrlManager()

      project.rootDir = projectBasePath.toVirtualFileUrl(virtualFileUrlManager).virtualFile!!

      val diff = MutableEntityStorage.create()
      val workspaceModelUpdater =
        WorkspaceModelUpdaterImpl(
          workspaceEntityStorageBuilder = diff,
          virtualFileUrlManager = virtualFileUrlManager,
          projectBasePath = projectBasePath,
          project = project,
          isAndroidSupportEnabled = false,
        )

      val modulesToLoad = blazeProjectData.targetMap.targets()
        .filter { it.kind.hasLanguage(LanguageClass.JAVA) || it.kind.hasLanguage(LanguageClass.KOTLIN) }
        .map { JavaModule(
          genericModuleInfo = GenericModuleInfo(
            name = it.key.label.toString(),
            type = ModuleTypeId(StdModuleTypes.JAVA.id),
            modulesDependencies = emptyList(),
            librariesDependencies = emptyList(),
            languageIds = listOf("java"),
          ),
          baseDirContentRoot = null,
          sourceRoots = it.sources.map { o ->
            JavaSourceRoot(
              sourcePath = projectBasePath.resolve(o.relativePath),
              generated = o.isGenerated,
              packagePrefix = "XD",
              rootType = JAVA_SOURCE_ROOT_ENTITY_TYPE_ID,
            ) },
          resourceRoots = emptyList(),
          moduleLevelLibraries = null,
          jvmJdkName = null,
          jvmBinaryJars = emptyList(),
          kotlinAddendum = null,
          scalaAddendum = null,
          javaAddendum = null,
          androidAddendum = null,
          workspaceModelEntitiesFolderMarker = false,
        ) }

      workspaceModelUpdater.loadModules(modulesToLoad)
//      workspaceModelUpdater.loadLibraries(libraries)

      val workspaceModel1 = WorkspaceModel.getInstance(project) as WorkspaceModelInternal
      val snapshot = workspaceModel1.getBuilderSnapshot()
      snapshot.builder.replaceBySource({ it.isBspRelevantForFullSync() }, diff)

      val storageReplacement = snapshot.getStorageReplacement()
        writeAction {
          val workspaceModelUpdated = workspaceModel1.replaceProjectModel(storageReplacement)
          if (!workspaceModelUpdated) {
            error("Project model is not updated successfully. Try `reload` action to recalculate the project model.")
          }
        }
      }
    }

  private fun EntitySource.isBspRelevantForFullSync(): Boolean =
  when (this) {
    // avoid touching global sources
    is JpsGlobalFileEntitySource -> false

    is JpsFileEntitySource,
    is JpsFileDependentEntitySource,
    is BspEntitySource,
      -> true

    else -> false
  }
}
