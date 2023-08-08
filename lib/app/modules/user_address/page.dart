import 'package:app_hortifruit_pratico/app/modules/user_address/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAddressPage extends GetView<UserAddressController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Novo endereço')),
        body: controller.obx((state) => SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.ruaController,
                  decoration: const InputDecoration(
                    labelText: 'Rua',
                  ),
                  validator: (String? value) {
                    if (value != null && value.isEmpty) {
                      return 'Preencha o nome da rua';
                    }
          
                    return null;
                  },
                ),
                TextFormField(
                  controller: controller.numeroController,
                  decoration: const InputDecoration(
                    labelText: 'Número',
                  ),
                  validator: (String? value) {
                    if (value != null && value.isEmpty) {
                      return 'Preencha o número da casa/apt';
                    }
          
                    return null;
                  },
                ),
                TextFormField(
                  controller: controller.bairroController,
                  decoration: const InputDecoration(
                    labelText: 'Bairro',
                  ),
                  validator: (String? value) {
                    if (value != null && value.isEmpty) {
                      return 'Preencha o bairro';
                    }
          
                    return null;
                  },
                ),
                TextFormField(
                  controller: controller.pontoreferenciaController,
                  decoration: const InputDecoration(
                    labelText: 'Ponto de referencia',
                  ),
                  validator: (String? value) {
                    if (value != null && value.isEmpty) {
                      return 'Informe um ponto de referencia';
                    }
          
                    return null;
                  },
                ),
                TextFormField(
                  controller: controller.complementoController,
                  decoration: const InputDecoration(
                    labelText: 'Complemento',
                  ),
                ),
                DropdownButtonFormField(
                  value: controller.cityId.value,
                  items: state!
                      .map((city) => DropdownMenuItem<int>(
                          value: city.id, child: Text(city.name)))
                      .toList(),
                  onChanged: controller.chamgeCity,
                  decoration: const InputDecoration(labelText: 'Cidade'),
                  validator: (int? value) {
                    if (value == null) {
                      return 'Selecione a sua cidade';
                    }
          
                    return null;
                  },
                ),
                const SizedBox(height: 16,),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: ElevatedButton(
                            onPressed: controller.submit,
                            child: const Text("Adicionar")),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )));
  }
}
