- [shared_preferences | pub.dev](https://dart-pub.mirrors.sjtug.sjtu.edu.cn/packages/shared_preferences)
- [Flutter数据存储之shared_preferences](https://www.jianshu.com/p/735b5684e900)
- [Flutter 基于 shared_preferences 进行持久化键值存储](http://www.ptbird.cn/flutter_shared_preferences.html)

---

【翻译】

# Shared preferences plugin（共享首选项插件）


包装特定于平台的持久性存储以获取简单数据
（iOS和macOS上为NSUserDefaults，Android上为SharedPreferences等）。数据可以异步保存到磁盘，
并且不能保证写入将在之后保留到磁盘
返回，因此该插件不得用于存储关键数据。


**请设置约束为 `shared_preferences: '>=0.5.y+x <2.0.0'`**

## 向后兼容1.0.0版本即将推出

插件已达到稳定的API，我们保证版本“ 1.0.0”将与“ 0.5.y + z”向后兼容。

请使用`shared_preferences：'> = 0.5.y + x <2.0.0'作为您的依赖项约束，以允许更顺畅的生态系统迁移。

有关更多详细信息，请参见：https://github.com/flutter/flutter/wiki/Package-migration-to-1.0.0 

## 用法
要使用此插件，请将`shared_preferences`添加为 [pubspec.yaml文件中的依赖项](https://flutter.io/platform-plugins/).

### Example

``` dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
      child: RaisedButton(
        onPressed: _incrementCounter,
        child: Text('Increment Counter'),
        ),
      ),
    ),
  ));
}

_incrementCounter() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int counter = (prefs.getInt('counter') ?? 0) + 1;
  print('Pressed $counter times.');
  await prefs.setInt('counter', counter);
}
```

### Testing

您可以通过运行以下代码在测试中使用初始值填充“ SharedPreferences”：

```dart
SharedPreferences.setMockInitialValues (Map<String, dynamic> values);
```
