import 'package:serving_humanity/app/locator.dart';
import 'package:serving_humanity/app/router.gr.dart';
import 'package:serving_humanity/services/auth_service.dart';
import 'package:serving_humanity/services/push_notification_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartUpViewModel extends BaseViewModel {
  AuthService _authSerivce = locator<AuthService>();
  NavigationService _navigationService = locator<NavigationService>();
  PushNotificationService _pushNotificationService =
      locator<PushNotificationService>();

  Future checkUser() async {
    _pushNotificationService.initialise();
    await Future.delayed(Duration(milliseconds: 2000));
    var result = await _authSerivce.isUserLoggedIn();
    if (result) {
      await _navigationService.navigateTo(Routes.masterRoute);
    } else {
      await _navigationService.navigateTo(Routes.masterRoute);
    }
  }
}
