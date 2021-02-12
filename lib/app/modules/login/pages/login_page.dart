import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:minha_loja/app/modules/login/login_controller.dart';
import 'package:minha_loja/app/shared/widgets/progress.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  bool hidePassword = true;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final Map<String, Object> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return CustomProgress(
        child: _uiSetup(context),
        inAsyncCall: controller.isApiCallProcess,
        opacity: 0.3,
      );
    });
  }

  Widget _uiSetup(BuildContext context) {
    // _email.text = "thays@gmail.com";
    // _password.text = "12345678";
    // _email.text = "rian@gmail.com";
    // _password.text = "1234567";
    _email.text = "teste@gmail.com";
    _password.text = "1234567";
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).accentColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              margin: EdgeInsets.symmetric(vertical: 120, horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).hintColor.withOpacity(0.2),
                    offset: Offset(0, 10),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Login",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _email,
                      // onSaved: (value) => _email = value,
                      onSaved: (value) {
                        _formData['email'] = value;
                      },
                      validator: (value) => !value.contains("@") ? "E-mail é requerido" : null,
                      decoration: InputDecoration(
                        hintText: "Email",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).accentColor.withOpacity(0.2),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _password,
                      obscureText: hidePassword,
                      // onSaved: (value) => _email = value,
                      onSaved: (value) {
                        _formData['password'] = value;
                      },
                      validator: (value) => value.length < 3 ? "A senha deve conter pelo menos 3 caracteres" : null,
                      decoration: InputDecoration(
                        hintText: "Senha",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).accentColor.withOpacity(0.2),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Theme.of(context).accentColor,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                          color: Theme.of(context).accentColor.withOpacity(0.4),
                          icon: Icon(
                            hidePassword ? Icons.visibility_off : Icons.visibility,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    FlatButton(
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 80,
                      ),
                      onPressed: () {
                        if (validateAndSave()) {
                          controller.login(
                            _formData['email'],
                            _formData['password'],
                            context,
                          );
                        }
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      color: Theme.of(context).accentColor,
                      shape: StadiumBorder(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlatButton(
                          padding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 30,
                          ),
                          shape: StadiumBorder(),
                          onPressed: () {
                            Navigator.pushNamed(context, "/login/login-register");
                          },
                          child: Text(
                            "Criar conta",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      return true;
    }
    return false;
  }
}
