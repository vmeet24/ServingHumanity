import 'package:serving_humanity/app/locator.dart';
import 'package:serving_humanity/app/router.gr.dart';
import 'package:serving_humanity/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SettingViewModel extends BaseViewModel {
  bool _isActive = true;
  bool get isActive => _isActive;

  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();

  bool get isUser => _authService?.currentUser != null;

  notificationChange(bool val) {
    _isActive = val;
    notifyListeners();
  }

  Future signOut() async {
    await _authService.logout();
    await _navigationService.navigateTo(Routes.loginRoute);
  }

  Future navigateToProfile() async {
    await _authService.logout();
    await _navigationService.navigateTo(Routes.profileRoute);
  }
}
