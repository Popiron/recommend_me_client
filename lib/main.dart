import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recommend_me/bloc/films/films_bloc.dart';
import 'package:recommend_me/helpers/rest.dart';
import 'package:recommend_me/repos/films_storage.dart';
import 'package:recommend_me/repos/games_storage.dart';
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
    return BlocProvider<FilmsBloc>(
      create: (_) => FilmsBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: TextTheme(
                headline4: GoogleFonts.bebasNeue(
                    textStyle: TextStyle(color: AppColors.main_text_color)))),
        home: MyHomePage(),
      ),
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
    BlocProvider.of<FilmsBloc>(context).add(FilmsLoadingEvent());
    // FilmsStorage().initData();
    // GamesStorage().initData();
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
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverList(
                      delegate: SliverChildListDelegate([
                    CustomAppBar(),
                  ])),
                  BlocBuilder<FilmsBloc, FilmsState>(
                    buildWhen: (previousState, state) =>
                        state.runtimeType != previousState.runtimeType,
                    builder: (context, state) {
                      if (state is FilmsLoading) {
                        return SliverList(
                          delegate: SliverChildListDelegate([
                            Container(
                              width: 100,
                              height: 100,
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            ),
                          ]),
                        );
                      } else if (state is FilmsDownloaded) {
                        return SliverGrid(
                          delegate: SliverChildBuilderDelegate(
                              (context, index) =>
                                  PreviewFilm(FilmsStorage().data[index]),
                              childCount: FilmsStorage().data.length),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 5,
                                  mainAxisSpacing: 150,
                                  crossAxisSpacing: 100),
                        );
                      }
                    },
                  )
                  // Image.network(
                  //     "https://media.rawg.io/media/games/13a/13a528ac9cf48bbb6be5d35fe029336d.jpg"),
                ],
              ),
            ),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}
