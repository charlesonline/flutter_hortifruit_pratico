import 'package:app_hortifruit_pratico/app/data/models/city.dart';
import 'package:app_hortifruit_pratico/app/data/providers/api.dart';

class UserAddressRepository {
  final Api _api;

  UserAddressRepository(this._api);

  Future<List<CityModel>> getCities() => _api.getCities();
}
