import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomDesign extends StatelessWidget {
  final cinemaName;
  final String storageUrl;

  BottomDesign(this.cinemaName, this.storageUrl);

  String cinemaHallLink() {
    if (cinemaName == 'guncinema')
      return 'http://gunacinema.com/';
    else {
      if (cinemaName == 'gopi Krishna')
        return 'https://www.showtimenepal.com/2013/08/gopi-krishna-ticket-price-contact-number.html';
      else {
        if (cinemaName == 'bigmovies')
          return 'http://ticket.bigmovies.com.np/';
        else
          return 'https://www.qfxcinemas.com/';
      }
    }
  }

  String mainUrl;
  _launcher() async {
    mainUrl = cinemaHallLink();
    if (await canLaunch(mainUrl)) {
      await launch(mainUrl);
    } else {
      throw 'Could not launch $mainUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                height: 330,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF30115F), Color(0xFF955Fb3)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(30))),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: size.width * 0.9,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 5),
                          blurRadius: 50,
                          color: Color(0xFF121530).withOpacity(0.2),
                        )
                      ]),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 20.0,
                      ),
                      InkWell(
                        onTap: () {
                          _launcher();
                        },
                        child: Container(
                          height: 100,
                          width: size.width * 0.6,
                          child: Image.asset('assets/icons/visit_website.png'),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.motorcycle,
                        color: Colors.grey,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 5),
                            blurRadius: 15,
                            color: Colors.white)
                      ],
                    ),
                    height: 40,
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: Image.asset(
                          'assets/icons/timing.png',
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
                Container(
                    height: 180,
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    child: storageUrl != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              storageUrl,
                              fit: BoxFit.cover,
                            ),
                          )
                        : SpinKitCircle(
                            color: Colors.blue,
                            size: 35.0,
                          )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
