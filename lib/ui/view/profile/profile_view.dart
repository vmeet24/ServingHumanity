import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:serving_humanity/ui/shared/ui_helpers.dart';
import 'package:serving_humanity/ui/view/profile/profile_view_model.dart';
import 'package:serving_humanity/ui/widgets/busy_button.dart';
import 'package:serving_humanity/ui/widgets/input_field_v2.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key key}) : super(key: key);
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController mobile = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
        onModelReady: (model) {
          name.text = model.user.fullName ?? '';
          email.text = model.user.email ?? '';
          mobile.text = model.user.mobile ?? '';
        },
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
                      "PROFILE",
                      style: TextStyle(fontSize: 22, letterSpacing: 1),
                    ),
                  ],
                ),
                elevation: defaultTargetPlatform == TargetPlatform.android
                    ? 0.0
                    : 0.0),
            body: Container(
              color: Colors.white,
              child: ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        height: 250.0,
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child:
                                  Stack(fit: StackFit.loose, children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                        width: 140.0,
                                        height: 140.0,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: ExactAssetImage(
                                                'assets/images/userIcon.png'),
                                            fit: BoxFit.cover,
                                          ),
                                        )),
                                  ],
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: 90.0, right: 100.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        CircleAvatar(
                                          backgroundColor: Colors.red,
                                          radius: 25.0,
                                          child: Icon(
                                            Icons.camera_alt,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    )),
                              ]),
                            )
                          ],
                        ),
                      ),
                      Container(
                        color: Color(0xffFFFFFF),
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 25.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Text(
                                            'Personal Information',
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          model.status
                                              ? GestureDetector(
                                                  child: CircleAvatar(
                                                    backgroundColor: Colors.red,
                                                    radius: 18.0,
                                                    child: Icon(
                                                      Icons.edit,
                                                      color: Colors.white,
                                                      size: 20.0,
                                                    ),
                                                  ),
                                                  onTap: model.edit,
                                                )
                                              : Container(),
                                        ],
                                      )
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 25.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Text(
                                            'Name',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 10.0, right: 25.0, top: 2.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Flexible(
                                        child: InputFieldV2(
                                          isReadOnly: model.status,
                                          controller: name,
                                          placeholder: "Enter Your Name",
                                        ),
                                      ),
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 25.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Text(
                                            'Email ID',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 10.0, right: 25.0, top: 2.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Flexible(
                                        child: InputFieldV2(
                                          isReadOnly: true,
                                          controller: email,
                                          placeholder: "Enter Email Id",
                                        ),
                                      ),
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 25.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Text(
                                            'Mobile',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 10.0, right: 25.0, top: 2.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Flexible(
                                        child: InputFieldV2(
                                          isReadOnly: model.status,
                                          controller: mobile,
                                          placeholder: "Enter Mobile Number",
                                        ),
                                      ),
                                    ],
                                  )),
                              model.status
                                  ? Container()
                                  : Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          BusyButton(
                                            busy: model.isBusy,
                                            buttonColor: Colors.green,
                                            fontSize: 15.0,
                                            circleRadius: 20.0,
                                            height: 35.0,
                                            onPressed: () async {
                                              await model.saveInfo(
                                                  name: name.text,
                                                  mobile: mobile.text);
                                            },
                                            title: "Save",
                                          ),
                                          horizontalSpaceMedium,
                                          BusyButton(
                                            buttonColor: Colors.red,
                                            fontSize: 15.0,
                                            circleRadius: 20.0,
                                            height: 35.0,
                                            onPressed: () {
                                              var user = model.cancel();
                                              name.text = user.fullName;
                                              mobile.text = user.mobile;
                                            },
                                            title: "Cancel",
                                          ),
                                        ],
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )),
        viewModelBuilder: () => ProfileViewModel());
  }
}
