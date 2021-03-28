class HttpConfig {
  HttpConfig._();

  static final httpBaseUrl = "http://172.21.40.40:9999";
  static const httpTimeOut = 5000;

  // api
  static const apiCaptcha = '/captcha';

  static const apiLogin = '/login';

  static const apiRefreshToken = '/refresh';

  static const apiTest = '/api/v1/test';
}
