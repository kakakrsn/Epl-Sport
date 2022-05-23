import 'package:flutter/material.dart';
import 'package:epl_sport/models/club_model.dart' as clubModel;

import '../services/club_api_service.dart';




class ClubViewModel extends ChangeNotifier {
  List<clubModel.Response> _respon = [];
  List<clubModel.Response> get response => _respon;

  Future<void> getAllResult() async {
    final apiService = ClubApiService();

    try {
      final newRespon = await apiService.getClubList();

      _respon = newRespon ?? [];

      print("hasilviewmodelSuccess: $_respon");
    } catch (e) {
      print("hasilviewmodelerror: $e");
    }

    notifyListeners();
  }
}