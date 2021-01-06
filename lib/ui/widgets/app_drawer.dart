import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatelessWidget {
  final dynamic model;
  const AppDrawer({Key key, @required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            color: Color(0xffEE3E42),
            child: UserAccountsDrawerHeader(
              accountName: model.user != null
                  ? Text(model.user.fullName)
                  : Text(
                      "Hello Guest,",
                      style: TextStyle(fontSize: 20.0),
                    ),
              accountEmail: model.user != null ? Text(model.user.email) : null,
              currentAccountPicture: model.user != null
                  ? CircleAvatar(
                      // foregroundColor: Color(0xff0665D9),
                      backgroundColor: Color(0xffEE3E42),
                      child: Text(model.user?.fullName[0].toUpperCase(),
                          style:
                              TextStyle(color: Colors.white, fontSize: 25.0)),
                    )
                  : null,
            ),
          ),
          model.user != null
              ? ListTile(
                  title: Text("My Camps"),
                  leading: FaIcon(FontAwesomeIcons.solidCalendar),
                  onTap: model.navigateToMyCamps,
                )
              : Container(),
          ListTile(
            title: Text("Our Donors"),
            leading: FaIcon(FontAwesomeIcons.handHoldingHeart),
          ),
          ListTile(
            title: Text("About"),
            leading: FaIcon(FontAwesomeIcons.infoCircle),
          ),
          ListTile(
            title: Text("Contact Us"),
            leading: FaIcon(FontAwesomeIcons.addressBook),
            onTap: model.navigateToContact,
          ),
          Divider(),
          ListTile(
            title: Text("Settings"),
            leading: FaIcon(FontAwesomeIcons.cog),
            onTap: model.navigateToSetting,
          ),
        ],
      ),
    );
  }
}
