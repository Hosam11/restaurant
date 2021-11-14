import 'package:dio/dio.dart';
import 'package:fimber/fimber.dart';
import 'package:get/get.dart' hide Response, FormData;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:restaurant/constants/strings.dart';
import 'package:restaurant/models/error/error_model.dart';
import 'package:restaurant/utils/dialog/dialogs.dart';
import 'package:restaurant/utils/mixins/error_helper.dart';
import 'package:restaurant/utils/services/internet_service.dart';
import 'package:restaurant/utils/services/storage_service.dart';

const postMethod = 'POST';
const getMethod = 'Get';
const kApiUrl = 'https://aq-restaurant.herokuapp.com/api/'; // GET

class ApiService extends GetxService with ErrorHelperMixin {
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
    // dio.options.connectTimeout = 5000;
    // dio.options.receiveTimeout = 3000;
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
    ));
  }

  Future<T?> request<T>(
    String endPoint,
    String method, {
    dynamic data,
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
        final statusCode = response.statusCode;
        switch (statusCode) {
          case 200:
            return response.data;
          case 401:
            throw 'unauthorized, status code error : ${response.statusCode}';
          default:
            throw 'status code error : ${response.statusCode}';
        }
      } on DioError catch (error, _) {
        Fimber.i('catch >> error: $error');
        final errorRes = error.response;
        Fimber.i('errorRes= $errorRes');
        final erModel = ErrorModel.fromJson(errorRes!.data);
        final errMsg = getStringMsg(erModel);
        Fimber.i('errMsg= $errMsg');
        await showInfoDialog(errorTitle, errMsg);
        return null;
      } catch (e) {
        return null;
      }
    } else {
      Future.delayed(const Duration(milliseconds: 500), () {
        /// delay for waiting widgets to be built
        showInfoDialog(
          errorTitle,
          noInternetMsg,
        );
      });
      return null;
    }
  }
}
