import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minha_loja/app/shared/resources/cores.dart';
import 'package:minha_loja/app/shared/resources/medidas.dart';

enum EnumTipoTextFormField {
  rigt,
  left,
  center,
}

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final Function onChange;
  final String Function() errorText;
  final String errorTextStr;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final EnumTipoTextFormField tipoTextFormField;
  final String initialValue;
  final bool readOnly;
  final bool enabled;
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function validator;
  final int maxLength;
  final List<TextInputFormatter> inputFormatters;
  final int minLines;
  final int maxLines;
  final Function onSaved;
  final Widget suffixIcon;
  final Function(String) onFieldSubmitted;
  final bool disableMargin;
  final bool obscureText;
  final bool isTextArea;

  const CustomTextFormField({
    Key key,
    @required this.labelText,
    this.onChange,
    this.errorText,
    this.errorTextStr,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.tipoTextFormField = EnumTipoTextFormField.center,
    this.initialValue,
    this.readOnly = false,
    this.controller,
    this.enabled = true,
    this.focusNode,
    this.validator,
    this.maxLength,
    this.inputFormatters,
    this.minLines,
    this.maxLines,
    this.onSaved,
    this.suffixIcon,
    this.onFieldSubmitted,
    this.disableMargin = false,
    this.obscureText = false,
    this.isTextArea = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EdgeInsetsGeometry margin;

    if (disableMargin) {
      margin = EdgeInsets.all(0);
    } else {
      margin = EdgeInsets.only(bottom: MARGIN_3);

      if (tipoTextFormField == EnumTipoTextFormField.rigt) {
        margin = EdgeInsets.only(bottom: MARGIN_3, left: MARGIN_1);
      }

      if (tipoTextFormField == EnumTipoTextFormField.left) {
        margin = EdgeInsets.only(bottom: MARGIN_3, right: MARGIN_1);
      }
    }

    return Container(
      margin: margin,
      child: TextFormField(
        maxLengthEnforced: true,
        readOnly: readOnly,
        inputFormatters: inputFormatters,
        focusNode: focusNode,
        enabled: enabled,
        controller: controller,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        onChanged: onChange,
        validator: validator,
        initialValue: initialValue,
        maxLength: maxLength,
        minLines: minLines,
        maxLines: !isTextArea ? 1 : 3,
        onSaved: onSaved,
        onFieldSubmitted: onFieldSubmitted,
        obscureText: obscureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: enabled ? Colors.white : Colors.grey[200],
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AZUL_PADRAO, width: 2.0),
            borderRadius: BorderRadius.circular(BORDER_RADIUS_TEXTFORMFIELD),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[400], width: 1.0),
            borderRadius: BorderRadius.circular(BORDER_RADIUS_TEXTFORMFIELD),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red[700], width: 1.0),
            borderRadius: BorderRadius.circular(BORDER_RADIUS_TEXTFORMFIELD),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red[700], width: 1.0),
            borderRadius: BorderRadius.circular(BORDER_RADIUS_TEXTFORMFIELD),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[300], width: 1.0),
            borderRadius: BorderRadius.circular(BORDER_RADIUS_TEXTFORMFIELD),
          ),
          labelText: labelText,
          errorText: errorText != null
              ? errorText()
              : errorTextStr != ""
                  ? errorTextStr
                  : null,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
