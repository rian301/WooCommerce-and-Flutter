import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minha_loja/app/shared/resources/medidas.dart';

class CustomRaisedButton extends StatelessWidget {
  final double minSize;
  final String text;
  final Function callback;
  final double elevation;
  final RaisedButtonSize size;
  final RaisedButtonType type;
  final bool fonteBold;
  final IconData icon;
  final IconData iconFa;
  final double sizeIcon;
  final bool borderHide;

  const CustomRaisedButton({
    Key key,
    @required this.text,
    @required this.callback,
    this.type = RaisedButtonType.primary,
    this.size = RaisedButtonSize.medium,
    this.elevation = 0,
    this.minSize = 120,
    this.fonteBold = false,
    this.icon,
    this.iconFa,
    this.sizeIcon,
    this.borderHide = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool widgetPrimario = type == RaisedButtonType.primary;
    final double sizeBorda = 2.0;
    final bool habilitado = callback != null;

    return ButtonTheme(
      minWidth: minSize,
      child: RaisedButton(
        elevation: elevation,
        disabledColor: Colors.grey[400],
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(50.0),
          side: BorderSide(
            color: habilitado ? Theme.of(context).primaryColor : Colors.grey[400],
            width: borderHide
                ? 0
                : widgetPrimario
                    ? 0
                    : sizeBorda,
            style: BorderStyle.solid,
          ),
        ),
        padding: _sizePadding(size, sizeBorda),
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            icon != null || iconFa != null
                ? Padding(
                    padding: const EdgeInsets.only(right: PADDING_2),
                    child: icon != null
                        ? Icon(
                            icon,
                            color: widgetPrimario ? Colors.white : Theme.of(context).primaryColor,
                            size: sizeIcon != null ? sizeIcon : _sizeIcon(size),
                          )
                        : FaIcon(
                            iconFa,
                            color: widgetPrimario ? Colors.white : Theme.of(context).primaryColor,
                            size: sizeIcon != null ? sizeIcon : _sizeIconFa(size),
                          ),
                  )
                : SizedBox(),
            Text(
              text,
              style: TextStyle(
                fontFamily: "Montserrat",
                color: habilitado
                    ? widgetPrimario
                        ? Colors.white
                        : Theme.of(context).primaryColor
                    : Colors.white,
                fontSize: _sizeFonte(size),
                fontWeight: fonteBold ? FontWeight.w700 : FontWeight.w600,
              ),
            ),
          ],
        ),
        onPressed: callback,
        color: widgetPrimario ? Theme.of(context).primaryColor : Colors.white,
      ),
    );
  }

  double _sizeFonte(RaisedButtonSize size) {
    switch (size) {
      case RaisedButtonSize.small:
        return TAMANHO_FONTE_3;
        break;

      case RaisedButtonSize.big:
        return TAMANHO_FONTE_6;
        break;

      default:
        return TAMANHO_FONTE_5;
    }
  }

  EdgeInsetsGeometry _sizePadding(RaisedButtonSize size, double sizeBorda) {
    switch (size) {
      case RaisedButtonSize.small:
        return EdgeInsets.symmetric(vertical: PADDING_3, horizontal: PADDING_5);
        break;

      case RaisedButtonSize.big:
        return EdgeInsets.symmetric(vertical: PADDING_4, horizontal: PADDING_8);
        break;

      default:
        return EdgeInsets.symmetric(vertical: PADDING_3, horizontal: PADDING_6);
    }
  }

  double _sizeIcon(RaisedButtonSize size) {
    switch (size) {
      case RaisedButtonSize.small:
        return 16.0;
        break;

      case RaisedButtonSize.big:
        return 24.0;
        break;

      default:
        return 20.0;
    }
  }

  double _sizeIconFa(RaisedButtonSize size) {
    switch (size) {
      case RaisedButtonSize.small:
        return 14.0;
        break;

      case RaisedButtonSize.big:
        return 22.0;
        break;

      default:
        return 18.0;
    }
  }
}

enum RaisedButtonSize {
  small,
  medium,
  big,
}

enum RaisedButtonType {
  primary,
  secondary,
}
