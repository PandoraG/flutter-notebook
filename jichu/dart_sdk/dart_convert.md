> [阅读原文](https://api.dart.dev/stable/2.6.0/dart-convert/dart-convert-library.html)

# dart:convert 库

编码器和解码器，用于在不同的数据表示形式（包括 JSON 和 UTF-8）之间进行转换。

除了用于通用数据表示的转换器之外，该库还提供了对实现转换器的支持，使转换器易于链接和与流（streams）一起使用。

使用该库：

```dart
import 'dart:convert';
```

两个常用的转换器是 `JsonCodec` 和 `Utf8Codec` 的顶级实例（top-level instances），分别命名为 `json` 和 `utf8`。

- JSON 是一种简单的文本格式，用于表示结构化对象和集合。 `JSON编码器/解码器` 使用 JSON 格式在字符串和对象结构（例如列表和映射）之间进行转换。

- UTF-8 是一种常见的可变宽度编码，可以表示 Unicode 字符集中的每个字符。 `UTF-8编码器/解码器` 在字符串和字节之间转换。

转换器(Converters)通常与流(streams)一起使用，以转换流中可用的数据。以下代码使用两个转换器。第一个是 `UTF-8` 解码器，它将从文件中读取的数据从字节转换为 UTF-8，第二个是 `LineSplitter` 的实例，该实例在换行符边界上拆分数据。

```dart
var lineNumber = 1;
var stream = File('quotes.txt').openRead();

stream.transform(utf8.decoder)
      .transform(const LineSplitter())
      .listen((line) {
        if (showLineNumbers) {
          stdout.write('${lineNumber++} ');
        }
        stdout.writeln(line);
      });
```

See the documentation for the Codec and Converter classes for information about creating your own converters.

有关创建自己的转换器的信息，请参见 [Codec](https://api.dart.dev/stable/2.6.0/dart-convert/Codec-class.html) 和 [Converter](https://api.dart.dev/stable/2.6.0/dart-convert/Converter-class.html) 类的文档。

## 类
