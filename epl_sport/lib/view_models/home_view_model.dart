import 'package:flutter/material.dart';
import 'package:epl_sport/services/api_service.dart';
import 'package:epl_sport/models/bola_model.dart' as footballModel;

class HomeViewModel extends ChangeNotifier {
  List<footballModel.Response> _respon = [];
  List<footballModel.Response> get response => _respon;

  Future<void> getAllResult() async {
    final apiService = ApiService();

    try {
      final newRespon = await apiService.getFootball();

      _respon = newRespon ?? [];

      print("hasilviewmodelSuccess: $_respon");
    } catch (e) {
      print("hasilviewmodelerror: $e");
    }

    notifyListeners();
  }
}