import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  final String text;
  final Function onPressed;

  ButtonPrimary({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(40)),
            ),
            primary: Color(0xFF31CD9D),
            padding: EdgeInsets.symmetric(vertical: 16),
            textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        onPressed: onPressed,
        child: Container(
          width: size.width,
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Color(0xFF31CD9D).withOpacity(0.2),
                blurRadius: 30,
                offset: Offset(0, 16),
              ),
            ],
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Nunito',
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w300),
          ),
        ));
  }
}

class ButtonSecondary extends StatelessWidget {
  final String text;
  final Function onPressed;

  ButtonSecondary({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(40)),
            ),
            side: BorderSide(width: 1, color: Color(0xFF31CD9D)),
            primary: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 46, vertical: 32),
            textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        onPressed: onPressed,
        child: Expanded(
          child: Container(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Nunito',
                  color: Color(0xFF31CD9D),
                  fontSize: 16,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ));
  }
}

class ButtonText extends StatelessWidget {
  final String text;
  final Function onPressed;

  ButtonText({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: 'Nunito',
            color: Color(0xFF31CD9D),
            fontSize: 16,
            fontWeight: FontWeight.w300),
      ),
    );
  }
}
