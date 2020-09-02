[package:fluttertoast](https://pub.dev/packages/fluttertoast)

---

【翻译】

# [fluttertoast](https://pub.dartlang.org/packages/fluttertoast)  

Flutter Toast 库。

现在，这个Toast库支持两种Toast消息，一种需要`BuildContext`，而另一种则不需要`BuildContext`。 

## Toast with no context

> 支持平台
>
> - Android
> - IOS
> - Web (Uses [Toastify-JS](https://github.com/apvarun/toastify-js))

此功能功能有限，无法控制UI。


## 需要BuildContext的Toast

> 支持平台 
>  
> - ALL

1. 完全控制 Toast
2. Toasts 将排队 
3. 移除一个 toast
4. 清除队列


## 如何使用 

```yaml
# 将此行添加到您的依赖项
fluttertoast: ^7.0.4
```

```dart
import 'package:fluttertoast/fluttertoast.dart';
```

## Toast with No Build Context

```dart
Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
```

| property        | description                                                        | default    |
| --------------- | ------------------------------------------------------------------ |------------|
| msg             | String (Not Null)(required)                                        |required    |
| toastLength     | Toast.LENGTH_SHORT or Toast.LENGTH_LONG (optional)                 |Toast.LENGTH_SHORT  |
| gravity         | ToastGravity.TOP (or) ToastGravity.CENTER (or) ToastGravity.BOTTOM (Web Only supports top, bottom) | ToastGravity.BOTTOM    |
| timeInSecForIosWeb | int (only for ios)                                                 | 1       |
| backgroundColor         | Colors.red                                                         |null   |
| textcolor       | Colors.white                                                       |null    |
| fontSize        | 16.0 (float)                                                       | null      |
| webShowClose    | false (bool)                                                       | false      |
| webBgColor      | String (hex Color)                                                 | linear-gradient(to right, #00b09b, #96c93d) |
| webPosition     | String (`left`, `center` or `right`)                                | right     |

### To cancel all the toasts call

```dart
Fluttertoast.cancel()
```

### Custom Toast For Android

在项目“ app /res /layout”文件夹中创建一个名为“ toast_custom.xml”的文件，然后进行自定义样式 

```xml
<?xml version="1.0" encoding="utf-8"?>
<FrameLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="wrap_content"
    android:layout_height="wrap_content"
    android:layout_gravity="center_horizontal"
    android:layout_marginStart="50dp"
    android:background="@drawable/corner"
    android:layout_marginEnd="50dp">

    <TextView
        android:id="@+id/text"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:background="#CC000000"
        android:paddingStart="16dp"
        android:paddingTop="10dp"
        android:paddingEnd="16dp"
        android:paddingBottom="10dp"
        android:textStyle="bold"
        android:textColor="#FFFFFF"
        tools:text="Toast should be short." />
</FrameLayout>
```

## Toast with BuildContext
  
```dart 
FToast fToast;

@override
void initState() {
    super.initState();
    fToast = FToast(context);
}

_showToast() {
    Widget toast = Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
        ),
        child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
            Icon(Icons.check),
            SizedBox(
            width: 12.0,
            ),
            Text("This is a Custom Toast"),
        ],
        ),
    );


    fToast.showToast(
        child: toast,
        gravity: ToastGravity.BOTTOM,
        toastDuration: Duration(seconds: 2),
    );
}

```  

现在调用`_showToast（）`

有关更多详细信息，请查看`example`项目
  
| property        | description                                                        | default    |  
| --------------- | ------------------------------------------------------------------ |------------|  
| child             | Widget (Not Null)(required)                                        |required    |  
| toastDuration     | Duration (optional)                                                 |  |
| gravity         | ToastGravity.*    |  |

### To cancel all the toasts call  
  
```dart  
// To remove present shwoing toast
fToast.removeCustomToast()

// To clear the queue
fToast.removeQueuedCustomToasts();
```  

## Preview Images (No BuildContext)

<img src="https://raw.githubusercontent.com/ponnamkarthik/FlutterToast/master/screenshot/1.png" width="320px" />
<img src="https://raw.githubusercontent.com/ponnamkarthik/FlutterToast/master/screenshot/2.png" width="320px" />
<img src="https://raw.githubusercontent.com/ponnamkarthik/FlutterToast/master/screenshot/3.png" width="320px" />
<img src="https://raw.githubusercontent.com/ponnamkarthik/FlutterToast/master/screenshot/4.png" width="320px" />

## Preview Images (BuildContext)
  
<img src="https://raw.githubusercontent.com/ponnamkarthik/FlutterToast/master/screenshot/11.jpg" width="320px" />




