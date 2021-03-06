import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:minha_loja/app/modules/home/widgets/category/category_card.dart';
import 'package:minha_loja/app/modules/home/widgets/product/product_card.dart';
import 'package:minha_loja/app/shared/configuration/configuration_wp.dart';

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            imageCarousel(context),
            CategoryCard(),
            ProductCard(
              tagId: ConfigurationWp.slideId,
            ),
          ],
        ),
      ),
    );
  }

  Widget imageCarousel(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: Carousel(
        overlayShadow: false,
        borderRadius: true,
        boxFit: BoxFit.none,
        autoplay: true,
        dotSize: 4.0,
        autoplayDuration: Duration(seconds: 8),
        images: [
          FittedBox(
            // fit: BoxFit.cover,
            child: Image.network("image1"),
          ),
          FittedBox(
            // fit: BoxFit.cover,
            child: Image.network("image2"),
          ),
          FittedBox(
            // fit: BoxFit.cover,
            child: Image.network("image3"),
          ),
          FittedBox(
            // fit: BoxFit.cover,
            child: Image.network("image4"),
          ),
        ],
      ),
    );
  }
}
