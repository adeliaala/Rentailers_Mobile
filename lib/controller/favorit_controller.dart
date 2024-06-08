import 'package:get/get.dart';
import 'package:mobile_apps/models/mobil_models.dart';
class FavoriteController extends GetxController {
  var favoriteProducts = <MobilSayaModel>[].obs;

  void addProductToFavorites(MobilSayaModel product) {
    favoriteProducts.add(product);
  }

  void removeProductFromFavorites(MobilSayaModel product) {
    favoriteProducts.remove(product);
  }

  bool isFavorite(MobilSayaModel product) {
    return favoriteProducts.contains(product);
  }
}
