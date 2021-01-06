import 'package:flutter/material.dart';
import 'package:serving_humanity/ui/shared/shared_styles.dart';

/// A button that shows a busy indicator in place of title
class BusyButton extends StatefulWidget {
  final bool busy;
  final String title;
  final Function onPressed;
  final bool enabled;
  final double height;
  final double width;
  final double circleRadius;
  final Color buttonColor;
  final double fontSize;
  const BusyButton(
      {@required this.title,
      this.busy = false,
      @required this.onPressed,
      this.enabled = true,
      this.height = 60,
      this.width = 150,
      this.circleRadius = 6,
      this.buttonColor = const Color(0xffEE3E42),
      this.fontSize});

  @override
  _BusyButtonState createState() => _BusyButtonState();
}

class _BusyButtonState extends State<BusyButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.enabled ? widget.onPressed : null,
      child: InkWell(
        child: AnimatedContainer(
          height: widget.busy ? 40 : widget.height,
          width: widget.busy ? 40 : widget.width,
          duration: const Duration(milliseconds: 300),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
              horizontal: widget.busy ? 10 : 15,
              vertical: widget.busy ? 10 : 10),
          decoration: BoxDecoration(
            color: widget.enabled ? widget.buttonColor : Colors.grey[700],
            borderRadius: BorderRadius.circular(widget.circleRadius),
          ),
          child: !widget.busy
              ? Text(
                  widget.title,
                  style:
                      buttonTitleTextStyle.copyWith(fontSize: widget.fontSize),
                )
              : CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
        ),
      ),
    );
  }
}
