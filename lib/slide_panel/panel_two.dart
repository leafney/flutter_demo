import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PanelTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SlidingUpPanel Two'),
      ),
      body: SlidingUpPanel(
        backdropEnabled: true, // 是否显示阴影遮罩层
        // backdropTapClosesPanel: false, // 是否支持点击遮罩层关闭浮层
        // backdropColor: Colors.red, // 遮罩层颜色
        // backdropOpacity: 0.3, //遮罩层透明度
        minHeight: 70, // 完全折叠时滑动面板的高度
        // maxHeight: 1000, // 完全打开时滑动面板的高度
        // isDraggable: false, // 是否能够上下拖动面板
        parallaxEnabled: true, // 视差滚动
        parallaxOffset: 0.2, // 视差滚动阈值
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
        ), //为浮层添加圆角效果
        collapsed: Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0)),
          ),
          margin: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
          child: Center(
            child: Text('向上滑动打开', style: TextStyle(color: Colors.white)),
          ),
        ), // 显示在浮层顶部的一个提示性文字区域，随浮层展开而淡出
        renderPanelSheet: false, // 启用浮动效果
        panel: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(24.0)),
              boxShadow: [
                BoxShadow(blurRadius: 20.0, color: Colors.grey),
              ]),
          margin: const EdgeInsets.all(24.0),
          child: Center(child: Text('这是浮层')),
        ),
        body: Center(child: Text('这是内容')),
      ),
    );
  }
}
