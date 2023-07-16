import 'package:app_hortifruit_pratico/app/data/models/store.dart';
import 'package:app_hortifruit_pratico/app/data/providers/api.dart';

class HomeRepository {

  final Api _api;

  HomeRepository(this._api);

  Future<List<StoreModel>> getStores() {
    return _api.getStores();
  }
}
