import 'dart:ui';
import 'package:flutter/material.dart';

/// Adapt
/// Adapt.instance = Adapt.getInstance()..init(context, width: 828, height: 1792);
class Adapt {
  static Adapt instance = Adapt();
  static MediaQueryData mediaQuery = MediaQueryData.fromWindow(window);
  static double _width = mediaQuery.size.width;
  static double _height = mediaQuery.size.height;
  static double _topbarH = mediaQuery.padding.top;
  static double _botbarH = mediaQuery.padding.bottom;
  static double _pixelRatio = mediaQuery.devicePixelRatio;
  static double _textScaleFactor = mediaQuery.textScaleFactor;

  // 是否允许字体缩放
  static bool _allowFontScaling = false;
  // 设计图的尺寸
  static double _uiwidth = 375.0;
  static double _uiheight = 812.0;

  /// 自定义初始化
  /// @param [width] 设计图的宽度pt，默认为 375
  /// @param [height] 设计图的高度pt，默认为 812
  /// @param [fontScale] 是否跟随系统进行字体缩放，默认为false
  void init(BuildContext context,
      {double width, double height, bool fontScale = false}) {
    mediaQuery = MediaQuery.of(context);
    _width = mediaQuery.size.width;
    _height = mediaQuery.size.height;
    _topbarH = mediaQuery.padding.top;
    _botbarH = mediaQuery.padding.bottom;
    _pixelRatio = mediaQuery.devicePixelRatio;
    _textScaleFactor = mediaQuery.textScaleFactor;

    if (width != null) {
      _uiwidth = width;
    }
    if (height != null) {
      _uiheight = height;
    }
    if (fontScale != null) {
      _allowFontScaling = fontScale;
    }
  }

  static Adapt getInstance() {
    return instance;
  }

  // 实际的dp与UI设计px的比例
  static get scaleWidth => _width / _uiwidth;
  static get scaleHeight => _height / _uiheight;

  /// 当前设备宽度 px
  static double get screenW => _width * _pixelRatio;

  /// 当前设备高度 px
  static double get screenH => _height * _pixelRatio;

  /// 设置字体大小px
  static size(double number) {
    return _allowFontScaling
        ? (number * scaleWidth) / _textScaleFactor
        : number * scaleWidth;
  }

  /// 获取1px
  static onePx() => 1 / _pixelRatio;

  /// 设置大小，除高度外
  static px(double number) => number * scaleWidth;

  /// 设置宽度 px
  static width(double width) => width * scaleWidth;

  /// 设置高度 px
  static height(double height) => height * scaleHeight;

  /// 获取
  static topH() => _topbarH;

  /// 获取
  static botH() => _botbarH;
}
