import 'package:camera/models/user.dart';
import 'package:camera/models/userBack4App.dart';
import 'package:dio/dio.dart';

class UserRepository {
  var _dio = Dio();

  UserRepository() {
    _dio = Dio();
    _dio.options.baseUrl = 'https://parseapi.back4app.com/classes';
    _dio.options.headers['X-Parse-Application-Id'] =
        'ouVg9uyGQ0HSvqSlAlidv4rOyv91T8tmiQP5jjtW';
    _dio.options.headers['X-Parse-REST-API-Key'] =
        'uW3l3XMt7AbX9wUs6ZZmebnUM4Uj7t1B93BehVsJ';
    _dio.options.headers['Content-Type'] = 'application/json';
  }

  Future<void> createUser(User user) async {
    try {
      await _dio.post('/usuers', data: user.toJson());
    } catch (e) {
      print(e);
    }
  }

  Future<UserBack4AppResponse> getUsers() async {
    try {
      var response = await _dio.get('/usuers');
      return UserBack4AppResponse.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
