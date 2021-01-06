import 'package:stacked/stacked.dart';
import 'package:serving_humanity/app/locator.dart';
import 'package:serving_humanity/app/router.gr.dart';
import 'package:serving_humanity/data_models/event.dart';
import 'package:serving_humanity/services/auth_service.dart';
import 'package:serving_humanity/services/firestore_service.dart';
import 'package:stacked_services/stacked_services.dart';

class MyCampsViewModel extends BaseViewModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();

  List<Event> _events = [];
  List<Event> get events => _events;

  Future fetchEvents() async {
    setBusy(true);
    _firestoreService.listenToEvents().listen((eventData) {
      List<Event> updatedEvents = eventData;
      if (updatedEvents != null && updatedEvents.length > 0) {
        try {
          _authService.currentUser.myEvents.forEach((myElement) {
            _events.add(updatedEvents
                .where((element) => element.documentId == myElement)
                .toList()[0]);
          });
        } catch (e) {
          return e.toString();
        }
        notifyListeners();
      }
    });
    setBusy(false);
  }

  Future navigateToDetailsScreen(Event event) async {
    await _navigationService.navigateTo(Routes.detailsRoute,
        arguments: DetailsViewArguments(event: event));
  }

  Future navigateToCreateEvent() async {
    await _navigationService.navigateTo(Routes.addEventRoute);
  }
}
