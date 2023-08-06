import 'package:app_hortifruit_pratico/app/data/models/address.dart';
import 'package:app_hortifruit_pratico/app/data/providers/api.dart';

class CheckoutRepository {
  final Api _api;

  CheckoutRepository(this._api);

  Future<List<AddressModel>> getUserAddress() => _api.getUserAddress();
}
