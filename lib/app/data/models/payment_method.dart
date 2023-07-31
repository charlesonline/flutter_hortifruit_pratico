class PaymentMethodModel {
  late int id;
  late String name;

  PaymentMethodModel({
    required this.id,
    required this.name,
  });

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) => PaymentMethodModel(
    id: json['id'],
    name: json['nome']
  );
}
