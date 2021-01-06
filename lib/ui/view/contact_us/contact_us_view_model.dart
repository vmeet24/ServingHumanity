import 'package:serving_humanity/app/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsViewModel extends BaseViewModel {
  DialogService _dialogService = locator<DialogService>();
  Future<void> makePhoneCall() async {
    var url = "tel:${08160260709}";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      _dialogService.showDialog(
          title: "Something went wrong", description: "Try again...");
    }
  }

  Future<void> makeEmail() async {
    var url = "mailto:servinghumanitytrust@gmail.com";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      _dialogService.showDialog(
          title: "Something went wrong", description: "Try again...");
    }
  }

  Future<void> makeWhatsApp() async {
    var url = "https://chat.whatsapp.com/G9Mtw5zGBzcLpqZZsfnywn";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      _dialogService.showDialog(
          title: "Something went wrong", description: "Try again...");
    }
  }

  Future<void> launchInsta() async {
    var url = "https://www.instagram.com/serving__humanity/";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      _dialogService.showDialog(
          title: "Something went wrong", description: "Try again...");
    }
  }
}
