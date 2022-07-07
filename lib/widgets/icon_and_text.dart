import 'package:flutter/cupertino.dart';
import 'package:flutter_application/utils/dimensions.dart';
import 'package:flutter_application/widgets/small_text.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? color;
  final Color? iconColor;
  const IconAndText({
    Key? key,
    required this.icon,
    required this.text,
    this.color = const Color(0xFFccc7c5),
    this.iconColor = const Color(0xFF332d2b),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: Dimensions.iconSize24,
        ),
        const SizedBox(width: 5),
        SmallText(
          text: text,
          color: color,
        ),
      ],
    );
  }
}
