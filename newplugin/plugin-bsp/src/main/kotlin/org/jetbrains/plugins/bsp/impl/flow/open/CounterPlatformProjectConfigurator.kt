package org.jetbrains.plugins.bsp.impl.flow.open

import com.intellij.openapi.application.writeAction
import com.intellij.openapi.module.Module
import com.intellij.openapi.project.Project
import com.intellij.openapi.util.Ref
import com.intellij.openapi.vfs.VirtualFile
import com.intellij.platform.DirectoryProjectConfigurator
import com.intellij.platform.backend.workspace.WorkspaceModel
import com.intellij.platform.backend.workspace.impl.WorkspaceModelInternal
import com.intellij.platform.workspace.jps.entities.ModuleEntity
import org.jetbrains.plugins.bsp.config.isBspProject
import org.jetbrains.plugins.bsp.coroutines.BspCoroutineService

/**
 * Clean up any modules showing up due to the platform hack
 * https://youtrack.jetbrains.com/issue/IDEA-321160/Platform-solution-for-the-initial-state-of-the-project-model-on-the-first-open
 */
class CounterPlatformProjectConfigurator : DirectoryProjectConfigurator {
  override fun configureProject(
    project: Project,
    baseDir: VirtualFile,
    moduleRef: Ref<Module>,
    isProjectCreatedWithWizard: Boolean,
  ) = configureProject(project)

  fun configureProject(project: Project) {
    if (!project.isBspProject) return

    val workspaceModel = WorkspaceModel.getInstance(project) as WorkspaceModelInternal
    val fakeModules =
      workspaceModel.entityStorage.current.entities(ModuleEntity::class.java)

    BspCoroutineService.getInstance(project).start {
      writeAction {
        workspaceModel.updateProjectModel("Counter platform fake modules") {
          fakeModules.forEach { fakeModule -> it.removeEntity(fakeModule) }
        }
      }
    }
  }
}
