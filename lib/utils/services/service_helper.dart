import 'package:get/get.dart';
import 'package:restaurant/utils/services/api_services.dart';

String kApiUrl = 'https://aq-restaurant.herokuapp.com/api/'; // GET

final ApiService _api = Get.find<ApiService>();

ApiService get api => _api;
