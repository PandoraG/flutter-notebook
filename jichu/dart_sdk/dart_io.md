> [阅读原文](https://api.dart.dev/stable/2.6.0/dart-io/dart-io-library.html)

# dart:io 库

对非 Web 应用程序的 `File`，`socket`，`HTTP` 和其他 `I/O` 支持。

**重要提示**：基于浏览器的应用程序不能使用此库。只有`服务器`，`命令行脚本`和 `Flutter移动应用程序`才能导入和使用 `dart:io`。

该库使您可以处理文件(files)，目录(directories)，套接字(sockets)，进程(processes)，HTTP 服务器和客户端等。与输入和输出相关的许多操作都是异步的，并使用 [Futures](https://api.dart.dev/stable/2.6.0/dart-async/Future-class.html) 或 [Streams](https://api.dart.dev/stable/2.6.0/dart-async/Stream-class.html) 处理，这两者都在 `dart：async` 库中定义。

要在代码中使用`dart:io`库，请执行以下操作:

```dart
import 'dart:io';
```

有关 Dart 中 `I/O` 的介绍，请参见 [dart:io 库之旅](https://www.dartlang.org/dart-vm/io-library-tour)。

### 文件，目录和链接（File, Directory, and Link）

File，Directory 或 Link 的实例分别表示本机文件系统中的文件，目录或链接。

您可以通过这些类型的对象来操纵文件系统。例如，您可以重命名文件或目录：

```dart
File myFile = new File('myFile.txt');
myFile.rename('yourFile.txt').then((\_) => print('file renamed'));
```

File，Directory 和 Link 类提供的许多方法都是异步运行的，并返回 Future。

### FileSystemEntity

文件(File)，目录(Directory)和链接(Link)都扩展了 `FileSystemEntity`。除了作为这些类的超类之外，FileSystemEntity 还具有许多用于处理路径的静态方法。

要获取有关路径的信息，可以使用 `FileSystemEntity` 静态方法，例如`'isDirectory'`，`'isFile'`和`'exists'`。由于文件系统访问涉及 `I/O`，因此这些方法是异步的，并返回 Future。

```dart
FileSystemEntity.isDirectory(myPath).then((isDir) {
  if (isDir) {
    print('$myPath is a directory');
  } else {
    print('$myPath is not a directory');
  }
});
```

### HttpServer 和 HttpClient

[HttpServer](https://api.dart.dev/stable/2.6.0/dart-io/HttpServer-class.html) 和 [HttpClient](https://api.dart.dev/stable/2.6.0/dart-io/HttpClient-class.html) 类提供 HTTP 服务器和 HTTP 客户端功能。

[HttpServer](https://api.dart.dev/stable/2.6.0/dart-io/HttpServer-class.html) 类提供用于实现 HTTP 服务器的基本功能。对于某些更高级别的构建块，我们建议您尝试一下 [shelf](https://pub.dartlang.org/packages/shelf) pub package，其中包含一组高级类，这些类与该库中的 [HttpServer](https://api.dart.dev/stable/2.6.0/dart-io/HttpServer-class.html) 类一起使实现 HTTP 服务器更加容易。

### 进程（Process）

[Process](https://api.dart.dev/stable/2.6.0/dart-io/Process-class.html) 类提供了一种在本机上运行进程的方法。例如，以下代码产生一个递归列出 `Web` 下文件的进程。

```dart
Process.start('ls', ['-R', 'web']).then((process) {
  stdout.addStream(process.stdout);
  stderr.addStream(process.stderr);
  process.exitCode.then(print);
});
```

使用 `start()` 返回一个 `Future`，当流程开始时，它会以 [Process](https://api.dart.dev/stable/2.6.0/dart-io/Process-class.html) 对象完成。通过此 [Process](https://api.dart.dev/stable/2.6.0/dart-io/Process-class.html) 对象，您可以在 process 运行时与其进行交互。使用 `run（）`返回一个 Future，当生成的进程终止时，它会以 [`ProcessResult`](https://api.dart.dev/stable/2.6.0/dart-io/ProcessResult-class.html) 对象完成。此 [`ProcessResult`](https://api.dart.dev/stable/2.6.0/dart-io/ProcessResult-class.html) 对象收集 process 的输出和退出代码。

使用 `start()` 时，您需要读取来自 `stdout` 和 `stderr` 流的所有数据，否则将不会释放系统资源。

### WebSocket

[`WebSocket`](https://api.dart.dev/stable/2.6.0/dart-io/WebSocket-class.html) 类提供对 Web socket 协议的支持。这允许客户端和服务器应用程序之间的全双工通信(full-duplex communications)。

Web socket 服务器使用普通的 HTTP 服务器来接受 Web socket 连接。初始握手是 HTTP 请求，然后将其升级为 Web socket 连接。服务器使用 [`WebSocketTransformer`](https://api.dart.dev/stable/2.6.0/dart-io/WebSocketTransformer-class.html) 升级请求，并侦听返回的 Web socket 上的数据。例如，这是一个微型服务器，用于侦听 `WebSocket` 上的`“ws”`数据：

```dart
runZoned(() async {
  var server = await HttpServer.bind('127.0.0.1', 4040);
  server.listen((HttpRequest req) async {
    if (req.uri.path == '/ws') {
      var socket = await WebSocketTransformer.upgrade(req);
      socket.listen(handleMsg);
    }
  });
}, onError: (e) => print("An error occurred."));
```

客户端使用 `connect()`方法和使用 Web 套接字协议的 URI 连接到 WebSocket。客户端可以使用 `add()`方法写入 WebSocket。例如，

```dart
var socket = await WebSocket.connect('ws://127.0.0.1:4040/ws');
socket.add('Hello, World!');
```

检出 [websocket_sample](https://github.com/dart-lang/dart-samples/tree/master/html5/web/websockets/basics) 应用程序，该应用程序使用 WebSockets 与服务器进行通信。

### Socket and ServerSocket

客户端和服务器使用 Sockets 通过 `TCP` 协议进行通信。在服务器端使用 `ServerSocket`，在客户端使用 `Socket`。服务器使用 `bind()` 方法创建一个监听套接字(istening socket)，然后监听套接字上的传入连接。例如：

```dart
ServerSocket.bind('127.0.0.1', 4041)
  .then((serverSocket) {
    serverSocket.listen((socket) {
      socket.transform(utf8.decoder).listen(print);
    });
  });
```

客户端使用 `connect()` 方法连接 Socket，该方法返回 Future。使用 `write()`，`writeln()` 或 `writeAll()` 是通过 socket 发送数据的最简单方法。例如：

```dart
Socket.connect('127.0.0.1', 4041).then((socket) {
   socket.write('Hello, World!');
});
```

除了 [`Socket`](https://api.dart.dev/stable/2.6.0/dart-io/Socket-class.html) 和 [`ServerSocket`](https://api.dart.dev/stable/2.6.0/dart-io/ServerSocket-class.html) 外，还可以使用 [`RawSocket`](https://api.dart.dev/stable/2.6.0/dart-io/RawSocket-class.html) 和 [`RawServerSocket`](https://api.dart.dev/stable/2.6.0/dart-io/RawServerSocket-class.html) 类对异步套接字 `IO` 进行较低级别的访问。

### 标准输出，错误和输入流

该库提供标准的输出(output)，错误(error)和输入(input)流，分别名为“ stdout”，“ stderr”和“ stdin”。

stdout 和 stderr 流都是 IOSink，并且具有相同的方法和属性集。

要将字符串写入 'stdout'：

```dart
stdout.writeln('Hello, World!');
```

要将对象列表写入 'stderr'：

```dart
stderr.writeAll([ 'That ', 'is ', 'an ', 'error.', '\n']);
```

标准输入流是真正的 [Stream](https://api.dart.dev/stable/2.6.0/dart-async/Stream-class.html)，因此它从 Stream 类继承属性和方法。

要从命令行同步读取文本（程序阻止等待用户键入信息）：

```dart
 String inputText = stdin.readLineSync();
```

## 包含的类
