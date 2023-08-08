import 'package:app_hortifruit_pratico/app/data/models/city.dart';
import 'package:app_hortifruit_pratico/app/data/models/user_address_request.dart';
import 'package:app_hortifruit_pratico/app/data/services/auth/service.dart';
import 'package:app_hortifruit_pratico/app/modules/user_address/repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAddressController extends GetxController
    with StateMixin<List<CityModel>> {
  final UserAddressRepository _repository;
  UserAddressController(this._repository);

  final formKey = GlobalKey<FormState>();
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

  void submit() {
    Get.focusScope!.unfocus();
    
    if (!formKey.currentState!.validate()) {
      return;
    }

    var userAddressRequest = UserAddressRequestModel(
        street: ruaController.text,
        number: numeroController.text,
        neighborhood: bairroController.text,
        referencePoint: pontoreferenciaController.text,
        cityId: cityId.value!,
        complement: complementoController.text);
    _repository.postAddress(userAddressRequest).then((value) {
      ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(
          const SnackBar(content: Text("Um novo endereço foi cadastrado")));
    },
        onError: (error) => Get.dialog(AlertDialog(
              title: Text(error.toString()),
            )));
  }

  void chamgeCity(int? cityIdSelected) {
    cityId.value = cityIdSelected;
  }
}
