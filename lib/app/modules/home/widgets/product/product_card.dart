import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:minha_loja/app/modules/home/home_controller.dart';
import 'package:minha_loja/app/modules/home/widgets/product/product_list.dart';
import 'package:minha_loja/app/shared/resources/cores.dart';

class ProductCard extends StatefulWidget {
  final String tagId;

  const ProductCard({Key key, @required this.tagId}) : super(key: key);
  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends ModularState<ProductCard, HomeController> {
  @override
  void initState() {
    super.initState();
    controller.getPeoducts(widget.tagId);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffF4F7FA),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16, top: 10),
                child: Text(
                  "Destaques do Dia!",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, top: 10, right: 10),
                child: Text(
                  "Ver todos",
                  style: TextStyle(
                    color: AZUL_ESCURO,
                  ),
                ),
              ),
            ],
          ),
          Observer(
            builder: (_) {
              if (controller.products == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ProductList(
                items: controller.products,
              );
            },
          ),
        ],
      ),
    );
  }
}
