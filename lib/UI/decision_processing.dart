import 'dart:async';

import 'package:flutter/material.dart';
import 'package:haha_decision_maker/Models/choice_model.dart';
import 'package:haha_decision_maker/UI/decision_result.dart';
import 'package:haha_decision_maker/Widgets/custom_name_text.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:haha_decision_maker/Utils/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class DecisionProcessing extends StatefulWidget {
  final Choice selectedChoice;
  BannerAd decisionProcessingBannerAd;
  bool isDecisionProcessingBannerAdReady = false;

  DecisionProcessing(this.selectedChoice, this.decisionProcessingBannerAd, this.isDecisionProcessingBannerAdReady);


  @override
  _DecisionProcessingState createState() => _DecisionProcessingState();
}

class _DecisionProcessingState extends State<DecisionProcessing> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  VideoPlayerController controller;
  Future<void> futureController;
  String waitText = "Deciding your Fate";
  Timer _timer;


  @override
  void initState() {
    controller = VideoPlayerController.asset(
      'assets/vids/mystery_lady.mp4',
    );
    futureController = controller.initialize();
    controller.setLooping(true);
    controller.setVolume(1.0);
    controller.play();
    changeText();
    super.initState();
    startTime();
  }

  changeText() {
    _timer = new Timer(const Duration(milliseconds: 3000), () {
      setState(() {
        waitText = "Short listing our options";
      });
    });
    _timer = new Timer(const Duration(milliseconds: 6000), () {
      setState(() {
        waitText = "Almost Done";
      });
    });
    _timer = new Timer(const Duration(milliseconds: 9500), () {
      setState(() {
        waitText = "Here are the results";
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    _timer.cancel();
    widget.decisionProcessingBannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }

  startTime() async {
    var duration = new Duration(seconds: 10);
    return new Timer(duration, route);
  }

  // waitTime() async {
  //   var duration = new Duration(seconds: 1);
  //   return new Timer(duration, changeText);
  // }

  route() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => DecisionResult(widget.selectedChoice),
        )
    );
  }

  initScreen(BuildContext context) {
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
                  child: CustomNameText(
                    fontSize: 43.0,
                  ),
                ),
              ),
              Align(
                alignment: Alignment(-0.85, 0),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(3, 5, 0, 40),
                  child: Text(
                    "Your decision maker",
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
                            waitText,
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
              ),
              if (widget.isDecisionProcessingBannerAdReady)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: widget.decisionProcessingBannerAd.size.width.toDouble(),
                    height: widget.decisionProcessingBannerAd.size.height.toDouble(),
                    child: AdWidget(ad: widget.decisionProcessingBannerAd),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
