import 'package:flutter/material.dart';
import 'package:minha_loja/app/shared/models/customer_model.dart';
import 'package:minha_loja/app/shared/resources/cores.dart';
import 'package:minha_loja/app/shared/widgets/dialogs/custom_dialog.dart';
import 'package:minha_loja/app/shared/widgets/form_helper.dart';
import 'package:minha_loja/app/shared/widgets/snakbar/custom_snakbar.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:minha_loja/app/shared/repositories/customer_repository.dart';
import 'package:asuka/asuka.dart' as helpers;

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final CustomerRepository _repository;

  _LoginControllerBase(this._repository);

  @observable
  bool isApiCallProcess = false;

  createCustomer(BuildContext context, CustomerModel model) {
    isApiCallProcess = true;
    _repository.createCustomer(model).then((ret) {
      isApiCallProcess = false;
      if (ret) {
        return showDialog(
          widget: CustomDialogX(
            typeDialog: CustomDialogXType.success,
            title: "Tudo certo",
            message: "Cadastro realizado com sucesso!",
            messageCenter: true,
          ),
        );
      } else {
        isApiCallProcess = false;
        return showDialog(
          widget: CustomDialogX(
            typeDialog: CustomDialogXType.error,
            title: "Algo deu errado",
            message: "O e-mail ja esta em uso. Tente novamente com outro e-mail.",
            messageCenter: true,
            buttonBText: "Atualizar",
            buttonBCallback: () async {
              await createCustomer(context, model);
            },
          ),
        );
      }
    });
  }

  login(String email, String password, BuildContext context) async {
    isApiCallProcess = true;
    await _repository.loginCustomer(email, password).then((ret) {
      isApiCallProcess = false;
      if (ret != null && ret.data[0] == true) {
        print(ret.data.token);
        print(ret.data.toJson());
        helpers.showSnackBar(CustomSnackbar(
          message: "Logado com sucesso.",
          backgroundColor: VERDE_STATUS_MATTE,
          duration: 2,
        ).show());
        Navigator.pushNamed(context, "/home");
      } else {
        print("Caiu no else");
        print(ret.data['message']);
        return showDialog(
          widget: CustomDialogX(
            typeDialog: CustomDialogXType.error,
            title: "Algo deu errado",
            message: ret.data['message'],
            messageCenter: true,
            buttonBText: "Atualizar",
            buttonBCallback: () async {
              await login(email, password, context);
            },
          ),
        );
      }
    }).catchError((onError) {
      print(onError);
    });
  }

  Future<void> showDialog({@required CustomDialogX widget, bool dismissible = false}) async {
    return helpers.showDialog(
      barrierDismissible: dismissible,
      builder: (context) => widget,
    );
  }
}
