import 'dart:convert';

import 'package:app_hortifruit_pratico/app/data/models/address.dart';
import 'package:app_hortifruit_pratico/app/data/models/city.dart';
import 'package:app_hortifruit_pratico/app/data/models/store.dart';
import 'package:app_hortifruit_pratico/app/data/models/user.dart';
import 'package:app_hortifruit_pratico/app/data/models/user_address_request.dart';
import 'package:app_hortifruit_pratico/app/data/models/user_login_request.dart';
import 'package:app_hortifruit_pratico/app/data/models/user_login_response.dart';
import 'package:app_hortifruit_pratico/app/data/services/storage/service.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class Api extends GetConnect {
  final _storageService = Get.find<StorageService>();

  @override
  void onInit() {
    httpClient.baseUrl = 'http://192.168.1.239:3333/';

    httpClient.addRequestModifier((Request request) {
      request.headers['Accept'] = 'application/json';
      request.headers['Content-Type'] = 'application/json';

      return request;
    });

    httpClient.addAuthenticator((Request request) {
      var token = _storageService.token;
      var headers = {'Authorization': "Bearer $token"};

      request.headers.addAll(headers);
      return request;
    });

    super.onInit();
  }

  Future<List<CityModel>> getCities() async {
    var response = _errorHandler(await get('cidades'));

    List<CityModel> data = [];
    for (var city in response.body) {
      data.add(CityModel.fromJson(city));
    }

    return data;
  }

  Future<UserLoginResponseModel> login(UserLoginRequestModel data) async {
    var response = _errorHandler(await post('login', jsonEncode(data)));

    return UserLoginResponseModel.fromJson(response.body);
  }

  Future<UserModel> getUser() async {
    var response = _errorHandler(await get('auth/me'));

    return UserModel.fromJson(response.body);
  }

  Future<List<AddressModel>> getUserAddress() async {
    var response = _errorHandler(await get('enderecos'));

    List<AddressModel> data = [];
    for (var address in response.body) {
      data.add(AddressModel.fromJson(address));
    }

    return data;
  }

  Future<void> postAddress(UserAddressRequestModel data) async {
    _errorHandler(await post('enderecos', jsonEncode(data)));
  }

  Future<List<StoreModel>> getStores() async {
    var response = _errorHandler(await get('cidades/1/estabelecimentos'));

    List<StoreModel> data = [];
    for (var store in response.body) {
      data.add(StoreModel.fromJson(store));
    }

    return data;
  }

  Future<StoreModel> getStore(int id) async {
    var response = _errorHandler(await get('estabelecimento/$id'));

    return StoreModel.fromJson(response.body);
  }

  Response _errorHandler(Response response) {
    // if (kDebugMode) {
    //   print(response.bodyString);
    // }

    switch (response.statusCode) {
      case 200:
      case 202:
      case 204:
        return response;
      default:
        throw 'Ocorreu um erro';
    }
  }
}
