import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:serving_humanity/data_models/event.dart';
import 'package:serving_humanity/data_models/user.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      Firestore.instance.collection('users');

  final CollectionReference _eventCollectionReference =
      Firestore.instance.collection('events');

  StreamController _eventsController =
      StreamController<List<Event>>.broadcast();

  StreamController _usersController = StreamController<User>.broadcast();

  Future createUser(User user) async {
    try {
      await _usersCollectionReference.document(user.id).setData(user.toJson());
    } catch (e) {
      return e.message;
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _usersCollectionReference.document(uid).get();
      return User.fromData(userData.data);
    } catch (e) {
      return e.message;
    }
  }

  Future addEvent(Event event) async {
    try {
      await _eventCollectionReference.add(event.toJson());
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }
      return e.toString();
    }
  }

  Future updateEvent(Event event) async {
    try {
      await _eventCollectionReference
          .document(event.documentId)
          .updateData(event.toJson());
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future updateUser(User user) async {
    try {
      await _usersCollectionReference
          .document(user.id)
          .updateData(user.toJson());
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Stream listenToEvents() {
    _eventCollectionReference
        .orderBy("dateCreated", descending: true)
        .snapshots()
        .listen((eventsSnapshot) {
      if (eventsSnapshot.documents.isNotEmpty) {
        var events = eventsSnapshot.documents
            .map((e) => Event.fromData(e.data, e.documentID))
            .toList();
        _eventsController.add(events);
      }
    });
    return _eventsController.stream;
  }

  Stream listenToUser() {
    _usersCollectionReference.snapshots().listen((usersSnapshot) {
      if (usersSnapshot.documents.isNotEmpty) {
        var events =
            usersSnapshot.documents.map((e) => User.fromData(e.data)).toList();
        _usersController.add(events);
      }
    });
    return _usersController.stream;
  }
}
