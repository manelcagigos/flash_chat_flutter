import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {super.key,
      required this.buttonColor,
      required this.buttonTitle,
      required this.functionOnpressed});

  final Color buttonColor;
  final String buttonTitle;
  final Function functionOnpressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: buttonColor,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () {
            functionOnpressed();
          },
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            buttonTitle,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
