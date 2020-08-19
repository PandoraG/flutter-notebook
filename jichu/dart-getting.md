# 1、Dart 基础知识

## 1.1 程序入口

Js 没有预定义的入口函数，但在 Dart 中，每个 app 都必须有一个顶级的 `main()` 函数作为应用程序的入口点。

```dart
// Dart
main() {
}
```

> [DartPad](https://dartpad.dev/)是 Dart 的一个线上 playground, 提供 Dart 线上 playground 还有：[Online dart compiler](https://www.tutorialspoint.com/execute_dart_online.php)

## 1.2 控制台输出

要在 Dart 中打印到控制台，可使用 `print`:

```js
// js
console.log('hello world');

// dart
print('hello world');
```

## 1.3 变量

**Dart 是类型安全的** - 它使用静态类型检查和运行时的组合，检查以确保变量的值始终与变量的静态值匹配 类型。尽管类型是必须的，但某些类型注释是可选的，因为 Dart 会执行类型推断。

### 1.3.1 创建变量

在 js 中，无法定义变量类型。

在 dart 中，变量必须是明确的 类型和系统能够解析的类型。

```
// js
var name = 'js'

// dart
String name = 'dart';  //明确指定是String类型
var othername = 'Dart'; //推断为string
// 以上两种情况在dart中都是可行的
```

### 1.3.2 默认值

在 js 中，未初始化的变量是 undefined。
在 dart 中，未初始化的变量的初始值是 null。

> 注意：数字在 Dart 中也被当成对象，所以只要是带有数字类型的未初始化变量的值都是 “null”。

```js
// js
var name; // == undefined
// Dart
var name; // == null
int x; // == null
```

## 1.4 检查 null 或零

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

从 Dart 1.12 开始，`null-aware运算符` 可用帮助我们做`null`检查：

```js
bool isConnected(a, b) {
    bool outConn = outgoing[a]?.contains(b) ?? false;
    bool inConn = incoing[a].contains(b) ?? false;
    return outConn || isConn;
}
```

`?.`运算符在左边为 null 情况下会阻断右边的调用，`??`运算符主要作用是在左侧表达式为 null 时为其设置默认值。

对于表达式：

```js
outgoing[a]?.contains(b);
```

如果 outgoing 为 null 或 outgoing[a]为 null 或 contains(b)的值为 null，都会导致表达式为 null。

```dart
print(null ?? false) //false
print(false ?? 11); //11
print(true ?? false); //true
```

> 技巧： 获取一个对象中数组的长度： searchModel?.data?.length ?? 0。

## 1.5 Functions

Dart 和 JavaScript 函数类似，主要区别是声明：

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

与 Js 一样，Dart 支持单线程执行。在 JavaScript 中，`Promise`对象表示异步操作的最终完成（或失败）及其结果值，Dart 中使用 `Future` 来表示异步操作：

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

在 Dart 中，`async`函数返回一个`Future`, 函数的主题是稍后执行的。`await`运算符用于等待 `Future`。

```dart
_getIpAddress() async {
    final url = 'https://httpbin.org/ip';
    var request = await HttpRequest.request(url); //通过await标识请求，返回的是一个Future
    String ip = json.decode(request.responseText['origin']) //通过resposneText获取具体ip
    print(ip)
}
```
