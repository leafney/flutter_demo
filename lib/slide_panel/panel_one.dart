import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PanelOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SlidingUpPanel One'),
      ),
      body: SlidingUpPanel(
        panel: Center(
          child: Text('这是浮层控件'),
        ),
        body: Center(
          child: Text('这是内容'),
        ),
        backdropEnabled: true, // 是否显示阴影遮罩层
        // backdropTapClosesPanel: false, // 是否支持点击遮罩层关闭浮层
        // backdropColor: Colors.red, // 遮罩层颜色
        // backdropOpacity: 0.3, //遮罩层透明度
        minHeight: 50, // 完全折叠时滑动面板的高度
        // maxHeight: 1000, // 完全打开时滑动面板的高度
        // isDraggable: false, // 是否能够上下拖动面板
        parallaxEnabled: true, // 视差滚动
        parallaxOffset: 0.2, // 视差滚动阈值
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
        ), //为浮层添加圆角效果
        collapsed: Container(
          child: Center(
            child: Text('向上滑动打开'),
          ),
        ), // 显示在浮层顶部的一个提示性文字区域，随浮层展开而淡出
      ),
    );
  }
}
