import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class EventsTile extends StatelessWidget {
  final String imgUrl, title, description, time;
  EventsTile({
    @required this.imgUrl,
    @required this.title,
    @required this.description,
    @required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 230.0,
          child: Card(
            elevation: 5.0,
            child: Column(
              children: <Widget>[
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6.0),
                        topRight: Radius.circular(6.0)),
                    child: CachedNetworkImage(
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      imageUrl: imgUrl,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                      height: 170.0,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(14.0),
                  child: Row(
                    children: <Widget>[
                      // verticalSpace(200),
                      Text(
                        title,
                        style: new TextStyle(fontSize: 20.0),
                      ),
                      Spacer(),
                      Text(
                        time,
                        style: new TextStyle(
                            fontSize: 12.0, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
