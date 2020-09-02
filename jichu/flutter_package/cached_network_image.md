[package:cached_network_image](https://pub.dev/packages/cached_network_image)

---

# Cached network image

`cached_network_image` 是一个 `flutter` 库，用于显示来自互联网的图像并将其保存在缓存目录中。

## 如何使用

`CachedNetworkImage`可以直接使用，也可以通过`ImageProvider`使用。

作为`CachedNetworkImageProvider`的`CachedNetworkImage`都对`Web`的支持最少。目前不包括缓存。

使用占位符：

```dart
CachedNetworkImage(
        imageUrl: "http://via.placeholder.com/350x150",
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
     ),
```

或带有进度指示器：

```dart
CachedNetworkImage(
       imageUrl: "http://via.placeholder.com/350x150",
       progressIndicatorBuilder: (context, url, downloadProgress) =>
               CircularProgressIndicator(value: downloadProgress.progress),
       errorWidget: (context, url, error) => Icon(Icons.error),
    ),
```

```dart
Image(image: CachedNetworkImageProvider(url))
```

如果您想同时拥有占位符功能和要在另一个窗口小部件中使用 `imageprovider`，则可以提供 `imageBuilder`：

```dart
CachedNetworkImage(
  imageUrl: "http://via.placeholder.com/200x150",
  imageBuilder: (context, imageProvider) => Container(
    decoration: BoxDecoration(
      image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
    ),
  ),
  placeholder: (context, url) => CircularProgressIndicator(),
  errorWidget: (context, url, error) => Icon(Icons.error),
),
```

## 底层原理

缓存的网络映像使用以下命令存储和检索文件 [flutter_cache_manager](https://pub.dartlang.org/packages/flutter_cache_manager).
