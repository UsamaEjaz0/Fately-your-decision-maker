import 'package:flutter/material.dart';
import 'package:haha_decision_maker/Theme/colors.dart';

import 'package:haha_decision_maker/Utils/app_config.dart';
import 'package:haha_decision_maker/Widgets/custom_decide_button.dart';
import 'package:haha_decision_maker/Widgets/custom_name_text.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: purpleColor,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        SizeConfig.safeBlockHorizontal * 7,
                        SizeConfig.safeBlockVertical * 4,
                        0,
                        0),
                    child: CustomNameText(fontSize: 43.0,),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        SizeConfig.safeBlockHorizontal * 7,
                        0,
                        0,
                        0),
                    child: Text(
                      'Your decision maker',
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.normal,
                        fontSize: 20.0,
                        color: whiteColor),
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Stack(
                          children: [
                            Align(
                              alignment: Alignment(0, 0),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(31.5, 0, 0, 0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.6,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.684,
                              height: 25,
                              decoration: BoxDecoration(
                                color: Color(0xFF7B76ED),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            )
                          ],
                        ),
                        Container(
                          width: SizeConfig.safeBlockHorizontal * 25.5,
                          height: 25,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 342,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(0),
                    ),
                  ),
                ),
                CustomButton("Decide Your Fate", onTap: onTap,)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Function onTap(){
    print("Hi");
  }
}
