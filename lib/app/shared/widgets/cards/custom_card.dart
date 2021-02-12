import 'package:flutter/material.dart';
import 'package:minha_loja/app/shared/resources/cores.dart';
import 'package:minha_loja/app/shared/resources/medidas.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Radius borderRadius;
  final Function onTap;

  const CustomCard({
    Key key,
    @required this.child,
    this.backgroundColor = COR_BRANCA,
    this.padding = const EdgeInsets.all(PADDING_2),
    this.margin = const EdgeInsets.all(MARGIN_1),
    this.borderRadius = const Radius.circular(BORDER_RADIUS_BUTTON_5),
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: COR_SOMBRA,
            blurRadius: 6.0,
            offset: Offset(0, 6),
          ),
        ],
        borderRadius: BorderRadius.all(borderRadius),
      ),
      child: onTap == null
          ? Padding(padding: padding, child: child)
          : Stack(
              children: [
                Padding(padding: padding, child: child),
                Positioned.fill(
                  child: new Material(
                    color: Colors.transparent,
                    child: new InkWell(
                      borderRadius: BorderRadius.all(borderRadius),
                      onTap: () => onTap(),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
