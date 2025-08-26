import 'dart:developer';
import 'package:fake_store/core/network/network_services/dio_helper.dart';
import 'package:fake_store/domain/repository/repo_service.dart';
import 'package:flutter/material.dart';

class HomeController with ChangeNotifier {
  List productsList = [];
  DioHelper dioHelper = DioHelper();

  HomeController() {
    getProducts();
  }
  getProducts() {
    Repository().getAPI().then((value) {
      productsList = value as List;
      notifyListeners();
    }).onError((error, stackTrace) {
      log(error.toString());
    });
  }
}
