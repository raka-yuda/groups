import 'package:flutter/material.dart';
import 'package:groups/components/button.dart';

class DialogCustom extends StatelessWidget {
  final Function yes;
  final Function no;

  DialogCustom({this.yes, this.no});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0)), //this right here
      child: Container(
        height: size.height * 0.26,
        width: size.height * 0.4,
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Logout',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontFamily: 'Nunito',
                  color: Color(0xFF2F4858),
                  fontSize: 24,
                  fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Are you really wanna logout?',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontFamily: 'Nunito',
                  color: Color(0xFF2F4858),
                  fontSize: 16,
                  fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: size.width * 0.25,
                  child: ButtonSecondary(
                    text: 'No',
                    onPressed: no,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Container(
                  width: size.width * 0.25,
                  child: ButtonPrimary(
                    text: 'Yes',
                    onPressed: yes,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
