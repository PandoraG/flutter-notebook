> [阅读原文](https://api.dart.dev/stable/2.6.0/dart-async/dart-async-library.html)

# dart:async 库

支持诸如 Future 和 Stream 之类的异步编程。

了解 [Future](https://api.dart.dev/stable/2.6.0/dart-async/Future-class.html)s 和 [Streams](https://api.dart.dev/stable/2.6.0/dart-async/Stream-class.html) 是编写任何 Dart 程序的先决条件。

要在您的代码中使用此库：

```dart
import 'dart:async';
```

### Future

`Future` 对象表示其返回值可能尚不可用的计算。当将来某个时候完成时，Future 返回计算的值。Futures 通常用于潜在的冗长计算，例如 `I/O` 和与用户的交互。

执行任务时，Dart 库中的许多方法都会返回 Future。例如，将 `HttpServer` 绑定到主机和端口时，`bind()`方法将返回 Future。

```dart
HttpServer.bind('127.0.0.1', 4444)
     .then((server) => print('${server.isBroadcast}'))
     .catchError(print);
```

`Future.then` 注册一个回调函数，该函数在 `Future` 的操作（在本例中为 `bind()`方法）成功完成时运行。该操作返回的值将传递到回调函数中。在此示例中，`bind()` 方法返回 `HttpServer` 对象。回调函数将打印其属性之一。 `Future.catchError` 注册一个回调函数，如果在 `Future` 中发生错误，该函数将运行。

### Stream

Stream 提供异步的数据序列。数据序列的示例包括单个事件（例如鼠标单击）或较大数据的连续块（​​ 例如带有文件内容的多个字节列表，例如鼠标单击）以及从文件读取的字节列表流。以下示例打开一个文件以供读取。 `Stream.listen` 注册一个回调函数，该函数在每次有更多数据可用时运行。

```dart
Stream<List<int>> stream = new File('quotes.txt').openRead();
stream.transform(utf8.decoder).listen(print);
```

该流发出一系列字节列表。程序必须解释字节或处理原始字节数据。在这里，代码使用 `UTF-8` 解码器（在 `dart:convert` 库中提供）将字节序列转换为 Dart 字符串序列。

流的另一个常见用法是用于 Web 应用程序中用户生成的事件：以下代码侦听按钮上的鼠标单击。

```dart
querySelector('#myButton').onClick.listen((_) => print('Click.'));
```

### 其他资源

- [dart:async 库之旅](https://www.dartlang.org/docs/dart-up-and-running/ch03.html#dartasync---asynchronous-programming): 异步的简要概述。

- [Use Future-Based APIs](https://www.dartlang.org/docs/tutorials/futures/): 仔细研究 Futures 以及如何使用它们编写异步 Dart 代码。

- [Futures 与错误处理](https://www.dartlang.org/articles/futures-and-error-handling/): 您想要了解与使用 Future 时处理错误和异常有关的所有信息（但不敢问）。

- [事件循环与 Dart](https://www.dartlang.org/articles/event-loop/): 了解 Dart 如何处理事件队列和微任务队列，以便您编写具有更少“惊喜”的更好的异步代码。

- [test package: Asynchronous Tests](https://pub.dartlang.org/packages/test): 如何测试异步代码。

## 类
