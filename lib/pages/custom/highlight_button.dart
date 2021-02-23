import 'dart:async';

import 'package:flutter/material.dart';

class HighlightButton extends StatefulWidget {
  final double size;
  final Icon iconData;
  final BoxShape boxShape;
  final Function onTap;
  final Function onLongPress;

  HighlightButton(double size,{Icon iconData,BoxShape boxShape,Function onTap,Function onLongPress}): this.size = size ,this.iconData = iconData,this.boxShape = boxShape,this.onTap = onTap,this.onLongPress = onLongPress;

  @override
  _HighlightButtonState createState() => _HighlightButtonState();
}
class _HighlightButtonState extends State<HighlightButton> {
  bool toggle = false;
  Timer _timer;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: (){
          widget.onTap();
          toggle = !toggle;
          setState(() {});
          _timer = Timer(Duration(milliseconds: 100), (){
            setState(() {
              toggle = !toggle;
            });
          });
        },
        onLongPress: widget.onLongPress,
        child: Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            shape: widget.boxShape != null ? widget.boxShape : BoxShape.rectangle,
            // color: Color(0xFF181A1D),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.2, 0.98],
              colors: [Color(0xFF181A1D) ,Color(0xFF363A3F),],//
            ),
            boxShadow: [
              BoxShadow(color: Color(0xFF363A3F), offset: Offset((widget.size / 12.8) * -1, (widget.size / 12.8) * -1), blurRadius: (widget.size / 7.31)),
              BoxShadow(color: Color(0xFF181A1D), offset: Offset((widget.size / 12.8), (widget.size / 12.8)), blurRadius: (widget.size / 7.31)),
            ],
          ),
          child: toggle ?
          Center(
            child: Container(
              width: widget.size / 1.04,
              height: widget.size / 1.04,
              decoration: BoxDecoration(
                shape: widget.boxShape != null ? widget.boxShape :BoxShape.rectangle,
                // color: Color(0xFF212428),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.2,0.7,0.9],
                  colors: [Color(0xFF1D1F23),Color(0xFF26282D),Color(0xFF2E3237),],
                ),
                // boxShadow: [BoxShadow(color: Colors.white,offset: Offset.zero,blurRadius: 0, spreadRadius: 10),],
              ),
              child: widget.iconData != null ? widget.iconData: SizedBox(),
            ),
          ):
          Center(
            child: Container(
              width: widget.size / 1.04,
              height: widget.size / 1.04,
              decoration: BoxDecoration(
                shape: widget.boxShape != null ? widget.boxShape :BoxShape.rectangle,
                // color: Color(0xFF212428),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.2,0.4,0.9],
                  colors: [Color(0xFF2E3237),Color(0xFF26282D),Color(0xFF1D1F23)],
                ),
                // boxShadow: [BoxShadow(color: Colors.white,offset: Offset.zero,blurRadius: 0, spreadRadius: 10),],
              ),
              child: widget.iconData != null ? widget.iconData : SizedBox(),
            ),
          )
          ,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}