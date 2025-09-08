import 'dart:developer';
import 'package:fake_store/data/models/map_model.dart';
import 'package:fake_store/domain/repository/repo_service.dart';
import 'package:flutter/material.dart';

class MapController with ChangeNotifier {
  MapModel? map;
  bool isLoading = false;

  getMapData() {
    Repository().getMapData(true).then((value) {
      map = value;
      isLoading = true;
      notifyListeners();
    }).catchError((e) {
      log(e.toString());
    });
  }

  MapController() {
    getMapData();
  }
}
