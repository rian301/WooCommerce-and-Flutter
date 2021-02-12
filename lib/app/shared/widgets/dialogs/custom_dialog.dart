import 'package:flutter/material.dart';
import 'package:minha_loja/app/shared/resources/cores.dart';
import 'package:minha_loja/app/shared/resources/medidas.dart';
import 'package:minha_loja/app/shared/widgets/raised_buttom/custom_raised_button.dart';

enum CustomDialogXType {
  error,
  success,
  information,
  warning,
  confirm,
  help,
}

class CustomDialogX extends StatelessWidget {
  final String title;
  final bool titleCenter;
  final CustomDialogXType typeDialog;
  final Widget icon;
  final String message;
  final bool messageCenter;
  final Widget messageWidget;
  final String buttonAText;
  final Function buttonACallback;
  final String buttonBText;
  final Function buttonBCallback;
  final bool buttonSingle;

  const CustomDialogX({
    Key key,
    this.title,
    this.titleCenter = false,
    this.typeDialog,
    this.icon,
    this.message,
    this.messageCenter = false,
    this.messageWidget,
    this.buttonAText = "Voltar",
    this.buttonACallback,
    this.buttonBText = "Continuar",
    this.buttonBCallback,
    this.buttonSingle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);
    double _maxWidth = 320;
    double _currentWidth = media.size.width;
    Widget _iconDialog;
    String _title;

    if (icon != null) {
      _iconDialog = icon;
    } else {
      switch (typeDialog) {
        case CustomDialogXType.success:
          _iconDialog = Icon(
            Icons.check_circle,
            color: VERDE_STATUS_MATTE,
            size: 50,
          );
          break;

        case CustomDialogXType.error:
          _iconDialog = Icon(
            Icons.cancel,
            color: VERMELHO_MATTE,
            size: 50,
          );
          break;

        case CustomDialogXType.information:
          _iconDialog = Icon(
            Icons.info,
            color: AZUL_STATUS_MATTE,
            size: 50,
          );
          break;

        case CustomDialogXType.warning:
          _iconDialog = Icon(
            Icons.feedback,
            color: LARANJA_STATUS_MATTE,
            size: 50,
          );
          break;

        case CustomDialogXType.confirm:
          _iconDialog = Icon(
            Icons.assignment_turned_in,
            color: AZUL_STATUS_MATTE,
            size: 50,
          );
          break;

        case CustomDialogXType.help:
          _iconDialog = Icon(
            Icons.help,
            color: Colors.grey[600],
            size: 50,
          );
          break;
      }
    }

    if (typeDialog != null && title == null) {
      switch (typeDialog) {
        case CustomDialogXType.success:
          _title = "Sucesso!";
          break;

        case CustomDialogXType.error:
          _title = "Algo deu errado!";
          break;

        case CustomDialogXType.information:
          _title = "Informação";
          break;

        case CustomDialogXType.warning:
        default:
          _title = "Atenção";
          break;
      }
    } else {
      _title = title;
    }

    // BODY DO ALERTDIALOG
    Widget _conteudoDialog() {
      return Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ÍCONE
            _iconDialog != null
                ? Padding(
                    padding: const EdgeInsets.only(bottom: PADDING_2),
                    child: _iconDialog,
                  )
                : SizedBox(),
            //TÍTULO
            _iconDialog != null
                ? Container(
                    padding: const EdgeInsets.only(top: PADDING_2),
                    child: Text(
                      _title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        color: PRETO_MATTE,
                        fontSize: TAMANHO_FONTE_7,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                : SizedBox(),
            // CONTEÚDO - message
            Container(
              child: Padding(
                padding: _iconDialog != null
                    ? EdgeInsets.only(top: PADDING_3, bottom: PADDING_2)
                    : EdgeInsets.only(bottom: PADDING_2),
                child: message != null
                    ? Text(
                        message,
                        textAlign: messageCenter ? TextAlign.center : TextAlign.left,
                        style: TextStyle(
                          fontSize: TAMANHO_FONTE_5,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    : messageWidget,
              ),
            ),
            // BOTÕES
            Padding(
              padding: const EdgeInsets.only(top: PADDING_5, bottom: PADDING_1),
              child: Wrap(
                alignment: WrapAlignment.spaceAround,
                children: [
                  CustomRaisedButton(
                    text: buttonAText,
                    callback: () {
                      Navigator.of(context).pop();
                      if (buttonACallback != null) buttonACallback();
                    },
                    type: RaisedButtonType.secondary,
                  ),
                  if (!buttonSingle)
                    CustomRaisedButton(
                      text: buttonBText,
                      callback: () {
                        Navigator.of(context).pop();
                        if (buttonBCallback != null) buttonBCallback();
                      },
                      type: RaisedButtonType.primary,
                    ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(BORDER_RADIUS_1)),
      ),
      insetPadding: EdgeInsets.all(PADDING_4), // em torno do dialog
      titlePadding: const EdgeInsets.only(
        top: PADDING_8,
        left: PADDING_4,
        right: PADDING_4,
      ), // no título do dialog
      title: _iconDialog != null
          ? null
          : Text(
              _title,
              textAlign: titleCenter ? TextAlign.center : TextAlign.left,
              style: TextStyle(
                fontFamily: "Montserrat",
                color: PRETO_MATTE,
                fontSize: TAMANHO_FONTE_7,
                fontWeight: FontWeight.w600,
              ),
            ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: PADDING_5,
        horizontal: PADDING_4,
      ), // no conteúdo do dialog
      content: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: _currentWidth >= _maxWidth ? _maxWidth : _currentWidth,
          maxWidth: _maxWidth,
        ),
        child: _conteudoDialog(),
      ),
    );
  }
}
