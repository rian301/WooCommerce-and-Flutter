import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:minha_loja/app/modules/home/home_controller.dart';
import 'package:minha_loja/app/modules/home/widgets/category/category_list.dart';

class CategoryCard extends StatefulWidget {
  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends ModularState<CategoryCard, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16, top: 10),
                child: Text(
                  "Categorias",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, top: 10, right: 10),
                child: Text(
                  "Ver todos",
                  style: TextStyle(color: Colors.redAccent),
                ),
              ),
            ],
          ),
          // _categoriesList(),
          Observer(
            builder: (_) {
              if (controller.categories == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return CategoryList(
                categories: controller.categories,
              );
            },
          ),
        ],
      ),
    );
  }
}
