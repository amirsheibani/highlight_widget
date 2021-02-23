import 'dart:async';

import 'package:flutter/material.dart';

class HighlightWidget extends StatefulWidget {
  final double width;
  final double height;
  final Widget child;
  final BorderRadius borderRadius;
  final BoxShape boxShape;

  HighlightWidget({double width,double height,Widget child,BorderRadius borderRadius,BoxShape boxShape}): this.width = width ,this.height = height ,this.child = child,this.borderRadius = borderRadius,this.boxShape = boxShape;

  @override
  _HighlightWidgetState createState() => _HighlightWidgetState();
}
class _HighlightWidgetState extends State<HighlightWidget> {

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: widget.width != null && widget.height != null ?
      Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: widget.borderRadius,
          shape: widget.boxShape != null ? widget.boxShape :BoxShape.rectangle,
          // color: Color(0xFF181A1D),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.2, 0.98],
            colors: [Color(0xFF181A1D) ,Color(0xFF363A3F),],//
          ),
          boxShadow: [
            BoxShadow(color: Color(0xFF363A3F), offset: Offset((widget.width / 12.8) * -1, (widget.width / 12.8) * -1), blurRadius: (widget.width / 7.31)),
            BoxShadow(color: Color(0xFF181A1D), offset: Offset((widget.width / 12.8), (widget.width / 12.8)), blurRadius: (widget.width / 7.31)),
          ],
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              decoration: BoxDecoration(
                shape: widget.boxShape != null ? widget.boxShape :BoxShape.rectangle,
                borderRadius: widget.borderRadius,
                color: Color(0xFF212428),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.2,0.7,0.9],
                  colors: [Color(0xFF2E3237) ,Color(0xFF26282D),Color(0xFF1D1F23),],
                ),
                // boxShadow: [BoxShadow(color: Colors.white,offset: Offset.zero,blurRadius: 0, spreadRadius: 10),],
              ),
              child: widget.child != null ? Center(child: widget.child)  : SizedBox(),
            ),
          ),
        )
      ) : SizedBox(),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}