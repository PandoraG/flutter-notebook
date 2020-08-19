# 1、什么是声明式 UI

Flutter 采用了声明性 UI 布局方式，为了帮助大家快速上手，我们要先学习什么是声明式 UI, 以及它和我们常用的命令式 UI 的异同。

## 1.1 为什么是声明式 UI？

从 Win32 到 Web 在到 Android 和 iOS 的框架通常使用命令式的 UI 编程风格。这可能是我们最熟悉的样式 - 你手动构建全功能 UI 实体（如 UIView 或等效实体），然后在 UI 更改时使用方法对其进行更改。

为了减轻开发人员在各种 UI 状态之间转换的编程负担，Flutter 让开发人员描述当前的 UI 状态，并不需要关心她是如何过渡到框架。

> 虽然声明式 UI 能帮我们减轻很多负担，但大家要将布局的思维方式要转变过来。

## 1.2 如何在声明框架中更改 UI?

下面是个简单的例子：

为了将上图左侧样式改成右边的样子，在命令样式中，我们通常会获取的 ViewB 的实例，然后改变其颜色，然后将启动的元素删除，在添加 ViewC c3:

```js
// Imperative style
b.setColor(red)
b.clearChildren()
ViewC c3 = new ViewC(...)
b.add(c3)
```

在声明式 UI 中，视图配置（例如 Flutter 的 widget）是不变的，并且只是轻量级“蓝图”。要更改 UI，Widget 会在自身上触发重建（最常见的是通过在 Flutter 中的 StatefulWidgets 上调用 setState()) 并构建一个新的 Widgets 子树：

```dart
// Declarative style
return ViewB(
    color: red,
    child: ViewC(....),
)
```

这里，Flutter 构建新的 Widget 实例，而不是在 UI 更改时改变旧实例 b。 该框架使用 RenderObjects 管理传统 UI 对象的许多职责（例如维护布局的状态）。RenderObjects 在帧之间保持不变，Flutter 的轻量级 Widgets 告诉框架在状态 RenderObjects，接下来 Flutter 框架会处理其与部分。
