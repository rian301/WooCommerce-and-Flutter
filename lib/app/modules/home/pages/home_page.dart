import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:minha_loja/app/modules/home/pages/dashborad_page.dart';
import 'package:minha_loja/app/shared/resources/cart_icons.dart';
import 'package:minha_loja/app/shared/resources/cores.dart';
import '../home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  List<Widget> _widgetList = [
    DashBoardPage(),
    DashBoardPage(),
    DashBoardPage(),
    DashBoardPage(),
  ];
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CartIcons.home),
            label: "Loja",
          ),
          BottomNavigationBarItem(
            icon: Icon(CartIcons.cart),
            label: "Carrinho",
          ),
          BottomNavigationBarItem(
            icon: Icon(CartIcons.favourites),
            label: "Favoritos",
          ),
          BottomNavigationBarItem(
            icon: Icon(CartIcons.account),
            label: "Conta",
          ),
        ],
        selectedItemColor: AZUL_PADRAO,
        unselectedItemColor: AZUL_CLARO,
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
      body: _widgetList[_index],
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      centerTitle: true,
      brightness: Brightness.dark,
      elevation: 0,
      backgroundColor: AZUL_STATUS_MATTE,
      automaticallyImplyLeading: false,
      title: Text(
        "Minha loja App",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      actions: [
        Icon(
          Icons.notifications_none,
          color: Colors.white,
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.shopping_cart,
          color: Colors.white,
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
