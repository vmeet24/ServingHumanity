import 'package:flutter/material.dart';

class EventTileV2 extends StatelessWidget {
  final String img;
  final String text1;
  final String text2;
  const EventTileV2({
    Key key,
    @required this.img,
    @required this.text1,
    this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      margin: EdgeInsets.only(bottom: 10),
      width: double.infinity,
      height: 150,
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(
              img,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 170,
            decoration: BoxDecoration(
                color: Colors.black45.withOpacity(0.4),
                borderRadius: BorderRadius.circular(6)),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(10.0),
              width: 190.0,
              height: 80.0,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.white)),
              // alignment: AlignmentDirectional.center,
              // width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    text1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    text2,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
