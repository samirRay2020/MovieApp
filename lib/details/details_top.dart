import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movieapp/constants.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:movieapp/details/details_bottom.dart';

class DetailsList extends StatefulWidget {
  final mydata;
  final pageIndex;
  final String isValueCheck;
  final String cinemaName;

  DetailsList({
    this.mydata,
    this.pageIndex,
    this.isValueCheck,
    this.cinemaName,
  });
  @override
  _DetailsListState createState() => _DetailsListState();
}

class _DetailsListState extends State<DetailsList> {
  var url;
  var usedurl;

  void getDataFromStorage() async {
    var ref = FirebaseStorage.instance.ref().child(
          '${widget.cinemaName}/${widget.pageIndex + 1}.JPG',
        );
    url = await ref.getDownloadURL();
    setState(() {
      usedurl = url;
    });
  }

  @override
  void initState() {
    getDataFromStorage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: size.height * 0.4,
            child: Stack(
              children: <Widget>[
                Container(
                  height: size.height * 0.4 - 50,
                  child: widget.mydata != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                          ),
                          child: Image.network(
                            widget.mydata[0][widget.isValueCheck][0]
                                [widget.pageIndex + 1],
                            fit: BoxFit.cover,
                          ),
                        )
                      : SpinKitCircle(
                          color: Colors.blue,
                          size: 35.0,
                        ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: size.width * 0.9,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          topLeft: Radius.circular(50),
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 5),
                            blurRadius: 50,
                            color: Color(0xFF121530).withOpacity(0.2),
                          )
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 50,
                              height: 50,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'assets/icons/imdb.png',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: kDefaultPadding / 4,
                            ),
                            Text(
                              'Imdb Rating',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      color: Colors.grey),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SvgPicture.asset('assets/icons/star_fill.svg'),
                            SizedBox(
                              height: kDefaultPadding / 4,
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  '${widget.mydata[0][widget.isValueCheck][1][widget.pageIndex + 1]}',
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  ' /10',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 17),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          BottomDesign(widget.cinemaName, usedurl),
        ],
      ),
    );
  }
}
