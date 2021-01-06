// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:serving_humanity/services/third_party_service_module.dart';
import 'package:serving_humanity/services/analytics_service.dart';
import 'package:serving_humanity/services/auth_service.dart';
import 'package:serving_humanity/services/cloud_storage_service.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:serving_humanity/services/firestore_service.dart';
import 'package:serving_humanity/utils/image_selector.dart';
import 'package:serving_humanity/services/push_notification_service.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  g.registerLazySingleton<AnalyticsService>(
      () => thirdPartyServicesModule.analyticsService);
  g.registerLazySingleton<AuthService>(
      () => thirdPartyServicesModule.authService);
  g.registerLazySingleton<CloudStorageService>(
      () => thirdPartyServicesModule.cloudStorageService);
  g.registerLazySingleton<DialogService>(
      () => thirdPartyServicesModule.dialogService);
  g.registerLazySingleton<FirestoreService>(
      () => thirdPartyServicesModule.fireStoreService);
  g.registerLazySingleton<ImageSelector>(
      () => thirdPartyServicesModule.imageSelector);
  g.registerLazySingleton<NavigationService>(
      () => thirdPartyServicesModule.navigationServices);
  g.registerLazySingleton<PushNotificationService>(
      () => thirdPartyServicesModule.pushNotificationService);
}

class _$ThirdPartyServicesModule extends ThirdPartyServicesModule {
  @override
  AnalyticsService get analyticsService => AnalyticsService();
  @override
  AuthService get authService => AuthService();
  @override
  CloudStorageService get cloudStorageService => CloudStorageService();
  @override
  DialogService get dialogService => DialogService();
  @override
  FirestoreService get fireStoreService => FirestoreService();
  @override
  ImageSelector get imageSelector => ImageSelector();
  @override
  NavigationService get navigationServices => NavigationService();
  @override
  PushNotificationService get pushNotificationService =>
      PushNotificationService();
}
