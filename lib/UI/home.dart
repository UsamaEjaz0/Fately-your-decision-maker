import 'dart:math';

import 'package:flutter/material.dart';
import 'package:haha_decision_maker/Dialogs/dialog_option.dart';
import 'package:haha_decision_maker/Models/choice_model.dart';
import 'package:haha_decision_maker/Theme/colors.dart';

import 'package:haha_decision_maker/Utils/app_config.dart';
import 'package:haha_decision_maker/Widgets/choice_item.dart';
import 'package:haha_decision_maker/Widgets/custom_decide_button.dart';
import 'package:haha_decision_maker/Widgets/custom_name_text.dart';

import 'decision_processing.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:another_flushbar/flushbar_route.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final key = GlobalKey<AnimatedListState>();
  int optionCount = 1;
  final items = List.from([]);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: scaffoldKey,
        floatingActionButton: Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding:
                EdgeInsets.fromLTRB(0, SizeConfig.safeBlockVertical * 8, 0, 0),
            child: new FloatingActionButton(
                elevation: 0.0,
                child: new Icon(
                  Icons.add,
                  color: purpleColor,
                ),
                backgroundColor: whiteColor,
                onPressed: openOptionDialog),
          ),
        ),
        body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: purpleColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            SizeConfig.safeBlockHorizontal * 7,
                            SizeConfig.safeBlockVertical * 4,
                            0,
                            0),
                        child: CustomNameText(
                          fontSize: 43.0,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            SizeConfig.safeBlockHorizontal * 7, 0, 0, 0),
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
                  ],
                ),
                Column(
                  children: [
                    Stack(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                              width: SizeConfig.safeBlockHorizontal * 3.5,
                              height: SizeConfig.safeBlockVertical * 4.34,
                            ),
                            Stack(
                              children: [
                                Align(
                                  alignment: Alignment(0, 0),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        SizeConfig.safeBlockHorizontal * 8.5,
                                        SizeConfig.safeBlockVertical * 1,
                                        0,
                                        0),
                                    child: Container(
                                      width:
                                          SizeConfig.safeBlockHorizontal * 60,
                                      height:
                                          SizeConfig.safeBlockVertical * 3.34,
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
                                  width: SizeConfig.safeBlockHorizontal * 68.4,
                                  height: SizeConfig.safeBlockVertical * 4.34,
                                  decoration: BoxDecoration(
                                    color: purpleColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              width: SizeConfig.safeBlockHorizontal * 25.5,
                              height: SizeConfig.safeBlockVertical * 4.34,
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                              ),
                              child: Center(
                                  child: Text(
                                "Choices",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.0,
                                  color: darkGreyColor,
                                ),
                              )),
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: SizeConfig.safeBlockHorizontal * 95,
                      height: SizeConfig.safeBlockVertical * 65,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(0),
                        ),
                      ),
                      child: Column(children: [
                        Expanded(
                          child: AnimatedList(
                            key: key,
                            initialItemCount: items.length,
                            itemBuilder: (context, index, animation) =>
                                buildItem(items[index], index, animation),
                          ),
                        )
                      ]),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, SizeConfig.safeBlockVertical * 1.5, 0, 10),
                  child: CustomButton(
                    "Decide Your Fate",
                    onTap: items.length < 2
                        ? () {
                            Flushbar(
                              messageText: Text(
                                "Add Atleast two choices to make a decision",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.0,
                                  color: whiteColor,
                                ),
                              ),
                              duration: Duration(seconds: 2),
                              flushbarStyle: FlushbarStyle.FLOATING,
                              margin: EdgeInsets.all(90),
                              borderRadius: BorderRadius.circular(8),
                              backgroundColor: purpleColor,
                            )..show(context);
                          }
                        : () {
                            var random = new Random();
                            var i = random.nextInt(items.length);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DecisionProcessing(items[i])),
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

  void openOptionDialog({index = null, item = null}) {
    if (index == null) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return OptionDialog(
              choiceNum: optionCount,
              desc: "",
              save: insertItem,
              edit: false,
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return OptionDialog(
              choiceNum: item.choiceNum,
              desc: item.desc,
              save: editItem,
              edit: true,
              itemIndex: index,
            );
          });
    }
  }

  Widget buildItem(item, int index, Animation<double> animation) =>
      ChoiceItemWidget(
        item: item,
        animation: animation,
        onIconClicked: () => removeItem(index),
        onItemClicked: (item) {
          openOptionDialog(index: index, item: item);
        },
      );

  void editItem(int index, Choice item) {
    removeItem(index);
    items.insert(0, item);
    key.currentState.insertItem(0);
  }

  void insertItem(Choice item) {
    items.insert(0, item);
    key.currentState.insertItem(0);
    optionCount++;
  }

  void removeItem(int index) {
    final item = items.removeAt(index);

    key.currentState.removeItem(
      index,
      (context, animation) => buildItem(item, index, animation),
    );
    if (items.length == 0) {
      setState(() {});
      optionCount = 1;
    }
  }
}
