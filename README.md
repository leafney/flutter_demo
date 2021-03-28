# flutter_demo

Flutter Demo Project.

## Dio

```
dio: ^4.0.0-prev3
```

测试 `dio` nullsafety 的使用。

dio 的封装参考：

- [dio 拦截器官方示例](https://github.com/flutterchina/dio/blob/4.0/example/interceptor_lock.dart)
- [dio 响应拦截器官方示例](https://github.com/flutterchina/dio/blob/4.0/example/response_interceptor.dart)


### Errors

> Bad state: Insecure HTTP is not allowed by platform

For Ios，modify `Info.plist` add :

```
    <!-- can use http request -->
	<key>NSAppTransportSecurity</key>
    <dict>
        <key>NSAllowsArbitraryLoads</key>
        <true/>
    </dict>
```

