import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:minha_loja/app/shared/widgets/text_form_field/custom_text_form_field.dart';
import 'package:minha_loja/app/shared/models/customer_model.dart';
import 'package:minha_loja/app/shared/widgets/progress.dart';
import '../login_controller.dart';
import 'package:minha_loja/app/shared/services/validador_service.dart';

class LoginRegisterPage extends StatefulWidget {
  final String title;
  const LoginRegisterPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginRegisterPageState createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends ModularState<LoginRegisterPage, LoginController> {
  //use 'controller' variable to access controller
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _firstname = TextEditingController();
  final _lastName = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final Map<String, Object> _formData = {};

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
        automaticallyImplyLeading: true,
      ),
      body: Observer(builder: (_) {
        return CustomProgress(
          child: Form(
            key: globalKey,
            child: _formUI(),
          ),
          inAsyncCall: controller.isApiCallProcess,
          opacity: 0.3,
        );
      }),
    );
  }

  _formUI() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          labelText: "Primeiro nome",
                          keyboardType: TextInputType.text,
                          // onChange: controller.atualizaNome,
                          controller: _firstname,
                          // errorTextStr: controller.validacaoNome,
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return "Digite o primeiro nome";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _formData['firstname'] = value;
                          },
                        ),
                        CustomTextFormField(
                          labelText: "Segundo nome",
                          keyboardType: TextInputType.text,
                          // onChange: controller.atualizaNome,
                          controller: _lastName,
                          // errorTextStr: controller.validacaoNome,
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return "Digite o segundo nome";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _formData['lastName'] = value;
                          },
                        ),
                        CustomTextFormField(
                          labelText: "E-mail",
                          keyboardType: TextInputType.text,
                          // onChange: controller.atualizaNome,
                          controller: _email,
                          // errorTextStr: controller.validacaoNome,
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return "Digite o e-mail";
                            }
                            if (value.isNotEmpty && !value.toString().isValidEmail()) {
                              return 'Digite um e-mail válido';
                            }

                            return null;
                          },
                          onSaved: (value) {
                            _formData['email'] = value;
                          },
                        ),
                        CustomTextFormField(
                          labelText: "Senha",
                          keyboardType: TextInputType.text,
                          // onChange: controller.atualizaNome,
                          // errorTextStr: controller.validacaoNome,
                          controller: _password,
                          obscureText: hidePassword,
                          onSaved: (value) {
                            _formData['password'] = value;
                          },
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return 'Digite uma senha';
                            }
                            return null;
                          },
                          suffixIcon: IconButton(
                            icon: Icon(
                              hidePassword ? Icons.visibility_off : Icons.visibility,
                            ),
                            color: Theme.of(context).accentColor.withOpacity(0.4),
                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: FlatButton(
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 80,
                      ),
                      onPressed: () {
                        if (validateAndSave()) {
                          controller.createCustomer(
                            context,
                            CustomerModel(
                              email: _formData['email'],
                              firstName: _formData['firstname'],
                              lastName: _formData['lastName'],
                              password: _formData['password'],
                            ),
                          );
                        }
                      },
                      child: Text(
                        "Registrar",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      color: Theme.of(context).accentColor,
                      shape: StadiumBorder(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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
