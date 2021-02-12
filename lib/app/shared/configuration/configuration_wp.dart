import 'package:flutter_modular/flutter_modular.dart';

// part 'configuracoes_wp.g.dart';

@Injectable()
class ConfigurationWp extends Disposable {
  static String key = ""; // Consumer Key WooCommerce
  static String secret = ""; // Secret Key WooCommerce
  static String url = "https://your site/wp-json/wc/v3/";
  static String contentType = "application/json";
  static String customerUrl = "customers";
  static String tokenUrl = "https://your site/wp-json/jwt-auth/v1/token";
  static String categoriesUrl = "products/categories";
  static String productsUrl = "products";

  // In WooCommerce you enter a product category and the url will appear.
  // All products in this category will appear in the list of card products.
  static String category = "22"; // Product category id that will appear.
  static String topSellingProducts = "61"; // Another category with the same criteria as the previous one
  @override
  void dispose() {}
}
