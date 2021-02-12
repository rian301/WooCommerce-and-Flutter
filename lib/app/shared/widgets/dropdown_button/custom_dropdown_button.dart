import 'package:flutter/material.dart';
import 'package:minha_loja/app/shared/resources/medidas.dart';

class CustomDropdownButton<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T> onChanged;
  final T value;
  final bool habilitado;
  final String hint;
  final String errorText;
  final FocusNode focusNode;

  CustomDropdownButton({
    Key key,
    @required this.items,
    @required this.onChanged,
    @required this.value,
    this.habilitado = true,
    this.hint,
    this.errorText,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool existeErro = errorText != null && errorText.isNotEmpty;

    return IgnorePointer(
      ignoring: !habilitado,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(right: PADDING_2, top: PADDING_1, bottom: PADDING_1),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(BORDER_RADIUS_TEXTFORMFIELD)),
              border: Border.all(
                color: habilitado
                    ? existeErro
                        ? Colors.red[700]
                        : Colors.grey[400]
                    : Colors.grey[300],
                width: 1,
              ),
              color: habilitado ? Colors.white : Colors.grey[200],
            ),
            child: DropdownButtonHideUnderline(
              child: ButtonTheme(
                alignedDropdown: false,
                child: DropdownButton(
                  isExpanded: true,
                  focusNode: focusNode,
                  hint: Padding(
                    padding: const EdgeInsets.only(left: PADDING_3),
                    child: habilitado
                        ? Text(hint)
                        : Text(
                            hint,
                            style: TextStyle(
                              color: Colors.grey[500],
                            ),
                          ),
                  ),
                  dropdownColor: Colors.white,
                  style: TextStyle(
                    fontSize: TAMANHO_FONTE_5,
                    color: Colors.grey[800],
                  ),
                  items: items,
                  onChanged: onChanged,
                  value: value,
                ),
              ),
            ),
          ),
          existeErro
              ? Container(
                  padding: EdgeInsets.only(left: 14.0, top: PADDING_2, bottom: PADDING_2),
                  width: double.infinity,
                  child: Text(
                    errorText,
                    style: TextStyle(
                      color: Colors.red[700],
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              : Container(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                ),
        ],
      ),
    );
  }
}
