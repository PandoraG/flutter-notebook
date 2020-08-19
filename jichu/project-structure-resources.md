
## 1 项目的结构时怎样子的？

```
projextnam
   android      - Android部分的工程文件
   build        - 项目的构建输出目录
   ios          - ios部分的工程文件
   lib          - 项目中的Dart源文件
      src         - 包含其他源码的文件
      main.dart   - 自动生成的项目入口文件，类似于RN的index.js文件
   test           - 测试相关文件
   pubspec.yaml   - 项目依赖配置文件类似于RN的package.json
```

## 2 在哪里归档图片资源以及如何处理不同分辨率？

- 虽然 Android 将 resources 和 assets 区别对待，但在 Flutter 中它们都会被作为 assets 处理，所
  有存在于 Android 上 `res / drawable- *` 文件夹中的资源都放在 Flutter 的 assets 文件夹中。
- 与 Android 类似，iOS 同样将 images 和 assets 作为不同的东西，而 Flutter 中只有 assets。
  被放到 iOS 中 Images.xcasset 文件央下的资源在 Rutter 中被放到了 assets 文件央中。

在 Flutter 中 assets 可以是任意类型的文件，而不仅仅是图片。 例如，你可以把 json 文件放置到 my-assets 文件夹中。

```
my-assets/data.json
```

记得在 pubspec.yaml 文件中声明 assets :

```
assets:
  - my-assets/data.json
```

然后在代码中我们可以通过 AssetBundle 来访问它:

```dart
import 'dart:async' show Future;
import 'package:f1utter/services.dart' show rootBundle;
Future<String> loadAsset() async {
    return await rpotBundle.loadString('my-assets/data.json');
}
```

对于图片，Flutter 像 iOS—样，遵循了一个简单的基于像素密度的格式。Image assets 可能是 1.Ox 2.0x 3.0x 或是其他的任何倍数。这个 devicePixelRatio 表示了物理像素到单个逻辑像素的比率。

**Android 不同像素密度的图片和 Flutter 的像素比率的对应关系**

```js
ldpi      0.75px
mdpi      1.0px
hdpi      1.5px
xhdpi     2.0px
xxhdpi    3.0px
xxxhdpi   4.0px
```

Assets 可以被放置到任何属性文件夹中一一 Rutter 并没有预先定义的文件结构。我们需要在 pubspec.yaml 文件中声明 assets 的位置，然后 Flutter 会把他们识别出来。

举个例子，要把\_个名为 my_icon.png 的图片放到 Flutter 工程中，你可能想要把它放到 images 文件夹中。把图片（1.0x)放置到 images 文件央中，并把其它分辨率的图片放在对应的子文件央中，并接上合适的比例系数，就像这样：

```
images/my_icon.png          // Base: 1.0x image
images/2.0x/my一icon■png    // 2.0x image
images/3.0x/my一icon.png     //3.0x image
```

接下来就可以在 pubspec.yaml 文件中这样声明这个图片资源:

```
asserts:
  - images/my_icon.png
```

现在，我们就可以借助 Assetlmage 来访问它了。

```
return AssetImage('images/a_dot_burr.jpeg');
```

也可以通过 Image widget 直接使用：

```
@override
Widget build(BuildContext context) {
    return Image.asset("images/my_image.png");
}
```

## 3 如何归档 strings 资源，以及如何处理不同语言？

不像 iOS 拥有一个 Localizaple. strings 文件，Flutter 目前没有专门的字符串资源系统。目
前，最佳做法是将 strings 资源作为静态字段保存在类中。例如：

```dart
class Strings {
    static String welcomeMessage = "Welcome To Flutter";
}
```

然后像如下方式来访问它:

```dart
Text(Strings.welcomeMessage)
```

默认情况下，Flutter 只支持美式英语字符串。如果你要支持其他语言，请引入 `flutter_Localizations`包。你可能也要引入 inti 包来支持其他的 i10n 机制，比如日期/时间格式化。

```
dependencies:
  # ...
  flutte「一localizations:
    sdk: flutter
  intl: "^0.15.6"
```

要使用 flutter_localizations 包 ， 还需要在 appwidget 中指定 localizationsDelegates 和 supportedLocales。

```js
import 'packagerflutter_localizations/flutter_localizations.dart';

MaterialApp(
    localizationsDelegates: [
        // Add app-specific localization delegate[s] here
        GlobaIMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: [
        const Locale(,en'# 'US'), // English
        const Locale('he', 'IL'), // Hebrew
        // ... other locales the app supports
    ], // ...
}

```

这些代理包括了实际的本地化值，并且 supportedLocales 定义了 App 支持哪些地区。上面的例子使用了一个 MaterialApp, 所以它既有 GlobaIWidgetsLocalizations 用于基础 widgets, 也有 MateriaIWidgetsLocalizations 用于 Material wigets 的本地化。如果你使用
WidgetsApp，则无需包括后者。注意，这两个代理虽然包括了“默认”值，但如果你想让你的 App 本地化，你仍需要提供一或多个代理作为你的 App 本她化副本。

当初始化时，WidgetsApp 或 MaterialApp 会使用你指定的代理为你创建一个 Localizations widget。Localizations widget 可以随时从当前上下文中访问设备的地点，或者使用 Window.locale。

要访问本地化文件，使用 Localizations.of()方法来访问提供代理的特定本地化类。如需翻译，使用 intl_translation 包来取出翻译副本到 arb 文件中。把它们引入 App 中，并用 inti 来使用它们。

更多 Flutter 中国际化和本地化的细节，请访问 internationalization guide , 里面有不使用 inti 包的 示例代码。

> 注意，在 Flutter 1.0 beta 2 之前，在 Flutter 中定义的 assets 不能再原生一侧被访问。原生定义的资源在 Flutter 中也不可用，因为它们在独立的文件夹中。

## 4 如何添加 Flutter 项目所需的依赖？

- 在 Android 中，你可以在 Gradle 文件来添加依赖项目；
- 在 iOS 中，通常把依赖添加到 Podfile 中；
- 在 RN 中，通常是由 package.json 来管理项目依赖；

Flutter 使用 Dart 构建系统和 Pub 包管理器来处理依赖。这些工具将 Android 和 iOS native 包装应用程序的构建委派给响应的构建系统。

```
dependencies:
   flutter:
       sdk: flutter
    google_sign_in: ^3.0.3
```

> 在 Flutter 中，虽然在 Flutter 项目中的 Android 文件夹下有 Gradle 文件，但只有在添加平台相关需求的依赖关系时才会使用到这些文件。否则，应该使用 pubspec.yaml 来声明用于 Flutter 的外部依赖项。

> iOS 也一样，如果你的 Flutter 工程中的 iOS 文件夹中有 Podfile， 请仅在添加 iOS 平台相关依赖时使用它。否则，应该使用 pubspec.yaml 来声明用于 Flutter 的外部依赖项。

推荐一个用于查找 Flutter 插件的网站： Pub site。
