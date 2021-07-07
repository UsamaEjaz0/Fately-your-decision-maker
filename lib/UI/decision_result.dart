import 'package:flutter/material.dart';
import 'package:haha_decision_maker/Dialogs/dialog_option.dart';
import 'package:haha_decision_maker/Models/choice_model.dart';
import 'package:haha_decision_maker/Utils/app_config.dart';
import 'package:haha_decision_maker/Widgets/custom_decide_button.dart';
import 'package:haha_decision_maker/Widgets/custom_name_text.dart';
import 'package:double_back_to_close/double_back_to_close.dart';

import 'home.dart';

class DecisionResult extends StatefulWidget {
  final Choice selectedChoice;
  const DecisionResult(this.selectedChoice);

  @override
  _DecisionResultState createState() => _DecisionResultState();
}

class _DecisionResultState extends State<DecisionResult> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF7B76ED),
      body: DoubleBack(
        onFirstBackPress: (context) {
          final snackBar = SnackBar(
            content: Text(
              'Press back again to exit',
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            backgroundColor: Color(0xFF5B55DB),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: Color(0xFF7B76ED),
              shape: BoxShape.rectangle,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment(-0.85, 0),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                        child: CustomNameText(
                          fontSize: 37.5,
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
                      padding: EdgeInsets.fromLTRB(12.5, 0, 12.5, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment(0, 0),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                                child: Container(
                                  width: SizeConfig.safeBlockHorizontal * 92,
                                  height: SizeConfig.safeBlockVertical * 26.5,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Align(
                                                alignment: Alignment.topLeft,
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      SizeConfig
                                                              .safeBlockHorizontal *
                                                          3.2,
                                                      SizeConfig
                                                              .safeBlockVertical *
                                                          1.5,
                                                      0,
                                                      SizeConfig
                                                              .safeBlockVertical *
                                                          2),
                                                  child: RichText(
                                                    text: TextSpan(
                                                      text:
                                                          "Your Fate lies in - ",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "Montserrat",
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16.0,
                                                        color:
                                                            Color(0xff717171),
                                                      ),
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                            text:
                                                                'Option ${widget.selectedChoice.choiceNum}',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "Montserrat",
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontSize: 16.0,
                                                              color: Color(
                                                                  0xff717171),
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                )),
                                          ],
                                        ),
                                        Container(
                                          width:
                                              SizeConfig.safeBlockHorizontal *
                                                  88,
                                          height:
                                              SizeConfig.safeBlockVertical * 18,
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                              SizeConfig.safeBlockHorizontal *
                                                  2.5,
                                              SizeConfig.safeBlockVertical *
                                                  1.0,
                                              0,
                                              0,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: SingleChildScrollView(
                                                    child: Text(
                                                      "${widget.selectedChoice.desc}",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "Montserrat",
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 13.0,
                                                        color:
                                                            Color(0xff717171),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            color: Color(0xffF6F6F6),
                                            borderRadius:
                                                BorderRadius.circular(9),
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    12,
                    15,
                    12,
                    15,
                  ),
                  child: CustomButton(
                    'Take another decision',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePageWidget()),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
