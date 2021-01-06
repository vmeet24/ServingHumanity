import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:serving_humanity/ui/view/contact_us/contact_us_view_model.dart';

import 'package:stacked/stacked.dart';

class ContactUsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ContactUsViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
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
                        "Contact Us",
                        style: TextStyle(fontSize: 22),
                      ),
                    ],
                  ),
                  elevation: defaultTargetPlatform == TargetPlatform.android
                      ? 0.0
                      : 0.0),
              body: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: ListView(
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              "WhatsApp",
                              style: TextStyle(fontSize: 20.0),
                            ),
                            leading: FaIcon(
                              FontAwesomeIcons.whatsapp,
                              color: Colors.green,
                              size: 40.0,
                            ),
                            onTap: model.makeWhatsApp,
                          ),
                          Divider(),
                          ListTile(
                            title: Text(
                              "Call",
                              style: TextStyle(fontSize: 20.0),
                            ),
                            leading: FaIcon(
                              FontAwesomeIcons.mobileAlt,
                              color: Colors.blue,
                              size: 40.0,
                            ),
                            onTap: model.makePhoneCall,
                          ),
                          Divider(),
                          ListTile(
                            title: Text(
                              "Mail",
                              style: TextStyle(fontSize: 20.0),
                            ),
                            leading: FaIcon(
                              FontAwesomeIcons.envelope,
                              color: Colors.redAccent,
                              size: 40.0,
                            ),
                            onTap: model.makeEmail,
                          ),
                          Divider(),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "FOLLOW US ON",
                    style: TextStyle(letterSpacing: 2),
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 100.0),
                      child: Divider(
                        thickness: 2.0,
                      )),
                  Container(
                    margin: EdgeInsets.only(bottom: 100.0),
                    child: IconButton(
                      onPressed: model.launchInsta,
                      icon: FaIcon(
                        FontAwesomeIcons.instagram,
                        size: 40.0,
                        color: Color(0xffF54872),
                      ),
                    ),
                  )
                ],
              ),
            ),
        viewModelBuilder: () => ContactUsViewModel());
  }
}
