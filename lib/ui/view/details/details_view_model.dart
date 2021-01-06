import 'package:serving_humanity/app/locator.dart';
import 'package:serving_humanity/app/router.gr.dart';
import 'package:serving_humanity/data_models/event.dart';
import 'package:serving_humanity/services/auth_service.dart';
import 'package:serving_humanity/services/firestore_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DetailsViewModel extends BaseViewModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final DialogService _dialogService = locator<DialogService>();
  final AuthService _authService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();

  bool get isAdmin => _authService?.currentUser?.userRole == "Admin";
  bool get isLoggedIn => _authService?.currentUser != null;
  Event event;
  bool _checkIfGoing = false;
  bool get checkIfGoing => _checkIfGoing;

  isGoing() {
    try {
      if (isLoggedIn) {
        var result = _authService.currentUser.myEvents
            .where((element) => element == event.documentId)
            .toList();
        if (result.length > 0) {
          _checkIfGoing = true;
        } else {
          _checkIfGoing = false;
        }
      } else {
        _checkIfGoing = false;
      }
    } catch (e) {
      return e.toString();
    } finally {
      notifyListeners();
    }
  }

  Future navigateToEdit(
    String value,
  ) async {
    await _navigationService.navigateTo(Routes.addEventRoute,
        arguments: AddEventViewArguments(editEvent: event));
  }

  Future intrestedEvent() async {
    setBusy(true);

    if (isLoggedIn) {
      var events = [..._authService.currentUser.myEvents, event.documentId];
      _authService.currentUser.myEvents = events;
      // print(events);
      await _firestoreService.updateUser(_authService.currentUser);
      _checkIfGoing = true;
    } else {
      var response = await _dialogService.showConfirmationDialog(
          title: "Login/Signup",
          description: "Please LogIn/SignUp to Register in this Camp.");

      if (response.confirmed) {
        await _navigationService.navigateTo(Routes.loginRoute);
      }
    }
    notifyListeners();
    setBusy(false);
  }
}
