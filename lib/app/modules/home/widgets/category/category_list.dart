import 'package:flutter/material.dart';
import 'package:minha_loja/app/shared/models/category_model.dart';
import 'package:minha_loja/app/shared/resources/cores.dart';

class CategoryList extends StatelessWidget {
  final List<CategoryModel> categories;

  const CategoryList({Key key, @required this.categories}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      alignment: Alignment.centerLeft,
      child: ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          var data = categories[index];
          return Column(
            children: [
              Container(
                width: 70,
                height: 70,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(1.3),
                decoration: BoxDecoration(
                  color: AZUL_STATUS_MATTE,
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 5),
                      blurRadius: 15,
                    )
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(64),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(64.0),
                  child: Image.network(
                    data.image.url,
                    scale: 13,
                    fit: BoxFit.none,
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 75,
                    child: Text(
                      data.categoryName,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  // Container(
                  //   color: Colors.blue,
                  //   child: Icon(
                  //     Icons.keyboard_arrow_right,
                  //     size: 14,
                  //   ),
                  // ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
