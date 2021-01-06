import 'package:flutter/material.dart';
import 'package:serving_humanity/app/locator.dart';
import 'package:serving_humanity/app/router.gr.dart';
import 'package:serving_humanity/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final AuthService _authService = locator<AuthService>();

  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  bool _isLogin = true;
  bool get isLogin => _isLogin;

  authScreen() {
    _isLogin = _isLogin ? false : true;
    notifyListeners();
  }

  Future login({
    @required String email,
    @required String password,
  }) async {
    setBusy(true);
    var result = await _authService.signIn(email, password);

    setBusy(false);

    if (result != null) {
      print("testing");
      print(result);
      // _event = result.
      await _navigationService.navigateTo(Routes.masterRoute);
    } else {
      await _dialogService.showDialog(
          title: "Login Failure", description: "Please Try Again.");
    }
  }

  Future navigateToRegister() async {
    await _navigationService.navigateTo(Routes.signUpRoute);
  }
}
