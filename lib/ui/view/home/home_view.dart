import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:serving_humanity/ui/shared/ui_helpers.dart';
import 'package:serving_humanity/ui/view/home/home_view_model.dart';
import 'package:serving_humanity/ui/widgets/event_tile_v2.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  static List<String> imgList = [
    'assets/images/cover.jpg',
    'assets/images/cover2.jpg',
    'assets/images/cover3.jpg',
    'assets/images/cover4.jpg',
    'assets/images/food.jpg',
    'assets/images/edu.jpg',
    'assets/images/swachh.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              body: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      // width: screenWidth(context),
                      height: 250.0,
                      child: Carousel(
                          showIndicator: false,
                          images: imgList
                              .map((item) => Image.asset(
                                    item,
                                    fit: BoxFit.fill,
                                  ))
                              .toList()),
                    ),
                  ),
                  verticalSpaceSmall,
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                // Text(
                                //   "'YOU CAN MAKE A DIFFERENCE'",
                                //   textAlign: TextAlign.center,
                                //   style: TextStyle(
                                //       color: Colors.grey[800],
                                //       fontSize: 20.0,
                                //       letterSpacing: 2.0,
                                //       fontWeight: FontWeight.bold),
                                // ),
                                // Divider(),
                                verticalSpaceTiny,
                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Text(
                                    "SERVING OUR LOVE WITH :",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.grey[800],
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.0),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      12, 0, 200.0, 0),
                                  child: Divider(
                                    thickness: 2,
                                  ),
                                )
                              ],
                            ),
                          ),
                          // verticalSpace(10.0),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: ListView(
                                children: <Widget>[
                                  EventTileV2(
                                    img: imgList[4],
                                    text1: "Food &",
                                    text2: "Donations Camps",
                                  ),
                                  EventTileV2(
                                    img: imgList[6],
                                    text1: "Planting",
                                    text2: "Camps",
                                  ),
                                  EventTileV2(
                                    img: imgList[5],
                                    text1: "Educational",
                                    text2: "Camps",
                                  ),
                                  EventTileV2(
                                    img: imgList[6],
                                    text1: "Swachh Bharat",
                                    text2: "Camps",
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  // verticalSpace(10),
                ],
              ),
            ),
        viewModelBuilder: () => HomeViewModel());
  }
}
