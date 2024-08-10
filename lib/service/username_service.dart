import 'package:dio/dio.dart';
import 'package:suitmedia_batch7/model/usernames_response_model.dart';

class UsernameService {
  static Dio dio = Dio();

  static Future<UsernamesResponseModel> getData() async {
    final response =
        await dio.get('https://reqres.in/api/users?page=1&per_page=10',
            options: Options(
              headers: {"Content-Type": "application/json"},
            ),
            queryParameters: {
          "Page": 1,
          "per_page": 10,
        });
    return UsernamesResponseModel.fromJson(response.data);
  }
}
