import 'package:flutter/material.dart';
import 'package:minha_loja/app/shared/resources/cores.dart';

class CustomSnackbar {
  String message;
  int duration;
  Color backgroundColor;
  String labelButton;
  Function callback;

  CustomSnackbar({
    @required this.message,
    this.duration,
    this.backgroundColor,
    this.labelButton,
    this.callback,
  });

  SnackBar show() {
    return SnackBar(
      backgroundColor: backgroundColor != null ? backgroundColor : PRETO_MATTE,
      elevation: 1.0,
      margin: EdgeInsets.all(6.0),
      duration: Duration(seconds: duration != null ? duration : 4),
      behavior: SnackBarBehavior.floating,
      content: Text(
        message,
        style: TextStyle(
          color: COR_BRANCA,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
      ),
      action: SnackBarAction(
        textColor: COR_BRANCA,
        label: labelButton != null
            ? labelButton
            : callback != null
                ? "FECHAR"
                : "",
        onPressed: callback != null ? () => callback() : () => null,
      ),
    );
  }
}
