import 'package:minha_loja/app/shared/models/category_model.dart';
import 'package:minha_loja/app/shared/models/product_model.dart';
import 'package:minha_loja/app/shared/repositories/category_repository.dart';
import 'package:minha_loja/app/shared/repositories/product_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final CategoryRepository _categoryRepository;
  final ProductRepository _productRepository;

  _HomeControllerBase(this._categoryRepository, this._productRepository) {
    getCategories();
  }

  @observable
  List<CategoryModel> categories;

  @observable
  List<ProductModel> products;

  getCategories() async {
    categories = await _categoryRepository.getCategories();
  }

  getPeoducts(String tagId) async {
    products = await _productRepository.getProducts(tagId);
  }
}
