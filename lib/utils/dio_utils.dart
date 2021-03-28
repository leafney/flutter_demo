/*
 * @Author     : leafney
 * @Github     : https://github.com/leafney
 * @Date       : 2021-03-28 16:09:18
 * @Description: dio请求类
 */

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_demo/config/com_data.dart';
import 'package:flutter_demo/config/http_config.dart';
import 'package:flutter_demo/utils/sp_utils.dart';
import 'package:oktoast/oktoast.dart';

// 用于缓存请求的token，定义为全局变量
String csrfToken;

class DioUtils {
  static DioUtils _instance;
  Dio _dio;
  BaseOptions _baseOptions;

  static DioUtils getInstance() {
    if (_instance == null) {
      _instance = DioUtils();
    }
    return _instance;
  }

  DioUtils() {
    _baseOptions = BaseOptions(
      baseUrl: HttpConfig.httpBaseUrl,
      connectTimeout: HttpConfig.httpTimeOut,
      receiveTimeout: HttpConfig.httpTimeOut,
      contentType: ContentType.json.toString(),
    );

    _dio = Dio(_baseOptions);
  }

// 不带access_token的请求
  Future<Response> requestHttp(String url,
      {String method = "get",
      Map<String, dynamic> params,
      dynamic data,
      Options options,
      CancelToken cancelToken}) async {
    // 对url做trim处理，防止因为空格等问题出现请求失败
    url = url.trim();

    // 设置method
    _baseOptions.method = method;

    // 请求及返回数据拦截器
    _addResponseInterceptor(_dio);

    // deviceId拦截器
    _addDeviceIdRequestInterceptor(_dio);

    Response response;
    try {
      response = await _dio
          .request(url,
              queryParameters: params,
              options: options,
              data: data,
              cancelToken: cancelToken)
          .catchError(_handleError); // 优化异常捕获
//           .catchError((err) {
// // 最终的解决方法：但凡是错误码非200的情况，dio都会在catchError中捕获异常，然后返回的response都是null。
// // 所以，在catchError中处理非200的错误信息，弹窗提示。正常的200返回在下一层中去处理。

//         // catchError可以捕获dio的异常
//         debugPrint('请求异常123: $err');

//         // debugPrint('非token请求异常错误码 ${err.response?.statusCode}');
//         // var eInfo = err.response?.data['message'];
//         // debugPrint('错误信息内容 ${err.response?.data}');
//         // XToast.showCenter(eInfo);
      // });
    } on DioError catch (e) {
      // try catch 无法捕获dio的异常
      print('请求异常: $e');
    }
    return response;
  }

// 带有access_token的请求
  Future<Response> requestWithToken(String url,
      {String method = "get",
      Map<String, dynamic> params,
      Map<String, dynamic> data,
      Options options,
      CancelToken cancelToken}) async {
    // 对url做trim处理，防止因为空格等问题出现请求失败
    url = url.trim();

    // 设置method
    _baseOptions.method = method;

    // 请求及返回数据拦截器
    _addResponseInterceptor(_dio);

    // deviceId拦截器
    _addDeviceIdRequestInterceptor(_dio);

    // 添加自定义token拦截器
    _addTokenInterceptor(_dio);

    Response response;
    try {
      response = await _dio
          .request(url,
              queryParameters: params,
              options: options,
              data: data,
              cancelToken: cancelToken)
          .catchError(_handleError); // 优化异常捕获
      //     .catchError((err) {
      //   debugPrint('请求异常123: $err');
      // });
    } on DioError catch (e) {
      print('请求异常: $e');
    }
    return response;
  }

  // Token interceptor
  _addTokenInterceptor(Dio dio) {
    // 专门用于刷新token的请求dio，和当前发起请求的dio以区分
    Dio tokenDio = Dio();

    tokenDio.options = dio.options;

    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      // 获取当前的Access_Token
      if (csrfToken == null) {
        print('no token,get token first');
        String accToken = SpUtils.getString(ComData.SPKEY_ACCESS_TOKEN);
        print('从本地获取到token: $accToken');
        if (accToken.isNotEmpty) {
          csrfToken = accToken;
          // 更新请求头中的token
          options.headers['Authorization'] = 'Bearer $accToken';
        } else {
          // 本地不存在token
        }
      } else {
        print('have token,use it');
        // 设置请求头中的token
        options.headers['Authorization'] = 'Bearer $csrfToken';
      }

      // 一定要返回options给后面的操作
      return options;
    }, onError: (DioError err) {
      // 401代表token已过期，需在后台api定义相应错误码
      if (err.response?.statusCode == 401) {
        print('后端返回token已过期的错误码，需要刷新token');

        RequestOptions options = err.response.request;

        // 如果token已被更新，则更新请求中使用的token
        // 这里可以理解成：同时发起了多次请求，但是token过期了。第一次请求执行后会刷新token，但是后面的请求还是使用的之前过期的token，所以这里判断一下token是否一致，更新刷新后的token
        String reqToken = options.headers["Authorization"];
        if (reqToken.isNotEmpty) {
          reqToken = reqToken.substring(7); // Bearer
        }

        if (csrfToken != reqToken) {
          print('发现token已被更新，则更新请求头中的token后重新发起请求');
          // 更新请求头中的token
          options.headers['Authorization'] = 'Bearer $csrfToken';
          // 重新发起请求
          return dio.request(options.path, options: options);
        }

        // 刷新token并重新发起请求
        // 加锁以防止请求并发

        dio.lock(); // dio.lock() 等同于 dio.interceptors.requestLock.unlock();
        dio.interceptors.responseLock.lock();
        dio.interceptors.errorLock.lock();

        String refreshToken = SpUtils.getString(ComData.SPKEY_REFRESH_TOEKN);
        print('从本地获取refreshToken: $refreshToken');
        // TODO token的刷新是没有携带device_Id信息的，后期再修改
        return tokenDio.post(HttpConfig.apiRefreshToken, data: {
          "refresh_token": refreshToken,
        }).then((d) {
          final rspStsCode = d.statusCode;
          final result = d.data;
          final resCode = result['code'];
          final resData = result['data'];
          if (rspStsCode == 200 && resCode == 200) {
            final String accessToken = resData['access_token'];
            print("刷新请求到了新的token $accessToken");

            csrfToken = accessToken;
            // 更新请求头中的token
            options.headers['Authorization'] = 'Bearer $accessToken';
            //保存新的accessToken
            SpUtils.putString(ComData.SPKEY_ACCESS_TOKEN, accessToken);
          }
        }).catchError((e) {
          print('刷新token异常了 ${e.response?.statusCode}');

          //statusCode=401 代表refresh_token过期，refreshToken过期，弹出登录页面
          if (e.response?.statusCode == 401) {
            // debugPrint('信息失效，请重新登录');

            /// TODO refresh_token过期考虑根据错误码 resCode=4002 来判断，待优化
            // 这里考虑的是： statusCode=401 可能会混淆，因为上面 access_token 过期是通过 statusCode=401 来判断的，这里 refresh_token 也是通过statusCode=401 来判断，
            // 这样容易导致混淆，考虑使用具有唯一性的 resCode 值来做判断，这样代码健壮性更强一些
            // eg:
            // final resCode = e.response?.data['code'];
            // print('resCode $resCode');

            /// 优化Toast弹窗组件
            /*
            OKTUtils.showCToast('信息失效，请重新登录', onDismiss: () {
              // 跳转到登录页不能返回
              // Global.navigatorKey.currentState.pushNamedAndRemoveUntil(
              //     PageName.login.toString(), (route) => false);

              // 跳转到登录页可以返回
              // .pushReplacementNamed(PageName.login.toString());
            });
            */
            showToast('信息失效，请重新登录', onDismiss: () {
              // 跳转到登录页不能返回
              // ggg.Get.offNamedUntil(Routes.LOGIN, (route) => false);
            });

            // 这里需要抛出异常，否则会一直401重试，导致循环重试的问题
            throw "refreshToken timeout";
          }
        }).whenComplete(() {
          print('刷新token成功，解锁请求');
          // 解锁
          dio.unlock();
          dio.interceptors.responseLock.unlock();
          dio.interceptors.errorLock.unlock();
        }).then((e) {
          print('重新发起请求 $e');
          // 重新发起请求
          return dio.request(options.path, options: options);
        }).catchError((e) {
          print('重新发起请求也失败了 $e');
        });
      }
      return err;
    }));
  }

// 要来捕获dio的异常信息
  _handleError(dynamic err) {
    Response response = err?.response;
    if (response != null) {
      print('拦截器捕获*异常*返回结果：$response');

      if (response.statusCode >= 400 && response.statusCode < 500) {
        // 获取返回信息中的message并弹窗提示
        var errMsg = response.data['message'] ?? "";
        showToast(errMsg);
      } else if (response.statusCode >= 500) {
        showToast('系统繁忙，请稍后重试');
      }
    }
  }

// 请求及返回数据拦截器
  _addResponseInterceptor(Dio dio) {
    dio.interceptors.add(
      InterceptorsWrapper(onRequest: (RequestOptions options) {
        print(
            '发起请求:[ ${options.baseUrl}${options.path} ],请求数据：[ ${options.data.toString()} ]');
        return options;
      }, onResponse: (Response response) {
        print('拦截器捕获*正常*返回结果：$response');
        return response;
      }),
    );
  }

  // 请求头DeviceId拦截器
  _addDeviceIdRequestInterceptor(Dio dio) {
    // dio.interceptors.add(
    //   InterceptorsWrapper(onRequest: (RequestOptions options) {
    //     // 从本地存储中获取当前设备Id,添加到请求头信息中
    //     String deviceId =
    //         SpUtils.getString(CommonUtils.SPKEY_DEVICE_ID, defValue: "");
    //     options.headers['deviceId'] = deviceId;
    //     return options;
    //   }),
    // );
  }
}

/*
仍存在的问题：
1. 【已解决】 -- 当token过期后，如果同时发起多条请求，那么每条请求都会去执行更新token的操作。理想中应该是发现token过期，第一条请求会执行更新token的操作，后面的请求则直接使用更新后的token发起请求
2. 【待处理】 -- 无网的情况下跳转到无网提示页面
3. 【待处理】 -- 请求时弹出加载中弹窗

*/
