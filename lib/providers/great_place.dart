import 'package:flutter/material.dart';
import '../models/place.dart';
import 'dart:io';

class GreatPlaces with ChangeNotifier {
  List<Place> _places = [];

  List<Place> get places {
    return [..._places];
  }

  void addPlace(String title, File pickedImage) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      title: title,
      location: null,
      image: pickedImage,
    );
    _places.add(newPlace);
    notifyListeners();
  }
}
