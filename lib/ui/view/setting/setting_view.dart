import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:serving_humanity/ui/view/setting/setting_view_model.dart';
import 'package:stacked/stacked.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                  leading: IconButton(
                    onPressed: () => {Navigator.pop(context)},
                    icon: FaIcon(FontAwesomeIcons.chevronLeft),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "SETTINGS",
                        style: TextStyle(fontSize: 20, letterSpacing: 1),
                      ),
                    ],
                  ),
                  elevation: defaultTargetPlatform == TargetPlatform.android
                      ? 0.0
                      : 0.0),
              backgroundColor: Colors.white,
              body: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                children: <Widget>[
                  const SizedBox(height: 20.0),
                  model.isUser
                      ? ListTile(
                          title: Text(
                            "Profile Settings",
                            // style: whiteBoldText,
                          ),
                          onTap: model.navigateToProfile,
                        )
                      : Container(),
                  model.isUser ? Divider() : Container(),
                  SwitchListTile(
                    activeColor: Color(0xffEE3E42),
                    title: Text(
                      "Push Notifications",
                      // style: whiteBoldText,
                    ),
                    subtitle: Text(
                      model.isActive ? "On" : "Off",
                      // style: greyTExt,
                    ),
                    value: model.isActive,
                    onChanged: (val) => model.notificationChange(val),
                  ),
                  Divider(),
                  model.isUser
                      ? ListTile(
                          title: Text(
                            "Logout",
                            // style: whiteBoldText,
                          ),
                          onTap: model.signOut,
                        )
                      : Container(),
                ],
              ),
            ),
        viewModelBuilder: () => SettingViewModel());
  }
}
