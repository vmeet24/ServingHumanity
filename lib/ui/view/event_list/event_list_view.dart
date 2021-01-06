import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:serving_humanity/ui/view/event_list/event_list_view_model.dart';
import 'package:serving_humanity/ui/widgets/events_tile.dart';
import 'package:stacked/stacked.dart';

class EventListView extends StatelessWidget {
  const EventListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EventListViewModel>.reactive(
        onModelReady: (model) => model.fetchEvents(),
        builder: (context, model, child) => Scaffold(
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
              floatingActionButton: model.isAdmin
                  ? FloatingActionButton(
                      onPressed: model.navigateToCreateEvent,
                      child: Icon(Icons.add),
                    )
                  : null,
            ),
        viewModelBuilder: () => EventListViewModel());
  }
}
