import 'dart:convert';
import '../../constants/endPoints.dart';
import '../api_handler.dart';
import '../entities/user_model.dart';

class UserLogic {
  static final ApiHandler apiHandler = ApiHandler();

  static Future getUsers() async {
    const url = BASE_URL + USER_ENDPOINT;
    try {
      final response = await apiHandler.makeRequest(url);
      final mapResponse = jsonDecode(response.body) as List;

      return mapResponse.map((e) => User.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  static Future addUser(User todoModel) async {
    String url = "$BASE_URL$USER_ENDPOINT";
    try {
      final response = await apiHandler.makeRequest(url,
          body: todoModel.toJson(), method: "POST");
      final mapResponse = jsonDecode(response.body);
    } catch (e) {
      rethrow;
    }
  }

  static Future deleteUser(String id) async {
    String url = "$BASE_URL$USER_ENDPOINT/$id";
    try {
      final response = await apiHandler.makeRequest(url, method: "DELETE");
      final mapResponse = jsonDecode(response.body);
    } catch (e) {
      rethrow;
    }
  }

  static Future editUser(String id, User todoModel) async {
    String url = "$BASE_URL$USER_ENDPOINT/$id";
    try { 
      final response = await apiHandler.makeRequest(url,
          body: todoModel.toJson(), method: "PUT");
      final mapResponse = jsonDecode(response.body);
    } catch (e) {
      rethrow;
    }
  }
}
