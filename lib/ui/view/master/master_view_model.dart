import 'package:flutter/material.dart';
import 'package:serving_humanity/app/locator.dart';
import 'package:serving_humanity/app/router.gr.dart';
import 'package:serving_humanity/data_models/user.dart';
import 'package:serving_humanity/services/auth_service.dart';
import 'package:serving_humanity/ui/view/donate/donate_view.dart';
import 'package:serving_humanity/ui/view/event_list/event_list_view.dart';
import 'package:serving_humanity/ui/view/gallery/gallery_view.dart';
import 'package:serving_humanity/ui/view/home/home_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MasterViewModel extends BaseViewModel {
  int _currentTab = 0;
  int get currentTab => _currentTab;
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();

  User _user;
  User get user => _user;

  final List<Widget> children = [
    HomeView(),
    EventListView(),
    GalleryView(),
    DonateView()
  ];
  updateTab(int index) {
    _currentTab = index;
    notifyListeners();
  }

  isLoggedIn() {
    var result = _authService?.currentUser;
    if (result != null) {
      _user = result;
    }
    notifyListeners();
  }

  Future navigateToContact() async {
    await _navigationService.navigateTo(Routes.contactUsRoute);
  }

  Future navigateToSetting() async {
    await _navigationService.navigateTo(Routes.settingRoute);
  }

  Future navigateToMyCamps() async {
    await _navigationService.navigateTo(Routes.myCampsRoute);
  }
}
