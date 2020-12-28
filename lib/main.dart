import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recommend_me/helpers/rest.dart';
import 'package:recommend_me/utils/colors.dart';
import 'package:recommend_me/views/custom_app_bar.dart';
import 'package:recommend_me/views/preview_film.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
              headline4: GoogleFonts.bebasNeue(
                  textStyle: TextStyle(color: AppColors.main_text_color)))),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveWidgets.init(
      context,
      height: 1920, // Optional
      width: 1080, // Optional
      allowFontScaling: true, // Optional
    );

    return ResponsiveWidgets.builder(
        height: 1920, // Optional
        width: 1080, // Optional
        allowFontScaling: true, // Optional
        child: Scaffold(
          backgroundColor: Color(0xFF171717),
          body: Center(
            child: Column(
              children: <Widget>[
                CustomAppBar(),
                PreviewFilm()
                // Image.network(
                //     "https://media.rawg.io/media/games/13a/13a528ac9cf48bbb6be5d35fe029336d.jpg"),
              ],
            ),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}
