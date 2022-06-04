import 'dart:convert';
import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ping/Core/Models/user_model.dart';
import 'package:ping/Core/Services/navigation_service.dart';
import 'package:ping/Routes/navigator_routes.dart';

class AuthService {
  AuthService._();
  static final AuthService _instance = AuthService._();
  factory AuthService() => _instance;
  static final NavigationService _navigationService =
      NavigationService.instance;

  static User? _user;
  static User? get user => _user;
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  static signIn(User user) async {
    _user = user;
    await _secureStorage.write(
      key: 'user',
      value: jsonEncode(
        user.toJson(),
      ),
    );
  }

  static onAppLoad() async {
    var res = await _secureStorage.read(key: 'user');
    log(res.toString());
    if (res != null) {
      final decodedData = jsonDecode(res);
      _user = User.fromJson(decodedData);
    }
  }

  static logOut() async {
    await _secureStorage.deleteAll();
    await _navigationService.navigateToNewRoute(NavigatorRoutes.signInView);
  }
}
