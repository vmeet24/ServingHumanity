// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:serving_humanity/ui/view/master/master_view.dart';
import 'package:serving_humanity/ui/view/home/home_view.dart';
import 'package:serving_humanity/ui/view/details/details_view.dart';
import 'package:serving_humanity/data_models/event.dart';
import 'package:serving_humanity/ui/view/login/login_view.dart';
import 'package:serving_humanity/ui/view/sign_up/sign_up_view.dart';
import 'package:serving_humanity/ui/view/startup/start_up_view.dart';
import 'package:serving_humanity/ui/view/donate/donate_view.dart';
import 'package:serving_humanity/ui/view/add_event/add_event_view.dart';
import 'package:serving_humanity/ui/view/location/location_view.dart';
import 'package:serving_humanity/ui/view/setting/setting_view.dart';
import 'package:serving_humanity/ui/view/about/about_view.dart';
import 'package:serving_humanity/ui/view/contact_us/contact_us_view.dart';
import 'package:serving_humanity/ui/view/event_list/event_list_view.dart';
import 'package:serving_humanity/ui/view/gallery/gallery_view.dart';
import 'package:serving_humanity/ui/view/my_camps/my_camps_view.dart';
import 'package:serving_humanity/ui/view/profile/profile_view.dart';

abstract class Routes {
  static const masterRoute = '/';
  static const homeRoute = '/home-route';
  static const detailsRoute = '/details-route';
  static const loginRoute = '/login-route';
  static const signUpRoute = '/sign-up-route';
  static const startUpRoute = '/start-up-route';
  static const donateRoute = '/donate-route';
  static const addEventRoute = '/add-event-route';
  static const locationRoute = '/location-route';
  static const settingRoute = '/setting-route';
  static const aboutRoute = '/about-route';
  static const contactUsRoute = '/contact-us-route';
  static const eventListRoute = '/event-list-route';
  static const galleryRoute = '/gallery-route';
  static const myCampsRoute = '/my-camps-route';
  static const profileRoute = '/profile-route';
  static const all = {
    masterRoute,
    homeRoute,
    detailsRoute,
    loginRoute,
    signUpRoute,
    startUpRoute,
    donateRoute,
    addEventRoute,
    locationRoute,
    settingRoute,
    aboutRoute,
    contactUsRoute,
    eventListRoute,
    galleryRoute,
    myCampsRoute,
    profileRoute,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.masterRoute:
        if (hasInvalidArgs<MasterViewArguments>(args)) {
          return misTypedArgsRoute<MasterViewArguments>(args);
        }
        final typedArgs = args as MasterViewArguments ?? MasterViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => MasterView(key: typedArgs.key),
          settings: settings,
        );
      case Routes.homeRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => HomeView(),
          settings: settings,
        );
      case Routes.detailsRoute:
        if (hasInvalidArgs<DetailsViewArguments>(args)) {
          return misTypedArgsRoute<DetailsViewArguments>(args);
        }
        final typedArgs =
            args as DetailsViewArguments ?? DetailsViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => DetailsView(event: typedArgs.event),
          settings: settings,
        );
      case Routes.loginRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => LoginView(),
          settings: settings,
        );
      case Routes.signUpRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => SignUpView(),
          settings: settings,
        );
      case Routes.startUpRoute:
        if (hasInvalidArgs<StartUpViewArguments>(args)) {
          return misTypedArgsRoute<StartUpViewArguments>(args);
        }
        final typedArgs =
            args as StartUpViewArguments ?? StartUpViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => StartUpView(key: typedArgs.key),
          settings: settings,
        );
      case Routes.donateRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => DonateView(),
          settings: settings,
        );
      case Routes.addEventRoute:
        if (hasInvalidArgs<AddEventViewArguments>(args)) {
          return misTypedArgsRoute<AddEventViewArguments>(args);
        }
        final typedArgs =
            args as AddEventViewArguments ?? AddEventViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => AddEventView(editEvent: typedArgs.editEvent),
          settings: settings,
        );
      case Routes.locationRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => LocationView(),
          settings: settings,
        );
      case Routes.settingRoute:
        if (hasInvalidArgs<SettingViewArguments>(args)) {
          return misTypedArgsRoute<SettingViewArguments>(args);
        }
        final typedArgs =
            args as SettingViewArguments ?? SettingViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => SettingView(key: typedArgs.key),
          settings: settings,
        );
      case Routes.aboutRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => AboutView(),
          settings: settings,
        );
      case Routes.contactUsRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => ContactUsView(),
          settings: settings,
        );
      case Routes.eventListRoute:
        if (hasInvalidArgs<EventListViewArguments>(args)) {
          return misTypedArgsRoute<EventListViewArguments>(args);
        }
        final typedArgs =
            args as EventListViewArguments ?? EventListViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => EventListView(key: typedArgs.key),
          settings: settings,
        );
      case Routes.galleryRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => GalleryView(),
          settings: settings,
        );
      case Routes.myCampsRoute:
        if (hasInvalidArgs<MyCampsViewArguments>(args)) {
          return misTypedArgsRoute<MyCampsViewArguments>(args);
        }
        final typedArgs =
            args as MyCampsViewArguments ?? MyCampsViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => MyCampsView(key: typedArgs.key),
          settings: settings,
        );
      case Routes.profileRoute:
        if (hasInvalidArgs<ProfileViewArguments>(args)) {
          return misTypedArgsRoute<ProfileViewArguments>(args);
        }
        final typedArgs =
            args as ProfileViewArguments ?? ProfileViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => ProfileView(key: typedArgs.key),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//MasterView arguments holder class
class MasterViewArguments {
  final Key key;
  MasterViewArguments({this.key});
}

//DetailsView arguments holder class
class DetailsViewArguments {
  final Event event;
  DetailsViewArguments({this.event});
}

//StartUpView arguments holder class
class StartUpViewArguments {
  final Key key;
  StartUpViewArguments({this.key});
}

//AddEventView arguments holder class
class AddEventViewArguments {
  final Event editEvent;
  AddEventViewArguments({this.editEvent});
}

//SettingView arguments holder class
class SettingViewArguments {
  final Key key;
  SettingViewArguments({this.key});
}

//EventListView arguments holder class
class EventListViewArguments {
  final Key key;
  EventListViewArguments({this.key});
}

//MyCampsView arguments holder class
class MyCampsViewArguments {
  final Key key;
  MyCampsViewArguments({this.key});
}

//ProfileView arguments holder class
class ProfileViewArguments {
  final Key key;
  ProfileViewArguments({this.key});
}
