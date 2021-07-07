import 'package:flutter/material.dart';
import 'package:haha_decision_maker/Models/choice_model.dart';
import 'package:haha_decision_maker/Theme/colors.dart';
import 'package:haha_decision_maker/Utils/app_config.dart';

class ChoiceItemWidget extends StatelessWidget {
  final Choice item;
  final Animation animation;
  final VoidCallback onIconClicked;
  final Function(Choice) onItemClicked;

  const ChoiceItemWidget({
    @required this.item,
    @required this.animation,
    @required this.onIconClicked,
    @required this.onItemClicked,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ScaleTransition(
      scale: animation,
      child: Container(
        height: SizeConfig.safeBlockVertical * 8.1,
        margin: EdgeInsets.fromLTRB(
            SizeConfig.safeBlockHorizontal * 2,
            SizeConfig.safeBlockVertical * 2,
            SizeConfig.safeBlockHorizontal * 2,
            SizeConfig.safeBlockVertical * 0),
        child: Material(
          child: Ink(
            color: Color(0xffF3F3F3),
            child: InkWell(
              onTap: () {
                onItemClicked(item);
              },
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              padding: EdgeInsets.only(top: 7.5),
                              child: Text(
                                "Option Number ${item.choiceNum}",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.0,
                                  color: Color(0xff717171),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              padding: EdgeInsets.only(bottom: 7.5),
                              child: Text(
                                item.desc,
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 13.0,
                                  color: Color(0xff717171),
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.remove_circle,
                          color: Color(0xFF9C9C9C), size: 32),
                      onPressed: onIconClicked,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
