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
      child: InkWell(
        onTap: () {
          onItemClicked(item);
        },
        child: Container(
          height: SizeConfig.safeBlockVertical * 8.1,
          padding: EdgeInsets.only( left: 8),
          margin: EdgeInsets.fromLTRB(
              SizeConfig.safeBlockHorizontal * 2,
              SizeConfig.safeBlockVertical * 2,
              SizeConfig.safeBlockHorizontal * 2,
              SizeConfig.safeBlockVertical * 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Color(0xffF3F3F3),
          ),
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
                icon: Icon(Icons.remove_circle, color: Color(0xffDDDDDD), size: 32),
                onPressed: onIconClicked,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
