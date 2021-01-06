import 'dart:io';
import 'package:flutter/material.dart';
import 'package:serving_humanity/app/locator.dart';
import 'package:serving_humanity/data_models/event.dart';
import 'package:serving_humanity/services/cloud_storage_service.dart';
import 'package:serving_humanity/services/firestore_service.dart';
import 'package:serving_humanity/utils/image_selector.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddEventViewModel extends BaseViewModel {
  File _selectedImage;
  File get selectedImage => _selectedImage;

  FirestoreService _firestoreService = locator<FirestoreService>();
  NavigationService _navigationService = locator<NavigationService>();
  DialogService _dialogService = locator<DialogService>();
  ImageSelector _imageSelector = locator<ImageSelector>();
  CloudStorageService _cloudStorageService = locator<CloudStorageService>();

  Event _edittingEvent;

  bool get editting => _edittingEvent != null;

  Future getImage() async {
    File image = await _imageSelector.selectImage();
    if (image != null) {
      _selectedImage = File(image.path);
      notifyListeners();
    }
  }

  Future uploadEvent(
      {@required String title,
      @required String desc,
      @required String location,
      @required DateTime date}) async {
    // print(date);
    var result;
    if (_selectedImage != null &&
        title.isNotEmpty &&
        desc.isNotEmpty &&
        location.isNotEmpty &&
        date != null) {
      setBusy(true);
      CloudStorageResult storageResult;

      /// uploading image to firebase storage
      storageResult = await _cloudStorageService.uploadImage(
          imageToUpload: _selectedImage, title: title);
      if (!editting) {
        result = await _firestoreService.addEvent(Event(
            title: title,
            description: desc,
            location: location,
            imageUrl: storageResult.imageUrl,
            dateTime: date));
      } else {
        result = await _firestoreService.updateEvent(Event(
            title: title,
            description: _edittingEvent.description,
            location: _edittingEvent.location,
            imageUrl: _edittingEvent.imageUrl,
            documentId: _edittingEvent.documentId,
            dateTime: date));
      }

      if (result is String) {
        await _dialogService.showDialog(
          title: 'Could not create/update post',
          description: result,
        );
      } else {
        await _dialogService.showDialog(
          title: 'Post successfully Added',
          description: 'Your post has been created/updated',
        );
        setBusy(false);
      }

      _navigationService.popRepeated(1);
    } else {
      await _dialogService.showDialog(
          title: "Input Error", description: "Please Fill all the fields");
    }
  }

  void setEdittingEvent(Event editingEvent) {
    _edittingEvent = editingEvent;
  }
}
