// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import '../model/login_model.dart';

class APIService {
  loginAPI(String email, password) async {
    try {
      Map<String, String> headers = {"content-type": "application/json"};
      Response response = await post(
        Uri.parse('https://api-nodejs-todolist.herokuapp.com/user/login'),
        headers: headers,
        body: jsonEncode({'email': email, 'password': password}),
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print('Login successfully');
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  registerAPI(String name, email, password, age) async {
    try {
      Map<String, String> headers = {"content-type": "application/json"};
      Response response = await post(
        Uri.parse('https://api-nodejs-todolist.herokuapp.com/user/register'),
        headers: headers,
        body: jsonEncode(
            {'name': name, 'email': email, 'password': password, 'age': age}),
      );
      if (response.statusCode == 201) {
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print('Register successfully');
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    // await Future<void>.delayed(const Duration(seconds: 1));
    // var request = http.Client();
    // request.

    try {
      String url = 'https://api-nodejs-todolist.herokuapp.com/user/login';
      Map<String, String> headers = {"Content-Type": "application/json"};
      //    String json =
      '{"email": "muh.nurali43@gmail.com", "password": "12345678"}';

      http.Response response = await http.post(Uri.parse(url),
          headers: headers, body: jsonEncode(requestModel.toJson()));

      if (response.statusCode == 200 || response.statusCode == 400) {
        var a = LoginResponseModel.fromJson(
          jsonDecode(response.body),
        );
        return a;
      } else {
        throw Exception('No found');
      }
    } on Exception catch (e) {
      print(e);
    }
    return LoginResponseModel(error: '', token: '');
  }
}
