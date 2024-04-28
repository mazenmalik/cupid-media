// Mocks generated by Mockito 5.4.4 from annotations
// in cupid_media/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;
import 'dart:convert' as _i14;
import 'dart:typed_data' as _i16;

import 'package:cupid_media/core/error/failure.dart' as _i6;
import 'package:cupid_media/data/datasource/data_source.dart' as _i9;
import 'package:cupid_media/data/models/country_model.dart' as _i10;
import 'package:cupid_media/data/models/state_model.dart' as _i11;
import 'package:cupid_media/domain/entities/country_entity.dart' as _i7;
import 'package:cupid_media/domain/entities/state_entity.dart' as _i8;
import 'package:cupid_media/domain/repositories/place_repository.dart' as _i3;
import 'package:cupid_media/domain/usecases/get_countries_usecase.dart' as _i12;
import 'package:cupid_media/domain/usecases/get_state_usecase.dart' as _i13;
import 'package:dartz/dartz.dart' as _i2;
import 'package:http/http.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i15;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePlaceRepository_1 extends _i1.SmartFake
    implements _i3.PlaceRepository {
  _FakePlaceRepository_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_2 extends _i1.SmartFake implements _i4.Response {
  _FakeResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamedResponse_3 extends _i1.SmartFake
    implements _i4.StreamedResponse {
  _FakeStreamedResponse_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [PlaceRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockPlaceRepository extends _i1.Mock implements _i3.PlaceRepository {
  MockPlaceRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i7.CountryEntity>>> getCountries() =>
      (super.noSuchMethod(
        Invocation.method(
          #getCountries,
          [],
        ),
        returnValue:
            _i5.Future<_i2.Either<_i6.Failure, List<_i7.CountryEntity>>>.value(
                _FakeEither_0<_i6.Failure, List<_i7.CountryEntity>>(
          this,
          Invocation.method(
            #getCountries,
            [],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, List<_i7.CountryEntity>>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i8.StateEntity>>> getStates(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getStates,
          [id],
        ),
        returnValue:
            _i5.Future<_i2.Either<_i6.Failure, List<_i8.StateEntity>>>.value(
                _FakeEither_0<_i6.Failure, List<_i8.StateEntity>>(
          this,
          Invocation.method(
            #getStates,
            [id],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, List<_i8.StateEntity>>>);
}

/// A class which mocks [DataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockDataSource extends _i1.Mock implements _i9.DataSource {
  MockDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<List<_i10.CountryModel>> getCountry() => (super.noSuchMethod(
        Invocation.method(
          #getCountry,
          [],
        ),
        returnValue:
            _i5.Future<List<_i10.CountryModel>>.value(<_i10.CountryModel>[]),
      ) as _i5.Future<List<_i10.CountryModel>>);

  @override
  _i5.Future<List<_i11.StateModel>> getState({required int? id}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getState,
          [],
          {#id: id},
        ),
        returnValue:
            _i5.Future<List<_i11.StateModel>>.value(<_i11.StateModel>[]),
      ) as _i5.Future<List<_i11.StateModel>>);
}

/// A class which mocks [GetCountryUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetCountryUseCase extends _i1.Mock implements _i12.GetCountryUseCase {
  MockGetCountryUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.PlaceRepository get placeRepository => (super.noSuchMethod(
        Invocation.getter(#placeRepository),
        returnValue: _FakePlaceRepository_1(
          this,
          Invocation.getter(#placeRepository),
        ),
      ) as _i3.PlaceRepository);

  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i7.CountryEntity>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue:
            _i5.Future<_i2.Either<_i6.Failure, List<_i7.CountryEntity>>>.value(
                _FakeEither_0<_i6.Failure, List<_i7.CountryEntity>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, List<_i7.CountryEntity>>>);
}

/// A class which mocks [GetStateUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetStateUseCase extends _i1.Mock implements _i13.GetStateUseCase {
  MockGetStateUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.PlaceRepository get placeRepository => (super.noSuchMethod(
        Invocation.getter(#placeRepository),
        returnValue: _FakePlaceRepository_1(
          this,
          Invocation.getter(#placeRepository),
        ),
      ) as _i3.PlaceRepository);

  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i8.StateEntity>>> execute(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue:
            _i5.Future<_i2.Either<_i6.Failure, List<_i8.StateEntity>>>.value(
                _FakeEither_0<_i6.Failure, List<_i8.StateEntity>>(
          this,
          Invocation.method(
            #execute,
            [id],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, List<_i8.StateEntity>>>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i4.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i4.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i5.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i5.Future<_i4.Response>);

  @override
  _i5.Future<_i4.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i5.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i5.Future<_i4.Response>);

  @override
  _i5.Future<_i4.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i14.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i5.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i5.Future<_i4.Response>);

  @override
  _i5.Future<_i4.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i14.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i5.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i5.Future<_i4.Response>);

  @override
  _i5.Future<_i4.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i14.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i5.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i5.Future<_i4.Response>);

  @override
  _i5.Future<_i4.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i14.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i5.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i5.Future<_i4.Response>);

  @override
  _i5.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i5.Future<String>.value(_i15.dummyValue<String>(
          this,
          Invocation.method(
            #read,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i5.Future<String>);

  @override
  _i5.Future<_i16.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i5.Future<_i16.Uint8List>.value(_i16.Uint8List(0)),
      ) as _i5.Future<_i16.Uint8List>);

  @override
  _i5.Future<_i4.StreamedResponse> send(_i4.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i5.Future<_i4.StreamedResponse>.value(_FakeStreamedResponse_3(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i5.Future<_i4.StreamedResponse>);

  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
