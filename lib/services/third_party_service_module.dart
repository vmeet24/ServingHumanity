import 'package:injectable/injectable.dart';
import 'analytics_service.dart';
import 'push_notification_service.dart';
import 'package:stacked_services/stacked_services.dart';
import './auth_service.dart';
import 'cloud_storage_service.dart';
import 'firestore_service.dart';
import '../utils/image_selector.dart';

@module
abstract class ThirdPartyServicesModule {
  @lazySingleton
  NavigationService get navigationServices;
  @lazySingleton
  DialogService get dialogService;
  @lazySingleton
  AuthService get authService;
  @lazySingleton
  FirestoreService get fireStoreService;
  @lazySingleton
  CloudStorageService get cloudStorageService;
  @lazySingleton
  ImageSelector get imageSelector;
  @lazySingleton
  PushNotificationService get pushNotificationService;
  @lazySingleton
  AnalyticsService get analyticsService;
}
