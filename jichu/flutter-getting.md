## 1 如何创建 Flutter 项目？

要创建一个 Flutter 项目有一下两种方式：

- 从命令行使用 flutter create 命令。确保 flutter SDK 配置了环境变量。
- 使用安装了 Flutter 和 Dart 插件的 IDE。

```bash
$ flutter create <projectname>
```

## 2 如何运行 Flutter 项目？

在 Flutter 中，我们通过以下两种方式来运行项目：

- 从项目的根目录使用 `flutter run`。
- 在带有 Flutter 和 Dart 插件的 IDE 中使用 “run” 选项。

```bash
$ flutter run -d 'iphone X'
```

> `d` 后面跟的是具体的设备名称，可以是 Android 或 iOS 模拟器的名字，也可以一台已经连接到电脑上的 Android 或 iOS 的设备。

## 3 如何导入 Widget?

在 Flutter 中，要使用 `Material Design` 库中的小部件，则需要导入 `material.dart` 包。要使用 iOS 样式 widget, 请导入`Cupertino` 库。要使用更基本的窗口 widget 集，请导 widget 库。或者，当然，也可以导入自己编写的 widget:

```dart
import 'package:flutter/material.dart'; //导入系统material widget库
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/my_widgets.dart'; //导入自己的widget
```

无论您导入哪个 widget 包，Dart 都只会导入在您的应用中使用的 widget。

## 4 如何写一个 Hello world?

在 Flutter 中，您可以创建一个完全相同的“Hello world!” 应用程序使用核心窗口小部件库中 Center 和 Text 窗口小部件。Center 窗口小部件成为窗口小部件树的根，并且有一个子窗口，即“Text”窗口小部件。

```dart
// Flutter
import 'package:flutter/material.dart';

void main() {
    runApp(
        Center(
            child: Text(
                'Hello world!',
                textDirection: TextDirection.ltr,
            ),
        ),
    );
}
```

得益于 Flutter 强大的封装能力，我们不难发现实现相同的功能，Flutter 要比 RN 少很多代码。

## 5 如何使用 Widget 并将其嵌套以形成 Widget 树？

在 Flutter 中，几乎所有东西都是 widget。

widget 是用户界面的基本构建块，您将 widget 组成一个层次结构，调用 widget 树。每个窗口 widget 都嵌套在父窗口 widget 中，并从其父窗口继承属性。甚至应用程序对象本身也是一个组件，并没有单独的“应用程序”对象。相反，根 widget 担任此角色。

Widget 可以定义：

- 结构元素 - 如按钮或菜单
- 文本元素 - 像字体或颜色主题
- 类似布局的填充或对齐的一个方向

以下示例使用 `Material` 库中的 Widget 显示“Hello world!” 应用程序。在此示例中，widget 树嵌套在 MaterialApp 的根 widget 中。

```dart
// Flutter
import 'package:flutter/material.dart';

void main() => runApp(myApp());

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Welcome to Flutter',
            home: Scaffold(
                appBar: AppBar(
                    title: Text('Welcome to Flutter'),
                ),
                body: Center(
                    child: Text('Hello world'),
                ),
            ),
        );
    }
}
```

以上图片显示了使用 Material Design 小部件构建的“Hello world!"。

## 6 如何创建可重用 Widget?

在 Flutter 中，同样需要定义一个类来创建自定义 widget，然后重用 widget。您还可以定义和调用返回可重用小部件的函数，如以下示例中的构建函数所示：

```dart
//Flutter
class CustomCard extents StatelessWidget {
    CustomCard({@required this.index, @required this.onPress});

    final index;
    final Function onPress;

    @override
    Widget build(BuildContext context) {
        return Card(
            child: Column(
                children: <Widget> [
                    Text('Card  $index'),
                    FlatButton(
                        child: const Text('Press'),
                        onPressed: this.onPress,
                    ),
                ],
            )
        );
    }
}
    ...

// Usage
CustomCard(
    index: index,
    onPress: () {
        print('Card $index');
    },
)
   ...
```

在前面的例子中，CustomCard 类的构造函数使用 Dart 的大括号语法{}来配置[可选参数]()。

如果要表示必须的字段，请从构造函数中删除花括号，或者将@required 添加到构造函数中。
