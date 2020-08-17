
BLoC是 `Business Logic Components` 的缩写, 是paolo soares 和 cong hui 在2018年Google dartconf上提出的。BLoC的哲学就是app里的所有东西都应该被认为是事件流：一部分组件订阅事件，另一部分组件则响应事件。BLoC居中管理这些会话。Dart甚至把流（Stream）内置到了语言本身里。

这个模式最好的地方就是你不需要引入任何的插件，也不需要学习其他的语法。所有需要的内容Flutter都有提供。


# 深入 BLoC 

BLoC基本就是基于Dart的流（Stream）的。

![](https://user-gold-cdn.xitu.io/2020/6/8/17291af7c5ec4eaf?imageView2/0/w/1280/h/960/format/webp/ignore-error/1)



流，和Future一样，也是在 `dart:async` 包里。一个流就像一个future，不同的是流不只是异步的返回一个值，流可以随着时间的推移返回很多的值。如果一个future最终是一个值的话，那么一个流就是会随着时间可以返回一个系列的值。

`dart:async` 包提供了一个 `StreamController` 类。流控制器管理的两个对象流和槽（sink）。sink和流相对应，流提供提供数据，sink接受输入值。

总结一下，BLoC用来处理逻辑，sink接受输入，流输出。


# 推荐阅读
 - [flutter中使用BloC模式](https://cloud.tencent.com/developer/article/1345645)
 - [Flutter - BLoC模式入门](https://juejin.im/post/6844904183204691982)
 - [[译] 在 flutter 中高效地使用 BLoC 模式](https://juejin.im/post/6844903860591394830)
 - [bloc](https://github.com/windinwork/bloc_app)
