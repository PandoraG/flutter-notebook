import 'package:flutter/material.dart';

///
/// 自定义列表视图的滚动行为
/// 移除滚动列表时视图溢出的颜色
/// 
class MyScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}