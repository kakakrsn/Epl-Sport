import 'package:dio/dio.dart';
import 'package:epl_sport/models/club_model.dart' as clubModel;

class ClubApiService {

    final client = Dio()..options.headers['X-RapidAPI-Key'] = '93c25bae5dmshe0c75e88e83c73dp11eacajsn850cbe806dc2';

  Future<List<clubModel.Response>?> getClubList() async {
    final url = 'https://api-football-v1.p.rapidapi.com/v3/teams?league=39&season=2020';

    try {
      final response = await client.get(url);
      // return response.map<footballModel.Football>((e) {return footballModel.Football.fromJson(e);}).toList();

      if (response.statusCode == 200) {
        final result = clubModel.ClubList.fromJson(response.data);
        return result.response;
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
        throw response.statusMessage.toString();
      }
    } catch (error) {
      print(error);
    }
  }
}

