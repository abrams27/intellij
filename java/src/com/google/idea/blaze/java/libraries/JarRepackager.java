/*
 * Copyright 2022 The Bazel Authors. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.google.idea.blaze.java.libraries;

import com.intellij.ide.plugins.IdeaPluginDescriptor;
import com.intellij.ide.plugins.PluginManager;
import com.intellij.ide.plugins.PluginManagerCore;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Arrays;

/** Invoke //third_party/intellij/plugin/build_defs:repackager_deploy.jar to repackage jars */
public final class JarRepackager {
  private static final String REPACKAGE_PREFIX = "ij_repackaged_";
  private static final Path RULES = getBinPath().resolve("rules");
  private static final Path JAR = getBinPath().resolve("repackager_deploy.jar");

  /* Get the repackaged jar file name according to its original one */
  public static String getRepackagedJarName(String originalJarName) {
    return REPACKAGE_PREFIX + originalJarName;
  }

  /* Get the original jar file name according to its repackaged one */
  public static String getOriginalJarName(String repackagedJarName) {
    return repackagedJarName.substring(repackagedJarName.indexOf(REPACKAGE_PREFIX) + 1);
  }

  /**
   * Replace package name in classes according to RULES and create a repackaged jar in same
   * directory.
   */
  public static void processJar(File jar) throws IOException, InterruptedException {
    if (!isEnabled()) {
      return;
    }
    File repackagedFile = new File(jar.getParent(), REPACKAGE_PREFIX + jar.getName());
    // Invoke com.google.idea.repackager.Repackager directly will lead to package version conflict.
    // So use the binary instead.
    ProcessBuilder processBuilder =
        new ProcessBuilder(
            Arrays.asList(
                "java",
                "-jar",
                JAR.toAbsolutePath().toString(),
                "--input=" + jar.getAbsolutePath(),
                "--output=" + repackagedFile.getAbsolutePath(),
                "--rules=" + RULES.toAbsolutePath()));
    processBuilder.redirectErrorStream(true);
    Process process = processBuilder.start();
    process.waitFor();
  }

  private static boolean isEnabled() {
    return Files.exists(JAR) && Files.exists(RULES);
  }

  private static Path getBinPath() {
    IdeaPluginDescriptor plugin =
        PluginManagerCore.getPlugin(
            PluginManager.getPluginByClassName(JarRepackager.class.getName()));
    return plugin.getPluginPath().resolve("bin");
  }

  private JarRepackager() {}
}
