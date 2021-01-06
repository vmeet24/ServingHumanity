import 'package:flutter/cupertino.dart';
import 'package:serving_humanity/app/locator.dart';
import 'package:serving_humanity/data_models/user.dart';
import 'package:serving_humanity/services/auth_service.dart';
import 'package:serving_humanity/services/firestore_service.dart';
import 'package:stacked/stacked.dart';

class ProfileViewModel extends BaseViewModel {
  bool _status = true;
  bool get status => _status;
  final AuthService _authService = locator<AuthService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();

  User get user => _authService.currentUser;

  edit() {
    _status = false;
    notifyListeners();
  }

  Future saveInfo({@required String name, @required String mobile}) async {
    if (name.isNotEmpty || mobile.isNotEmpty) {
      setBusy(true);
      user.fullName = name;
      user.mobile = mobile;
      await _firestoreService.updateUser(user);
      setBusy(false);
    }
    _status = true;
    notifyListeners();
  }

  User cancel() {
    _status = true;
    notifyListeners();
    return user;
  }
}
