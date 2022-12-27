import 'package:blocexample/models/api_res_model.dart';
import 'package:dio/dio.dart';

class ApiRepository {
  final String _baseUrl =
      'https://randomuser.me/api/';
  final dio = Dio();

  Future<ApiResModel> getAllData() async {
    final response = await dio.get(_baseUrl);
    print("object$response");
    if (response.statusCode == 200) {
      ApiResModel apiResModel = ApiResModel.fromJson(response.data);
      return apiResModel;
    } else {
      throw Exception("Failed to load results");
    }
  }
}
