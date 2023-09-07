// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:news_app/constants/api_const.dart';

// class DioSettings {
//   DioSettings() {
//     setup();
//   }

//   Dio dio = Dio(
//     BaseOptions(
//       baseUrl: '${ApiConst.topNews}',
//       contentType: 'application/json',
//       headers: {
//         'Accept': 'application/json',
//       },
//       connectTimeout: const Duration(seconds: 20),
//       receiveTimeout: const Duration(seconds: 20),
//     ),
//   );

//   void setup() async {
//     final interceptors = dio.interceptors;

//     interceptors.clear();

//     final logInterceptor = LogInterceptor(
//       request: true,
//       requestBody: true,
//       requestHeader: true,
//       responseBody: true,
//       responseHeader: true,
//     );

//     final headerInterceptors = QueuedInterceptorsWrapper(
//       onRequest: (options, handler) => handler.next(options),
//       onError: (DioException error, handler) {
//         handler.next(error);
//       },
//       onResponse: (response, handler) {
//         return handler.next(response);
//       },
//     );
//     interceptors.addAll([if (kDebugMode) logInterceptor, headerInterceptors]);
//   }
// }