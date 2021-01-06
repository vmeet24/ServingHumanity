import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:serving_humanity/ui/view/my_camps/my_camps_view_model.dart';
import 'package:serving_humanity/ui/widgets/events_tile.dart';
import 'package:stacked/stacked.dart';

class MyCampsView extends StatelessWidget {
  const MyCampsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyCampsViewModel>.reactive(
        onModelReady: (model) => model.fetchEvents(),
        builder: (context, model, react) => Scaffold(
              appBar: AppBar(
                  leading: Center(
                      child: IconButton(
                    onPressed: () => {Navigator.pop(context)},
                    icon: FaIcon(FontAwesomeIcons.chevronLeft),
                  )),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "MY CAMPS",
                        style: TextStyle(fontSize: 22, letterSpacing: 0.6),
                      ),
                    ],
                  ),
                  elevation: defaultTargetPlatform == TargetPlatform.android
                      ? 0.0
                      : 0.0),
              body: model.events != null
                  ? Container(
                      margin: EdgeInsets.only(top: 10),
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        itemCount: model.events.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => model
                                .navigateToDetailsScreen(model.events[index]),
                            child: EventsTile(
                              title: model.events[index].title,
                              description: model.events[index].description,
                              imgUrl: model.events[index].imageUrl,
                              time: DateFormat.yMMMd('en_US')
                                  .format(model.events[index].dateTime),
                            ),
                          );
                        },
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(
                            Theme.of(context).primaryColor),
                      ),
                    ),
            ),
        viewModelBuilder: () => MyCampsViewModel());
  }
}
