import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:native_dio_adapter/native_dio_adapter.dart';

void addPlatformConfiguration(Dio dio, CookieJar cookieJar) {
  final cookieManager = CookieManager(cookieJar);
  dio.interceptors.add(cookieManager);
  dio.httpClientAdapter = NativeAdapter();
}
