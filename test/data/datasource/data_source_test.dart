import 'package:cupid_media/core/constants/constants.dart';
import 'package:cupid_media/core/error/exception.dart';
import 'package:cupid_media/data/datasource/data_source.dart';
import 'package:cupid_media/data/models/country_model.dart';
import 'package:cupid_media/data/models/state_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import '../../helpers/json_reader.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late DataSourceImpl dataSourceImpl;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSourceImpl = DataSourceImpl(client: mockHttpClient);
  });

  group('getCountry', () {
    test('should return List<CountryModel> when the response code is 200',
        () async {
      //arrange
      when(mockHttpClient.get(Uri.parse(Urls.getCountry), headers: {
        "X-API-Key": Urls.apiKey,
        "User-Agent": Urls.userAgent
      })).thenAnswer((_) async => http.Response(
          readJson('helpers/dummy_data/dummy_country_response.json'), 200));

      //act
      final result = await dataSourceImpl.getCountry();

      //assert
      expect(result, isA<List<CountryModel>>());
    });

    test(
      'should throw a server exception when the response code is 404 or other',
      () async {
        //arrange
        when(
          mockHttpClient.get(Uri.parse(Urls.getCountry), headers: {
            "X-API-Key": Urls.apiKey,
            "User-Agent": Urls.userAgent
          }),
        ).thenAnswer((_) async => http.Response('Not found', 404));

        //act
        final result = dataSourceImpl.getCountry();

        //assert
        expect(result, throwsA(isA<ServerException>()));
      },
    );
  });
  group('getState', () {
    test('should return List<StateModel> when the response code is 200',
        () async {
      //arrange
      when(mockHttpClient.get(Uri.parse(Urls.getState('5')), headers: {
        "X-API-Key": Urls.apiKey,
        "User-Agent": Urls.userAgent
      })).thenAnswer((_) async => http.Response(
          readJson('helpers/dummy_data/dummy_state_response.json'), 200));

      //act
      final result = await dataSourceImpl.getState(id: 5);

      //assert
      expect(result, isA<List<StateModel>>());
    });

    test(
      'should throw a server exception when the response code is 404 or other',
      () async {
        //arrange
        when(
          mockHttpClient.get(Uri.parse(Urls.getState('5')), headers: {
            "X-API-Key": Urls.apiKey,
            "User-Agent": Urls.userAgent
          }),
        ).thenAnswer((_) async => http.Response('Not found', 404));

        //act
        final result = dataSourceImpl.getState(id: 5);

        //assert
        expect(result, throwsA(isA<ServerException>()));
      },
    );
  });
}
