import 'package:app_hortifruit_pratico/app/data/models/city.dart';
import 'package:app_hortifruit_pratico/app/data/services/auth/service.dart';
import 'package:app_hortifruit_pratico/app/modules/user_address/repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAddressController extends GetxController
    with StateMixin<List<CityModel>> {
  final UserAddressRepository _repository;
  UserAddressController(this._repository);

  final _authService = Get.find<AuthService>();

  var ruaController = TextEditingController(text: 'Via Alemanhã');
  var numeroController = TextEditingController(text: '1100');
  var bairroController = TextEditingController(text: 'Chácara Nova Essen');
  var pontoreferenciaController = TextEditingController(text: 'Rua da direita');
  var complementoController = TextEditingController(text: 'Casa 1');
  final cityId = RxnInt();

  @override
  void onInit() {
    _repository.getCities().then((data) {
      change(data, status: RxStatus.success());
    }, onError: (error) {
      change(error, status: RxStatus.error(error));
    });

    super.onInit();
  }

  void submit() {}

  void chamgeCity(int? cityIdSelected) {
    cityId.value = cityIdSelected;
  }
}
