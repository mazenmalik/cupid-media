import 'dart:convert';
import 'package:cupid_media/core/error/exception.dart';
import 'package:cupid_media/data/models/country_model.dart';
import 'package:cupid_media/data/models/state_model.dart';
import 'package:http/http.dart' as http;
import '../../core/constants/constants.dart';

abstract class DataSource {
  Future<List<CountryModel>> getCountry();
  Future<List<StateModel>> getState({required int id});
}

class DataSourceImpl extends DataSource {
  final http.Client client;
  DataSourceImpl({required this.client});

  @override
  Future<List<CountryModel>> getCountry() async {
    final response = await client.get(Uri.parse(Urls.getCountry),
        headers: {"X-API-Key": Urls.apiKey, "User-Agent": Urls.userAgent});

    if (response.statusCode == 200) {
      final List body = json.decode(response.body);
      return body.map((e) => CountryModel.fromJson(e)).toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<StateModel>> getState({required int id}) async {
    final response = await client.get(Uri.parse(Urls.getState(id.toString())),
        headers: {"X-API-Key": Urls.apiKey, "User-Agent": Urls.userAgent});

    if (response.statusCode == 200) {
      final List body = json.decode(response.body);

      return body.map((e) => StateModel.fromJson(e)).toList();
    } else {
      throw ServerException();
    }
  }
}
