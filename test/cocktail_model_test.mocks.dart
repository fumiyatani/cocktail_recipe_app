// Mocks generated by Mockito 5.0.7 from annotations
// in cocktail_recipe_app/test/cocktail_model_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i7;
import 'dart:convert' as _i8;
import 'dart:typed_data' as _i3;

import 'package:cocktail_recipe_app/data/api/entity/cocktails.dart' as _i5;
import 'package:cocktail_recipe_app/domain/cocktail_list_use_case.dart' as _i10;
import 'package:http/src/base_request.dart' as _i9;
import 'package:http/src/client.dart' as _i6;
import 'package:http/src/response.dart' as _i2;
import 'package:http/src/streamed_response.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

// ignore_for_file: prefer_const_constructors

// ignore_for_file: avoid_redundant_argument_values

class _FakeResponse extends _i1.Fake implements _i2.Response {}

class _FakeUint8List extends _i1.Fake implements _i3.Uint8List {}

class _FakeStreamedResponse extends _i1.Fake implements _i4.StreamedResponse {}

class _FakeCocktails extends _i1.Fake implements _i5.Cocktails {}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockClient extends _i1.Mock implements _i6.Client {
  MockClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i2.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
              returnValue: Future<_i2.Response>.value(_FakeResponse()))
          as _i7.Future<_i2.Response>);
  @override
  _i7.Future<_i2.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
              returnValue: Future<_i2.Response>.value(_FakeResponse()))
          as _i7.Future<_i2.Response>);
  @override
  _i7.Future<_i2.Response> post(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i8.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i2.Response>.value(_FakeResponse()))
          as _i7.Future<_i2.Response>);
  @override
  _i7.Future<_i2.Response> put(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i8.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i2.Response>.value(_FakeResponse()))
          as _i7.Future<_i2.Response>);
  @override
  _i7.Future<_i2.Response> patch(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i8.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i2.Response>.value(_FakeResponse()))
          as _i7.Future<_i2.Response>);
  @override
  _i7.Future<_i2.Response> delete(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i8.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i2.Response>.value(_FakeResponse()))
          as _i7.Future<_i2.Response>);
  @override
  _i7.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: Future<String>.value('')) as _i7.Future<String>);
  @override
  _i7.Future<_i3.Uint8List> readBytes(Uri? url,
          {Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#readBytes, [url], {#headers: headers}),
              returnValue: Future<_i3.Uint8List>.value(_FakeUint8List()))
          as _i7.Future<_i3.Uint8List>);
  @override
  _i7.Future<_i4.StreamedResponse> send(_i9.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
              returnValue:
                  Future<_i4.StreamedResponse>.value(_FakeStreamedResponse()))
          as _i7.Future<_i4.StreamedResponse>);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
}

/// A class which mocks [CocktailListUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockCocktailListUseCase extends _i1.Mock
    implements _i10.CocktailListUseCase {
  MockCocktailListUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i5.Cocktails> searchCocktails(String? searchKeyword) =>
      (super.noSuchMethod(Invocation.method(#searchCocktails, [searchKeyword]),
              returnValue: Future<_i5.Cocktails>.value(_FakeCocktails()))
          as _i7.Future<_i5.Cocktails>);
}
