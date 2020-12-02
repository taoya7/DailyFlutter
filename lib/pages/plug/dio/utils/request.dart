
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';

import './api.dart';

var isDebug = true;
const int _connectTimeout = 15000; //15s
const int _receiveTimeout = 15000;
const int _sendTimeout = 10000;

/*
*   https://juejin.cn/post/6875185393810014221
* */

// 请求方法
enum DioMethod {
  get,
  post,
  put,
  delete,
}

/// Dio 请求与响应拦截器
class OnReqResInterceptors extends InterceptorsWrapper {
  /// 请求拦截
  @override
  Future onRequest(RequestOptions options) {
    if (isDebug) {
      print("请求baseUrl：${options.baseUrl}");
      print("请求url：${options.path}");
      print('请求头: ${options.headers.toString()}');

      if (options.data != null) {
        print('请求参数: ${options.data.toString()}');
      }
      if (options.queryParameters != null) {
        print('请求参数: ${options.queryParameters.toString()}');
      }
    }
    return super.onRequest(options);
  }
  /// 响应拦截
  @override
  Future onResponse(Response response) {
    Response res = response;
    if (response != null) {
      if (isDebug) {
        print('响应: ${response.toString()}');
      }
    }
    if (response.statusCode == 200) {
      int errCode = response.data["errCode"];
      // if (errCode == ErrCode.SUCCESS) {
      //   res = response;
      // }
    }
    return super.onResponse(res);
  }
}

/// Dio OnError 拦截器
class OnErrorInterceptors extends InterceptorsWrapper {
  /// 异常拦截
  @override
  Future onError(DioError err) {
    if (isDebug) {
      print('请求异常: ${err.toString()}');
      print('请求异常信息: ${err.response?.toString() ?? ""}');
    }
    switch (err.type) {
      // 4xx 5xx Response
      case DioErrorType.RESPONSE:
        break;
      case DioErrorType.CONNECT_TIMEOUT:
        print("连接超时");
        break;
      case DioErrorType.SEND_TIMEOUT:
        print("发送超时");
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        print("接收超时");
        break;
      case DioErrorType.DEFAULT:
        print("连接异常");
        break;
    }
    return super.onError(err);
  }
}

// 工具类
class DioManager {
  factory DioManager() => _getInstance();
  static DioManager _instance;
  static DioManager _getInstance(){
    if(_instance == null) {
      _instance = DioManager._init();
    }
    return _instance;
  }
  Dio _dio;
  // Init
  DioManager._init(){
    if(_dio == null){
      _dio = Dio(BaseOptions(
      baseUrl: API.baseUrl, // 请求基地址
      connectTimeout: _connectTimeout, //  连接服务器超时时间，单位是毫秒
      receiveTimeout: _receiveTimeout,// 接收数据的最长时限
      sendTimeout: _sendTimeout,
      headers: { // Http请求头
       "api": "1.0.0",
      },
        /// 请求的Content-Type，默认值是"application/json; charset=utf-8".
        /// 如果您想以"application/x-www-form-urlencoded"格式编码请求数据,
        /// 可以设置此选项为 `Headers.formUrlEncodedContentType`,  这样[Dio]就会自动编码请求体.
        // contentType: Headers.formUrlEncodedContentType, // 适用于post form表单提交
        responseType: ResponseType.json,

    ));
      // 请求与响应拦截器
      _dio.interceptors.add(OnReqResInterceptors());
      // 异常拦截器
     _dio.interceptors.add(OnErrorInterceptors());
    }
  }

  /// get请求
  Future get({@required String url, Map params}) async {
    return await requestHttp(url, method: DioMethod.get, params: params);
  }

  /// post 请求
  Future post({@required String url, Map params}) async {
    return await requestHttp(url, method: DioMethod.post, params: params);
  }

  /// put 请求
  Future put({@required String url, Map params}) async {
    return await requestHttp(url, method: DioMethod.put, params: params);
  }

  /// delete 请求
  Future delete({@required String url, Map params}) async {
    return await requestHttp(url, method: DioMethod.delete, params: params);
  }

  /// Dio request 方法
  /*
  *   请求的URL
  *   请求地址
  * */
  Future requestHttp(String url, {DioMethod method = DioMethod.get, Map params}) async {
    const methodValues = {
      DioMethod.get: 'get',
      DioMethod.post: 'post',
      DioMethod.delete: 'delete',
      DioMethod.put: 'put'
    };

    // Token处理

    // 不同请求方法，不同的请求参数。按实际项目需求分，这里 get 是 queryParameters，其它用 data. FormData 也是 data
    // 注意: 只有 post 方法支持发送 FormData.
    try {
      Response response;
      switch (method) {
        case DioMethod.get:
          response = await _dio.request(url, queryParameters: params, options: Options(method: methodValues[method]));
          break;
        default:
          response = await _dio.request(url, data: params, options: Options(method: methodValues[method]));
        }
        // JSON 序列化, Response<dynamic> 转 Map<String, dynamic>
        String jsonStr = json.encode(response.data);
        Map<String, dynamic> map = json.decode(jsonStr);
        return map;
      } on DioError catch(e) {
        return '网络错误';
      }
    }

  clear(){
    _dio = null;
  }
}