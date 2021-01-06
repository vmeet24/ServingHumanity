import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:serving_humanity/ui/shared/shared_styles.dart';
import 'package:serving_humanity/ui/shared/ui_helpers.dart';
import 'package:serving_humanity/ui/widgets/note_text.dart';

// class InputFieldV2 extends StatelessWidget {
//   const InputFieldV2({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
//       child: TextField(
//         keyboardType: TextInputType.emailAddress,
//         style: TextStyle(fontSize: 18),
//         decoration: InputDecoration(
//           hintText: 'E-Mail Address',
//           enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(color: Colors.grey)),
//           focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(color: Colors.grey)),
//         ),
//       ),
//     );
//   }
// }

class InputFieldV2 extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool password;
  final bool isReadOnly;
  final String placeholder;
  final String validationMessage;
  final Function enterPressed;
  final bool smallVersion;
  final FocusNode fieldFocusNode;
  final FocusNode nextFocusNode;
  final TextInputAction textInputAction;
  final String additionalNote;
  final Function(String) onChanged;
  final TextInputFormatter formatter;
  final Function onTapFunction;
  final bool search;
  final int maxLines;
  final int mixLines;
  final bool expands;

  InputFieldV2({
    @required this.controller,
    @required this.placeholder,
    this.enterPressed,
    this.fieldFocusNode,
    this.nextFocusNode,
    this.additionalNote,
    this.onChanged,
    this.formatter,
    this.validationMessage,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.password = false,
    this.isReadOnly = false,
    this.smallVersion = false,
    this.onTapFunction,
    this.search = false,
    this.maxLines = 1,
    this.expands = false,
    this.mixLines = 1,
  });

  @override
  _InputFieldV2State createState() => _InputFieldV2State();
}

class _InputFieldV2State extends State<InputFieldV2> {
  bool isPassword;
  double fieldHeight = 55;

  @override
  void initState() {
    super.initState();
    isPassword = widget.password;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: 5.0),
          // height: widget.smallVersion ? 40 : fieldHeight,
          alignment: Alignment.centerLeft,
          padding: fieldPadding,

          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: widget.isReadOnly
                      ? disabledFieldDecortaion
                      : BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                        ),
                  child: TextFormField(
                    minLines: widget.mixLines,
                    maxLines: widget.maxLines,
                    controller: widget.controller,
                    keyboardType: widget.textInputType,
                    focusNode: widget.fieldFocusNode,
                    textInputAction: widget.textInputAction,
                    onChanged: widget.onChanged,
                    inputFormatters:
                        widget.formatter != null ? [widget.formatter] : null,
                    onEditingComplete: () {
                      if (widget.enterPressed != null) {
                        FocusScope.of(context).requestFocus(FocusNode());
                        widget.enterPressed();
                      }
                    },
                    onFieldSubmitted: (value) {
                      if (widget.nextFocusNode != null) {
                        widget.nextFocusNode.requestFocus();
                      }
                    },
                    expands: widget.expands,
                    obscureText: isPassword,
                    readOnly: widget.isReadOnly,
                    decoration: InputDecoration(
                      hintText: widget.placeholder,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: widget.isReadOnly
                          ? OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.grey))
                          : OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Color(0xffEE3E42))),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => setState(() {
                  isPassword = !isPassword;
                }),
                child: widget.password
                    ? Container(
                        width: fieldHeight,
                        height: fieldHeight,
                        alignment: Alignment.center,
                        child: FaIcon(
                          isPassword
                              ? FontAwesomeIcons.eyeSlash
                              : FontAwesomeIcons.eye,
                          color: Color(0xffEE3E42),
                        ))
                    : Container(),
              ),
              GestureDetector(
                onTap: widget.onTapFunction,
                child: widget.search
                    ? Container(
                        width: fieldHeight,
                        height: fieldHeight,
                        alignment: Alignment.center,
                        child: Icon(Icons.search))
                    : Container(),
              ),
            ],
          ),
        ),
        if (widget.validationMessage != null)
          Center(
            child: NoteText(
              widget.validationMessage,
              color: Colors.red,
            ),
          ),
        if (widget.additionalNote != null) verticalSpace(5),
        if (widget.additionalNote != null)
          Center(child: NoteText(widget.additionalNote)),
        verticalSpaceSmall
      ],
    );
  }
}
