import 'package:flutter/material.dart';

class ExtraUrl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Nothing to Show.....',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w600, color: Colors.red),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Come back in Future when there is release!!!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
