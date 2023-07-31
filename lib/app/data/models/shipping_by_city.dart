class ShippingByCityModel {
  late int id;
  late String name;
  late num cost;

  ShippingByCityModel({
    required this.id,
    required this.name,
    required this.cost,
  });

  factory ShippingByCityModel.fromJson(Map<String, dynamic> json) => ShippingByCityModel(
    id: json['id'],
    name: json['cidade'],
    cost: double.parse(json['custo_entrega'])
  );
}
