import 'dart:developer';

import 'package:fake_store/models/map_model.dart';
import 'package:fake_store/network/repository/repo_service.dart';
import 'package:flutter/material.dart';

class MapController with ChangeNotifier {
  MapModel? map;
  bool isLoading = false;

  getMapData() {
    Repository().getMapData().then((value) {
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
