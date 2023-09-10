import '../models/entities/user_model.dart';
import '../models/model_logic/user_logic.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  Future<List<User>> get() async {
    try {
      final response = await UserLogic.getUsers() as List<User>;
      return response;
    } catch (e) {
      return [];
    }
  }

  Future<User?> getOneUser(String email) async {
    try {
      final response = await UserLogic.getUsers()  as List<User>;
      User user = response.firstWhere((element) => element.email.toLowerCase() == email.toLowerCase());
      return user;
    } catch (e) {
      return null;
    }
  }

  Future add(User user) async {
    try {
      await UserLogic.addUser(user);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future delete(String id) async {
    try {
      await UserLogic.deleteUser(id);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future edit(String index, User newUser) async {
    try {
      await UserLogic.editUser(index, newUser);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
