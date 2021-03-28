import 'package:flutter/material.dart';
import 'package:flutter_demo/config/com_data.dart';
import 'package:flutter_demo/config/http_config.dart';
import 'package:flutter_demo/model/login.dart';
import 'package:flutter_demo/utils/dio_utils.dart';
import 'package:flutter_demo/utils/sp_utils.dart';
import 'package:oktoast/oktoast.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () async {
                //
                final response = await DioUtils()
                    .requestHttp(HttpConfig.apiCaptcha, method: 'POST', data: {
                  "phone": ComData.PHONE,
                  "type": 1,
                });
                if (response != null) {
                  final rCode = response.data['code'];
                  final rMsg = response.data['message'];
                  print('success -- $rCode -- $rMsg');
                } else {
                  print('error');
                }
              },
              child: Text('获取验证码', style: TextStyle(fontSize: 26)),
            ),
            TextButton(
              onPressed: () async {
                //
                final response = await DioUtils()
                    .requestHttp(HttpConfig.apiLogin, method: 'POST', data: {
                  "captcha": '222333',
                  "phone": ComData.PHONE,
                });

                if (response != null) {
                  final rCode = response.data['code'];
                  final rData = response.data['data'];
                  final rMsg = response.data['message'];
                  print('success -- $rCode -- $rData -- $rMsg');

                  var result = LoginResultVM.fromJson(rData);

                  // 登录成功，写入token
                  final aT = result.accessToken;
                  final rT = result.refreshToken;

                  SpUtils.putString(ComData.SPKEY_ACCESS_TOKEN, aT!);
                  SpUtils.putString(ComData.SPKEY_REFRESH_TOEKN, rT!);
                } else {
                  print('error');
                }
              },
              child: Text('登录', style: TextStyle(fontSize: 26)),
            ),
            TextButton(
              onPressed: () async {
                //
                final response = await DioUtils()
                    .requestWithToken(HttpConfig.apiTest, method: 'POST');
                print('response -- $response');

                if (response != null) {
                  final rCode = response.data['code'];
                  final rMsg = response.data['message'];
                  print('success -- $rCode -- $rMsg');
                } else {
                  print('error');
                }

                //
                final response2 = await DioUtils()
                    .requestWithToken(HttpConfig.apiTest, method: 'POST');
                print('response2 -- $response2');

                //
                final response3 = await DioUtils()
                    .requestWithToken(HttpConfig.apiTest, method: 'POST');
                print('response3 -- $response3');
              },
              child: Text('测试请求', style: TextStyle(fontSize: 26)),
            ),
          ],
        ),
      ),
    );
  }
}
