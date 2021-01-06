import "package:auto_route/auto_route_annotations.dart";
import 'package:serving_humanity/ui/view/about/about_view.dart';
import 'package:serving_humanity/ui/view/add_event/add_event_view.dart';
import 'package:serving_humanity/ui/view/contact_us/contact_us_view.dart';
import 'package:serving_humanity/ui/view/details/details_view.dart';
import 'package:serving_humanity/ui/view/donate/donate_view.dart';
import 'package:serving_humanity/ui/view/event_list/event_list_view.dart';
import 'package:serving_humanity/ui/view/gallery/gallery_view.dart';
import 'package:serving_humanity/ui/view/home/home_view.dart';
import 'package:serving_humanity/ui/view/location/location_view.dart';
import 'package:serving_humanity/ui/view/login/login_view.dart';
import 'package:serving_humanity/ui/view/master/master_view.dart';
import 'package:serving_humanity/ui/view/my_camps/my_camps_view.dart';
import 'package:serving_humanity/ui/view/profile/profile_view.dart';
import 'package:serving_humanity/ui/view/setting/setting_view.dart';
import 'package:serving_humanity/ui/view/sign_up/sign_up_view.dart';
import 'package:serving_humanity/ui/view/startup/start_up_view.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  MasterView masterRoute;
  HomeView homeRoute;
  DetailsView detailsRoute;
  LoginView loginRoute;
  SignUpView signUpRoute;
  StartUpView startUpRoute;
  DonateView donateRoute;
  AddEventView addEventRoute;
  LocationView locationRoute;
  SettingView settingRoute;
  AboutView aboutRoute;
  ContactUsView contactUsRoute;
  EventListView eventListRoute;
  GalleryView galleryRoute;
  MyCampsView myCampsRoute;
  ProfileView profileRoute;
}
