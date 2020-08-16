# 1、Dart 基础知识

## 1.1 程序入口

Js 没有预定义的入口函数，但在 Dart 中，每个app都必须有一个顶级的 `main()` 函数作为应用程序的入口点。
```dart
// Dart
main() {
}
```

> [DartPad](https://dartpad.dev/)是Dart的一个线上playground, 提供Dart线上playground还有：[Online dart compiler](https://www.tutorialspoint.com/execute_dart_online.php)

## 1.2 控制台输出

要在Dart中打印到控制台，可使用 `print`:
```js
// js
console.log("hello world");

// dart
print('hello world')
```

## 1.3 变量

**Dart是类型安全的** - 它使用静态类型检查和运行时的组合，检查以确保变量的值始终与变量的静态值匹配 类型。尽管类型是必须的，但某些类型注释是可选的，因为 Dart 会执行类型推断。

### 1.3.1 创建变量
在js中，无法定义变量类型。

在dart中，变量必须是明确的 类型和系统能够解析的类型。
```
// js
var name = 'js'

// dart
String name = 'dart';  //明确指定是String类型
var othername = 'Dart'; //推断为string
// 以上两种情况在dart中都是可行的
```

### 1.3.2 默认值

在js中，未初始化的变量是undefined。
在dart中，未初始化的变量的初始值是null。

> 注意：数字在 Dart 中也被当成对象，所以只要是带有数字类型的未初始化变量的值都是 “null”。

```js
// js
var name; // == undefined
// Dart
var name; // == null
int x; // == null
```


## 1.4 检查null或零

在 Js 中， `1`或任何非 `null` 对象的值被视为 `true`。
```js
// Js
var myNull = null;
if (!myNull) {
    console.log('null is treated as false');
} 
var zero = 0;
if (!zero) {
    console.log("0 is treated as false);
}
```

在 Dart 中，只有布尔值 “true”被视为 `true`。
```dart
// Dart
var myNull = null;
if (myNull == null) {
    print('user "== null" to check null');
} 
var zero = 0;
if (zero == 0) {
    print('user "== 0" to check zero');
}
```

### 1.4.1 Dart null 检查最佳实践

从Dart 1.12开始，`null-aware运算符` 可用帮助我们做`null`检查：
```js
bool isConnected(a, b) {
    bool outConn = outgoing[a]?.contains(b) ?? false;
    bool inConn = incoing[a].contains(b) ?? false;
    return outConn || isConn;
}
```

`?.`运算符在左边为null情况下会阻断右边的调用，`??`运算符主要作用是在左侧表达式为null时为其设置默认值。

对于表达式：
```js
outgoing[a]?.contains(b)
```
如果outgoing为null或outgoing[a]为null或contains(b)的值为null，都会导致表达式为null。

```dart
print(null ?? false) //false
print(false ?? 11); //11
print(true ?? false); //true
```

> 技巧： 获取一个对象中数组的长度： searchModel?.data?.length ?? 0。

## 1.5 Functions

Dart和JavaScript函数类似，主要区别是声明：
```js
// js es5
function fn() {
    return true;
}

// Dart
fn() {
    return false;
}
// 也可以写成这样
bool fn() {
    return false;
}
```

## 1.6 异步编程

### 1.6.1 Futures

与 Js 一样，Dart支持单线程执行。在JavaScript中，`Promise`对象表示异步操作的最终完成（或失败）及其结果值，Dart中使用 `Future` 来表示异步操作：

```js
// js
_getIpAddress = () => {
    const url = 'https://httpbin.org/ip';
    return fetch(url)
        .then(response => response.json());
        .then(responseJson => {
            console.log(responseJson.origin());
        })
        .catch(error => {
            console.error(error);
        })
}
// Dart
_getIpAddress() {
    final url = 'https://httpbin.org/ip';
    HttpRequest.request(url).then((value) {
        print(json.decode(value.responseText)['origin']);
    }).catchError((error) => print(error));
}
```

实例：
```dart
import 'dart:convert';
import 'dart:html';

void main() {
    _getIpAddress() {
        final url = 'https://httpbin.org/ip';
        Future<HttpRequest> request = HttpRequest.request(url);
        request.then((value) {
            print(json.decode(value.responseText)['origin']);
        }).catchError((error) => print(error));
    }
    _getIpAddress();
}

```

### 1.6.2 async 和 await

`async` 函数声明定义一个异步函数。

在 JavaScript 中，`async`函数返回一个 `Promise` 对象。`await`运算符是用在等待`Promise`；
```js
// javascript
async _getIpAddress() {
    const url = 'https://httpbin.org/ip';
    const response = await fetch(url);
    const json = await response.json();
    const data = await json.origin();
    console.log(data);
}
```

在Dart中，`async`函数返回一个`Future`, 函数的主题是稍后执行的。`await`运算符用于等待 `Future`。
```dart 
_getIpAddress() async {
    final url = 'https://httpbin.org/ip';
    var request = await HttpRequest.request(url); //通过await标识请求，返回的是一个Future
    String ip = json.decode(request.responseText['origin']) //通过resposneText获取具体ip
    print(ip)
}
```



# 2、什么是声明式UI

Flutter 采用了声明性UI布局方式，为了帮助大家快速上手，我们要先学习什么是声明式UI, 以及它和我们常用的命令式UI的异同。

## 2.1 为什么是声明式UI？

从Win32到Web在到Android和iOS的框架通常使用命令式的UI编程风格。这可能是我们最熟悉的样式 - 你手动构建全功能UI实体（如UIView或等效实体），然后在UI更改时使用方法对其进行更改。

为了减轻开发人员在各种UI状态之间转换的编程负担，Flutter让开发人员描述当前的UI状态，并不需要关心她是如何过渡到框架。

> 虽然声明式UI能帮我们减轻很多负担，但大家要将布局的思维方式要转变过来。

## 2.2 如何在声明框架中更改UI?

下面是个简单的例子：


为了将上图左侧样式改成右边的样子，在命令样式中，我们通常会获取的ViewB的实例，然后改变其颜色，然后将启动的元素删除，在添加ViewC c3:
```js
// Imperative style
b.setColor(red)
b.clearChildren()
ViewC c3 = new ViewC(...)
b.add(c3)
```

在声明式UI中，视图配置（例如Flutter的widget）是不变的，并且只是轻量级“蓝图”。要更改UI，Widget会在自身上触发重建（最常见的是通过在Flutter中的StatefulWidgets上调用setState()) 并构建一个新的 Widgets 子树：
```dart
// Declarative style
return ViewB(
    color: red,
    child: ViewC(....),
)
```

这里，Flutter构建新的Widget实例，而不是在UI更改时改变旧实例b。 该框架使用 RenderObjects管理传统UI对象的许多职责（例如维护布局的状态）。RenderObjects在帧之间保持不变，Flutter的轻量级 Widgets告诉框架在状态 RenderObjects，接下来Flutter框架会处理其与部分。


# 3、Flutter入门基础知识

## 3.1 如何创建Flutter项目？

要创建一个Flutter项目有一下两种方式：
 - 从命令行使用flutter create命令。确保flutter SDK配置了环境变量。
 - 使用安装了Flutter和Dart插件的IDE。
```bash
$ flutter create <projectname>
```

## 3.2 如何运行Flutter项目？

在Flutter中，我们通过以下两种方式来运行项目：
 - 从项目的根目录使用 `flutter run`。
 - 在带有Flutter和Dart插件的IDE中使用 “run” 选项。

```bash
$ flutter run -d 'iphone X'
```

> `d` 后面跟的是具体的设备名称，可以是Android或iOS模拟器的名字，也可以一台已经连接到电脑上的Android或iOS的设备。

## 3.3 如何导入Widget?

在Flutter中，要使用 `Material Design` 库中的小部件，则需要导入 `material.dart` 包。要使用iOS样式widget, 请导入`Cupertino` 库。要使用更基本的窗口 widget 集，请导widget库。或者，当然，也可以导入自己编写的widget:

```dart
import 'package:flutter/material.dart'; //导入系统material widget库
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/my_widgets.dart'; //导入自己的widget
```

无论您导入哪个widget包，Dart都只会导入在您的应用中使用的widget。


## 3.4 如何写一个Hello world?

在Flutter中，您可以创建一个完全相同的“Hello world!” 应用程序使用核心窗口小部件库中Center和Text窗口小部件。Center窗口小部件成为窗口小部件树的根，并且有一个子窗口，即“Text”窗口小部件。

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

得益于Flutter强大的封装能力，我们不难发现实现相同的功能，Flutter要比RN少很多代码。

## 3.5 如何使用Widget并将其嵌套以形成Widget树？

在Flutter中，几乎所有东西都是widget。

widget是用户界面的基本构建块，您将widget组成一个层次结构，调用widget树。每个窗口widget都嵌套在父窗口widget中，并从其父窗口继承属性。甚至应用程序对象本身也是一个组件，并没有单独的“应用程序”对象。相反，根widget担任此角色。

Widget可以定义：
 - 结构元素 - 如按钮或菜单
 - 文本元素 - 像字体或颜色主题
 - 类似布局的填充或对齐的一个方向

以下示例使用 `Material` 库中的 Widget 显示“Hello world!” 应用程序。在此示例中，widget树嵌套在MaterialApp的根widget中。

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
以上图片显示了使用Material Design小部件构建的“Hello world!"。


## 3.6 如何创建可重用Widget?

在Flutter中，同样需要定义一个类来创建自定义widget，然后重用widget。您还可以定义和调用返回可重用小部件的函数，如以下示例中的构建函数所示：
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
在前面的例子中，CustomCard类的构造函数使用Dart的大括号语法{}来配置[可选参数]()。

如果要表示必须的字段，请从构造函数中删除花括号，或者将@required添加到构造函数中。


# 4、项目结构、资源、依赖和本地化

## 4.1 项目的结构时怎样子的？

## 4.2 在哪里归档图片资源以及如何处理不同分辨率？

## 4.3 如何归档strings资源，以及如何处理不同语言？

## 4.4 如何添加Flutter项目所需的依赖？

# 5、认识视图（Views）


# 6、布局与列表


# 7、状态管理


# 8、路由与导航


# 9、线程与异步UI


# 10、手势检测及触摸事件处理


# 11、主题和文字处理


# 12、表单输入与富文本


# 13、调用硬件、第三方服务以及平台交互、通知



