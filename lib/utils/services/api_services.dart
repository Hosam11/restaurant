import 'package:dio/dio.dart';
import 'package:fimber/fimber.dart';
import 'package:get/get.dart' hide Response, FormData;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:restaurant/utils/services/internet_service.dart';
import 'package:restaurant/utils/services/service_helper.dart';
import 'package:restaurant/utils/services/storage_service.dart';

const post = 'POST';
const get = 'Get';

class ApiService extends GetxService {
  static final ApiService _apiUtil = ApiService._();

  ApiService._() {
    init();
  }

  factory ApiService() {
    return _apiUtil;
  }

  final dio = Dio();

  void init() {
    dio.options.baseUrl = kApiUrl;
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 3000;
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
    ));
  }

  Future<T?> request<T>(
    String endPoint,
    String method, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    String? contentType,
  }) async {
    if (Get.find<InternetService>().hasConnection.value) {
      try {
        Response response = await dio.request<T>(
          endPoint,
          data: data ?? {},
          queryParameters: queryParameters,
          options: Options(
            method: method,
            contentType: contentType,
            headers: {
              'Token': 'bearer ${Get.find<StorageService>().token}',
            },
          ),
        );

        Fimber.i("status: ${response.statusCode}");

        if (response.statusCode != 200) {
          throw "status code error : ${response.statusCode}";
        }

        //Parse response
        // final dataModel = ResponseModel.fromJson(response.data);

      } catch (e) {
        Fimber.i("Error: $e");
        //TODO: Add alert dialogue
        return null;
      }
    } else {
      Future.delayed(const Duration(milliseconds: 500), () {
        /// delay for waiting widgets to be built
      });
      return null;
    }
  }
}
