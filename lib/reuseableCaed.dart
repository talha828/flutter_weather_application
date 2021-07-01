import 'package:flutter/material.dart';
import 'constant.dart';

class ReuseableCard extends StatelessWidget {
  ReuseableCard({this.icon,this.text,this.color});
  final text;
  final icon;
  final color;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
        children: [
          Icon(icon,size: 60,color: color,),
          SizedBox(height: 10,),
          Text(text,style:KtextStyle),
        ],
      ),
    );
  }
}
