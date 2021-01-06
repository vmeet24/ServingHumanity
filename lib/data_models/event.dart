import 'package:flutter/cupertino.dart';

class Event {
  String title;
  String description;
  String location;
  String imageUrl;
  String documentId;
  DateTime dateTime;
  int dateCreated;

  Event(
      {@required this.title,
      @required this.description,
      @required this.imageUrl,
      @required this.location,
      this.documentId,
      @required this.dateTime});

  Event.fromData(Map<dynamic, dynamic> event, String documentId)
      : title = event["title"],
        description = event["description"],
        location = event["location"],
        imageUrl = event["imageUrl"],
        dateTime = DateTime.fromMillisecondsSinceEpoch(event["dateTime"]),
        dateCreated = event["dateCreated"],
        documentId = documentId;

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'location': location,
      'imageUrl': imageUrl,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'dateCreated': DateTime.now().millisecondsSinceEpoch,
    };
  }
}
