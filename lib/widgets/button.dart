import 'package:flutter/material.dart';
import 'package:fuelmetrics_test/widgets/text.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  CustomButton(
      {Key? key,
      required this.buttonText,
      required this.onPressed,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: Colors.purple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        minimumSize: Size(MediaQuery.of(context).size.width, 56.0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: CustomText(
        text: buttonText,
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }
}
