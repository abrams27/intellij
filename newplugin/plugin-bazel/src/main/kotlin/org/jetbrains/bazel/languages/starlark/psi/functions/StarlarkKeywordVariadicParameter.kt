package org.jetbrains.bazel.languages.starlark.psi.functions

import com.intellij.lang.ASTNode
import org.jetbrains.bazel.languages.starlark.psi.StarlarkElementVisitor

class StarlarkKeywordVariadicParameter(node: ASTNode) : StarlarkParameter(node) {
  override fun acceptVisitor(visitor: StarlarkElementVisitor) = visitor.visitKeywordVariadicParameter(this)
}
