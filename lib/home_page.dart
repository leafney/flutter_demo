import 'package:flutter/material.dart';
import 'package:flutter_demo/adapt.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 初始化
    Adapt.instance = Adapt.getInstance()..init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            left: Adapt.width(25),
            right: Adapt.width(16),
          ),
          child: Column(
            children: <Widget>[
              Container(
                height: Adapt.height(70),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        '头像',
                        style: TextStyle(
                          fontSize: Adapt.size(16),
                        ),
                      ),
                    ),
                    Container(
                      width: Adapt.width(58),
                      height: Adapt.width(58),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://pic3.zhimg.com/v2-63a3f260dfc6f3165384c14e2d579c66_xs.jpg'),
                        ),
                        borderRadius: BorderRadius.circular(Adapt.width(58)),
                      ),
                    ),
                    Icon(Icons.navigate_next),
                  ],
                ),
              ),
              Container(
                height: Adapt.height(60),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        '昵称',
                        style: TextStyle(
                          fontSize: Adapt.size(16),
                        ),
                      ),
                    ),
                    Text(
                      '小皮球儿',
                      style: TextStyle(
                        fontSize: Adapt.size(14),
                      ),
                    ),
                    Icon(Icons.navigate_next),
                  ],
                ),
              ),
              Container(
                height: Adapt.height(60),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        '密码',
                        style: TextStyle(
                          fontSize: Adapt.size(16),
                        ),
                      ),
                    ),
                    Text(
                      '已设置',
                      style: TextStyle(
                        fontSize: Adapt.size(14),
                      ),
                    ),
                    Icon(Icons.navigate_next),
                  ],
                ),
              ),
              Container(
                height: Adapt.height(60),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        '手机号',
                        style: TextStyle(
                          fontSize: Adapt.size(16),
                        ),
                      ),
                    ),
                    Text(
                      '14358584493',
                      style: TextStyle(
                        fontSize: Adapt.size(14),
                      ),
                    ),
                    SizedBox(
                      width: Adapt.width(21),
                    ),
                  ],
                ),
              ),
              Expanded(child: SizedBox()),
              Container(
                width: Adapt.width(305),
                height: Adapt.height(45),
                decoration: BoxDecoration(
                  color: Color(0xffFFDC77),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: FlatButton(
                  onPressed: () {
                    debugPrint('底部高度：${Adapt.botH()}');
                  },
                  child: Text('退出登录'),
                ),
              ),
              SizedBox(
                height: Adapt.height(70) - Adapt.botH(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
