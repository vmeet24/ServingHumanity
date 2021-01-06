import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:serving_humanity/data_models/event.dart';
import 'package:serving_humanity/ui/shared/ui_helpers.dart';
import 'package:serving_humanity/ui/view/add_event/add_event_view_model.dart';
import 'package:serving_humanity/ui/widgets/input_field_v2.dart';
import 'package:stacked/stacked.dart';

class AddEventView extends StatelessWidget {
  final Event editEvent;

  final title = TextEditingController();
  final desc = TextEditingController();
  final location = TextEditingController();
  final time = TextEditingController();

  DateTime dateTime;
  final titleFocus = FocusNode();
  final descFocus = FocusNode();
  final locationFocus = FocusNode();

  AddEventView({this.editEvent});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddEventViewModel>.reactive(
        onModelReady: (model) async {
          // update the text in the controller
          title.text = editEvent?.title ?? '';
          desc.text = editEvent?.description ?? '';
          location.text = editEvent?.location ?? '';
          time.text = DateFormat.yMMMd('en_US').add_jm().format(dateTime);
          model.setEdittingEvent(editEvent);
        },
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                leading: Center(
                    child: IconButton(
                  onPressed: () => {Navigator.pop(context)},
                  icon: FaIcon(FontAwesomeIcons.chevronLeft),
                )),
                title: Text(
                  "ADD CAMP",
                  style: TextStyle(fontSize: 22, letterSpacing: 1),
                ),
                // backgroundColor: Colors.transparent,
                elevation:
                    defaultTargetPlatform == TargetPlatform.android ? 0.0 : 0.0,
                actions: <Widget>[
                  GestureDetector(
                    onTap: () {
                      if (!model.isBusy) {
                        model.uploadEvent(
                            title: title.text,
                            desc: desc.text,
                            location: location.text,
                            date: dateTime);
                      }
                    },
                    child: Center(
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: FaIcon(FontAwesomeIcons.cloudUploadAlt)),
                    ),
                  )
                ],
              ),
              body: model.isBusy
                  ? Container(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              model.getImage();
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 6.0, horizontal: 12.0),
                              height: 170,
                              decoration: model.selectedImage == null
                                  ? BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(6))
                                  : null,
                              width: MediaQuery.of(context).size.width,
                              child: model.selectedImage != null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(6),
                                      child: Image.file(
                                        model.selectedImage,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : Icon(
                                      Icons.add_a_photo,
                                      color: Colors.black45,
                                    ),
                            ),
                          ),
                          verticalSpace(25.0),
                          Container(
                            // padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              children: <Widget>[
                                InputFieldV2(
                                  fieldFocusNode: titleFocus,
                                  nextFocusNode: descFocus,
                                  controller: title,
                                  placeholder: "Title",
                                ),
                                verticalSpace(5),
                                InputFieldV2(
                                  textInputType: TextInputType.multiline,
                                  fieldFocusNode: descFocus,
                                  // nextFocusNode: locationFocus,\
                                  // expands: true,
                                  maxLines: 8,
                                  controller: desc,
                                  placeholder: "Description",
                                ),
                                verticalSpace(5),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 2,
                                      child: InputFieldV2(
                                        fieldFocusNode: locationFocus,
                                        controller: location,
                                        placeholder: "Location",
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 18.0, 8.0),
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: FaIcon(Icons.location_on,
                                            size: 34.0, color: Colors.red),
                                      ),
                                    ),
                                  ],
                                ),
                                verticalSpaceMedium,
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 2,
                                      child: InputFieldV2(
                                        isReadOnly: true,
                                        // fieldFocusNode: locationFocus,
                                        controller: time,
                                        placeholder: "Time",
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 18.0, 8.0),
                                      child: GestureDetector(
                                        onTap: () async {
                                          dateTime = await DatePicker
                                              .showDateTimePicker(context,
                                                  theme: DatePickerTheme(
                                                      containerHeight: 350.0));
                                          time.text = DateFormat.yMMMd('en_US')
                                              .add_jm()
                                              .format(dateTime);
                                        },
                                        child: FaIcon(
                                          FontAwesomeIcons.clock,
                                          size: 34.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                verticalSpaceMedium,
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
        viewModelBuilder: () => AddEventViewModel());
  }
}
