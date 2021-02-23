import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:highlight_widget/pages/custom/highlight_button.dart';
import 'package:highlight_widget/pages/custom/highlight_container.dart';
import 'package:highlight_widget/pages/setting_page.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _width;

  @override
  void initState() {
    super.initState();
  }

  void _listen(Stream<dynamic> stream) {
    if (stream is Stream<dynamic>) {
      stream.listen((value) async {
        if (value != null) {}
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Device.get().isPhone ? _smartPhoneLayout(context) : (Device.width > Device.height ? _tabletLandscapeLayout(context) : _tabletPortraitLayout(context));
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _smartPhoneLayout(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    return Container(
        decoration: BoxDecoration(
          color: Color(0xFF26282C),
          // gradient: LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   stops: [0.1, 0.9],
          //   colors: [
          //     Color(0xFF363A3F),
          //     Color(0xFF181A1D),
          //   ],
          // ),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _appBar(context),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: HighlightButton(
                      _width / 2,
                      iconData: Icon(Icons.play_arrow_outlined,color: Color(0xFF828487),size: _width / 4,) ,
                      boxShape: BoxShape.circle,
                      onTap: () {},
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: HighlightButton(
                      _width / 2,
                      iconData: Icon(Icons.play_arrow_outlined,color: Color(0xFF828487),size: _width / 4,) ,
                      boxShape: BoxShape.rectangle,
                      onTap: () {},
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: HighlightWidget(
                      width: _width / 2,
                      height: _width / 4,
                      borderRadius: BorderRadius.circular(8.0),
                      child: Text(
                        'Test',
                        style: Theme.of(context).textTheme.headline4.apply(color: Color(0xFF828487)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  Widget _tabletLandscapeLayout(BuildContext context) {
    return _smartPhoneLayout(context);
  }

  Widget _tabletPortraitLayout(BuildContext context) {
    return _smartPhoneLayout(context);
  }

  Widget _appBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      brightness: Brightness.light,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max, //Center Column contents vertically,
            crossAxisAlignment: CrossAxisAlignment.center, //Center Column contents horizontally,
            children: [
              HighlightButton(
                42,
                boxShape: BoxShape.circle,
                iconData: Icon(Icons.menu,color: Color(0xFF828487),size: 42 / 2,),
                onTap: () {
                  _goToSettingPage(context);
                },
              ),
              // Image.asset(Utility.getImagePathAssetsForAppBar('logo'),
              //     height: (Device.get().isPhone) ? (AppBar().preferredSize.height * 33) / 100 : (AppBar().preferredSize.height * 60) / 100, fit: BoxFit.cover),
              SizedBox(
                height: AppBar().preferredSize.height,
                width: 80,
              ),
            ],
          );
        },
      ),
    );
  }

  void _goToSettingPage(BuildContext context) {
    showGeneralDialog(
        context: context,
        barrierColor: Colors.black26,
        barrierDismissible: false,
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(0.0, 1.0);
          var end = Offset(0.0, 0.0);
          var curve = Curves.ease;
          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SettingPage(),
          );
        });
  }
}
