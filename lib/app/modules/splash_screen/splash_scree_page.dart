import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashScreenPage extends StatefulWidget {
  final String title;
  const SplashScreenPage({Key key, this.title = "SplashScreen"}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  //use 'controller' variable to access controller
  List<Future> precaches = [
    Future.delayed(Duration(seconds: 2)),
  ];

  @override
  void initState() {
    super.initState();
    // Future.wait(precaches).then((value) => Modular.to.pushReplacementNamed("/login"));
    Future.wait(precaches).then((value) => Modular.to.pushReplacementNamed("/home"));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FlutterLogo(size: 100),
            Padding(
              padding: const EdgeInsets.all(6),
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
