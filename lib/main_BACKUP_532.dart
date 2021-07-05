import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'UI/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fately',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
<<<<<<< HEAD
      home: HomePageWidget(),
      debugShowCheckedModeBanner: false,
=======
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  VideoPlayerController controller;
  Future<void> futureController;

  @override
  void initState() {
    controller = VideoPlayerController.asset(
      'assets/vids/mystery_lady.mp4',
    );
    futureController = controller.initialize();
    controller.setLooping(true);
    controller.setVolume(1.0);
    controller.play();
    // setState(() {});
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF7B76ED),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            color: Color(0xFF7B76ED),
            shape: BoxShape.rectangle,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: Alignment(-0.85, 0),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: Text(
                    'FATEly',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(-0.85, 0),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(3, 5, 0, 40),
                  child: Text(
                    'Your decision maker',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(12.5, 0, 12.5, 12.5),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.47,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.35,
                        child: Center(
                          child: FutureBuilder(
                            future: futureController,
                            // initialData: InitialData,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                // controller.play();
                                return AspectRatio(
                                  aspectRatio: controller.value.aspectRatio,
                                  child: VideoPlayer(controller),
                                );
                              } else {
                                return Center(
                                    // child: CircularProgressIndicator(),
                                    );
                              }
                            },
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(0, 0),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 32),
                          child: Text(
                            'Deciding your fate',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color(0xFF717171),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SpinKitThreeBounce(
                color: Colors.white,
                size: 30.0,
              )
            ],
          ),
        ),
      ),
>>>>>>> 333d02b5e656c6bac09a536cc12077e9972cb89c
    );
  }
}
