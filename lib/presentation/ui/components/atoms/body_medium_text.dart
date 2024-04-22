import 'package:demo_hu_finance/presentation/ui/components/atoms/button_small_icon.dart';
import 'package:flutter/material.dart';

class BodyMediumText extends StatelessWidget {
  final String text;

  const BodyMediumText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text);
    // return RichText(
    //   text: TextSpan(
    //     children: [
    //       TextSpan(
    //         text: text,
    //       ),
    //       const WidgetSpan(
    //         child: ButtonSmallIcon(
    //           iconData: Icons.arrow_forward_ios,
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}
