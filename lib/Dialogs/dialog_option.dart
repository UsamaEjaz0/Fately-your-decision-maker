import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haha_decision_maker/Theme/colors.dart';
import '../Theme/assets.dart';
import '../Utils/app_config.dart';

// ignore: must_be_immutable
class OptionDialog extends StatefulWidget {
  String title, desc;

  OptionDialog({title, desc}) {
    this.title = title;
    this.desc = desc;
  }

  @override
  _OptionDialogState createState() => _OptionDialogState(desc);
}

class _OptionDialogState extends State<OptionDialog> {
  // bool _isEditingText = false;
  // TextEditingController _editingController;
  // String initialText;

  _OptionDialogState(desc){
    // initialText = desc;
  }
  // @override
  // void initState() {
  //   super.initState();
  //   _editingController = TextEditingController(text: initialText);
  // }
  // @override
  // void dispose() {
  //   _editingController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {

    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(9),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    String value = "";
    SizeConfig().init(context);
    return Stack(
      children: <Widget>[
        Container(
          width: SizeConfig.safeBlockHorizontal * 92,
          height: SizeConfig.safeBlockVertical * 35,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(9),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            SizeConfig.safeBlockHorizontal * 3.2,
                            SizeConfig.safeBlockVertical * 1.5, 0,
                            SizeConfig.safeBlockVertical * 2),
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color: Color(0xff717171),
                          ),
                        ),
                      )),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                      ),
                      iconSize: 20,
                      color: Colors.red,
                      splashColor: Colors.purple,
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                    ),
                  ),

                ],
              ),
              Container(
                width: SizeConfig.safeBlockHorizontal * 88,
                height: SizeConfig.safeBlockVertical * 18,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      SizeConfig.safeBlockHorizontal * 2.5,
                      SizeConfig.safeBlockVertical * 1.5, 0, SizeConfig.safeBlockVertical * 1.5),
                  child: TextField (
                    maxLines: null,
                    style: TextStyle(
                          fontFamily: "Montserrat",
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal,
                          fontSize: 13.0,
                          color: Color(0xff717171),
                        ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Write a choice...'
                    ),
                    onChanged: (text) {
                      value = text;
                      print(value);
                    },
                  ),

                ),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color(0xffF6F6F6),
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      0,
                      SizeConfig.safeBlockVertical * 1.5, SizeConfig.safeBlockHorizontal * 2.5,0),
                  child: Container(
                    width: SizeConfig.safeBlockHorizontal * 28,
                    height: SizeConfig.safeBlockVertical * 5.5,
                    child: TextButton(

                        onPressed: (){},
                        child: Text("Save", style: TextStyle(
                          color: whiteColor
                        ),),
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(purpleColor)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
