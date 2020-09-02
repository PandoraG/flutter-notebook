import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        // visual Density, adaptive Platform Density,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  //此小部件是您的应用程序的主页。
  //它是有状态的，意思是它具有一个State对象（定义如下），其中包含影响它的外观。

  //此类是状态的配置。
  //它保存值（在此父项（在本例中为App小部件）提供的标题）由State的build方法使用。 
  //Widget子类中的字段是始终标记为“最终”。 

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      //通过调用setState告诉Flutter框架
      //当状态发生改变时，它将重新运行下面的build方法，去更新显示。
      //如果我们改变了_counter而不调用setState（），则build方法不会再次调用，界面将不会被更新，因此似乎就像什么也没发生一样。 
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    //每次调用setState时都会重新运行此方法，例如完成通过上面的_incrementCounter方法。
    //
    //Flutter框架已经过优化，可以快速重新运行构建方法
    //因此您可以重建任何需要更新的内容而不是必须单独更改小部件的实例。 
    return Scaffold(
      appBar: AppBar(
        //在这里，我们从MyHomePage对象创建的值中
        //App.build方法，并使用它来设置我们的应用栏标题。
        title: Text(widget.title),
      ),
      body: Center(
        //Center是一个布局小部件。它需要一个孩子并放置它
        //在父级中间。 
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
