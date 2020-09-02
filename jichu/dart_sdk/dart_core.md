> [原文](https://api.flutter.dev/flutter/dart-core/dart-core-library.html)

# dart:core 库

每个 Dart 程序的内置类型（types），集合(collections)和其他核心功能(core functionality)。

该库是自动导入的。

该库中的某些类（例如 String 和 num）支持 Dart 的内置数据类型。其他类，例如 List 和 Map，提供了用于管理对象集合的数据结构。还有其他类表示常用的数据类型，例如 URI，日期和时间以及错误。

## 数字和布尔值

int 和 double 提供对 Dart 内置数字数据类型的支持：分别为整数和双精度浮点数。 bool 类型的对象为 true 或 false。这些类型的变量可以从文字(literals)构造：

```dart
int meaningOfLife = 42;
double valueOfPi  = 3.141592;
bool visible      = true;
```

## 字符串和正则表达式

字符串是不可变的，代表一系列字符。

```dart
String shakespeareQuote = "All the world's a stage, ...";
```

[StringBuffer](https://api.flutter.dev/flutter/dart-core/StringBuffer-class.html) 提供了一种有效构造字符串的方法。

```dart
StringBuffer moreShakespeare = new StringBuffer();
moreShakespeare.write('And all the men and women ');
moreShakespeare.write('merely players; ...');
```

`String` 和 `StringBuffer` 类实现字符串连接，插值和其他字符串操作功能。

```dart
String philosophy = 'Live on ';
String get palindrome => philosophy + philosophy.split('').reversed.join();
```

[RegExp](https://api.flutter.dev/flutter/dart-core/RegExp-class.html) 实现 `Dart` 正则表达式，该正则表达式提供了用于匹配文本内的模式的语法。例如，这是一个匹配一个或多个数字的字符串的正则表达式：

```dart
var numbers = new RegExp(r'\d+');
```

Dart 正则表达式与 JavaScript 正则表达式具有相同的语法和语义。有关 JavaScript 正则表达式的规范，请参见 [ecma-international.org/ecma-262/5.1/#sec-15.10](http://ecma-international.org/ecma-262/5.1/#sec-15.10)。

## 集合（Collections）

`dart:core` 库提供了基本集合，例如 [List](https://api.flutter.dev/flutter/dart-core/List-class.html)，[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html) 和 [Set](https://api.flutter.dev/flutter/dart-core/Set-class.html)。

列表(List)是对象的有序集合，具有一定长度。List 有时称为数组。当需要按索引访问对象时，请使用 List。

```dart
List superheroes = [ 'Batman', 'Superman', 'Harry Potter' ];
```

`Set` 是一个无重复项且无序对象集合。您无法按 index（position）获得 item。如果你添加了重复的项则会无效。

```dart
Set villains = new Set();
villains.add('Joker');
villains.addAll( ['Lex Luther', 'Voldemort'] );
```

`Map` 是无序的键值对集合。`Map` 有时称为关联数组，因为映射(maps)将键关联到某个值(value)以便于检索。键(Keys)是唯一的。需要通过唯一标识符访问对象时请使用 `Map`。

```dart
Map sidekicks = { 'Batman': 'Robin',
                  'Superman': 'Lois Lane',
                  'Harry Potter': 'Ron and Hermione' };
```

除了这些类之外，`dart:core` 包含 [`Iterable`](https://api.flutter.dev/flutter/dart-core/Iterable-class.html)，这是一个接口，用于定义对象集合中常见的功能。例如：在集合中的每个元素上运行功能，对每个元素进行测试，检索对象以及确定长度的能力。

`Iterable` 由 List 和 Set 实现，并通过 Map 关联键和值。

对于其他种类的集合，请查看 `art:collection` 库。

## 日期与时间（Date and time）

使用 [`DateTime`](https://api.flutter.dev/flutter/dart-core/DateTime-class.html) 表示一个时间点，并使用 [`Duration`](https://api.flutter.dev/flutter/dart-core/Duration-class.html) 表示时间跨度。

您可以使用构造函数或通过解析正确格式的字符串来创建 `DateTime` 对象。

```dart
DateTime now = new DateTime.now();
DateTime berlinWallFell = new DateTime(1989, 11, 9);
DateTime moonLanding = DateTime.parse("1969-07-20");
```

创建一个 `Duration` 对象，指定各个时间单位。

```dart
Duration timeRemaining = new Duration(hours:56, minutes:14);
```

除了 `DateTime` 和 `Duration` 之外，`dart:core` 包含用于测量经过时间的 `Stopwatch`类。

## Uri

A Uri object represents a uniform resource identifier, which identifies a resource on the web.

```dart
Uri dartlang = Uri.parse('http://dartlang.org/');
```

## 错误（Errors）

[Error](https://api.flutter.dev/flutter/dart-core/Error-class.html) 类表示运行时发生错误。此类的子类表示特定类型的错误。

## 其他文件（Other documentation）

有关如何使用内置类型的更多信息，请参阅[Dart：启动和运行](http://www.dartlang.org/docs/dart-up-and-running/)第二章中的[内置类型](http://www.dartlang.org/docs/dart-up-and-running/contents/ch02.html#built-in-types)。

另外，请参阅 [dart:core - Numbers, Collections, Strings, and More](https://www.dartlang.org/docs/dart-up-and-running/ch03.html#dartcore---numbers-collections-strings-and-more) 有关此包中类的更多信息。

另外，有关此包中类的更多信息，请参见 dart：core-数字，集合，字符串和更多内容。

[Dart 语言规范提](http://www.dartlang.org/docs/spec/)供了技术细节。

## Classes
