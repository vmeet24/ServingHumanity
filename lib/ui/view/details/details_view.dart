import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:serving_humanity/data_models/event.dart';
import 'package:serving_humanity/ui/shared/ui_helpers.dart';
import 'package:serving_humanity/ui/view/details/details_view_model.dart';
import 'package:serving_humanity/ui/widgets/busy_button.dart';
import 'package:stacked/stacked.dart';

class DetailsView extends StatelessWidget {
  final Event event;

  const DetailsView({this.event});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DetailsViewModel>.reactive(
        onModelReady: (model) {
          model.event = event;
          model.isGoing();
        },
        createNewModelOnInsert: true,
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                leading: Center(
                    child: IconButton(
                  onPressed: () => {Navigator.pop(context)},
                  icon: FaIcon(FontAwesomeIcons.chevronLeft),
                )),
                title: Text("CAMP DETAILS", textAlign: TextAlign.start),
                actions: model.isAdmin
                    ? <Widget>[
                        PopupMenuButton<String>(
                            onSelected: model.navigateToEdit,
                            itemBuilder: (BuildContext context) {
                              return {"Edit"}.map((e) {
                                return PopupMenuItem<String>(
                                    child: Text(e), value: e);
                              }).toList();
                            }),
                      ]
                    : null,
                backgroundColor: Colors.transparent,
                elevation:
                    defaultTargetPlatform == TargetPlatform.android ? 0.0 : 0.0,
                // centerTitle: true,
              ),
              body: Stack(
                children: <Widget>[
                  Container(
                    foregroundDecoration: BoxDecoration(color: Colors.black26),
                    height: 300,
                    child: CachedNetworkImage(
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      imageUrl: event.imageUrl,
                      width: screenWidth(context),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        verticalSpace(200),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 10.0),
                          child: Text(
                            event.title,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(32.0),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text.rich(
                                      TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(
                                          Icons.location_on,
                                          size: 16.0,
                                          color: Colors.grey,
                                        )),
                                        TextSpan(text: "8 km to centrum")
                                      ]),
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12.0),
                                    ),
                                  ),
                                  Text.rich(
                                    TextSpan(children: [
                                      WidgetSpan(
                                        child: Icon(
                                          Icons.access_time,
                                          size: 16.0,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      TextSpan(
                                          text: DateFormat.yMMMd('en_US')
                                              .add_jm()
                                              .format(event.dateTime))
                                    ]),
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12.0),
                                  )
                                ],
                              ),
                              verticalSpace(30.0),
                              verticalSpace(30.0),
                              Text(
                                "Description".toUpperCase(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.0),
                              ),
                              verticalSpace(10.0),
                              Text(
                                event.description,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14.0),
                              ),
                              verticalSpace(20.0),
                              Align(
                                alignment: AlignmentDirectional.topEnd,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    BusyButton(
                                        buttonColor: Colors.green,
                                        circleRadius: 20.0,
                                        height: 50.0,
                                        width: 120.0,
                                        title: "DONATE",
                                        onPressed: null),
                                    BusyButton(
                                        enabled:
                                            model.checkIfGoing ? false : true,
                                        busy: model.isBusy,
                                        circleRadius: 20.0,
                                        height: 45.0,
                                        width: 150.0,
                                        title: model.checkIfGoing
                                            ? "Registered"
                                            : "INTRESTED",
                                        onPressed: model.intrestedEvent),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        viewModelBuilder: () => DetailsViewModel());
  }
}
