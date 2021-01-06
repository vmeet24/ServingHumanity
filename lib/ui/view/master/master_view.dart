import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:serving_humanity/ui/view/master/master_view_model.dart';
import 'package:serving_humanity/ui/widgets/app_drawer.dart';
import 'package:serving_humanity/ui/widgets/bottom_nav_bar.dart';
import 'package:stacked/stacked.dart';

class MasterView extends StatelessWidget {
  const MasterView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MasterViewModel>.reactive(
        onModelReady: (model) {
          return model.isLoggedIn();
        },
        builder: (context, model, child) => WillPopScope(
              onWillPop: () async {
                return false;
              },
              child: Scaffold(
                appBar: AppBar(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "SERVING HUMANITY",
                          style: TextStyle(fontSize: 20, letterSpacing: 1),
                        ),
                      ],
                    ),
                    elevation: defaultTargetPlatform == TargetPlatform.android
                        ? 0.0
                        : 0.0),
                drawer: AppDrawer(
                  model: model,
                ),
                bottomNavigationBar: BottomNavBar(
                  model: model,
                ),
                body: model.children[model.currentTab],
              ),
            ),
        viewModelBuilder: () => MasterViewModel());
  }
}
