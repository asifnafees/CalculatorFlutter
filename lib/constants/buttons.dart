import 'package:calculator/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final String title;
  final Color mycolor;
  final VoidCallback myOnTab;
  const Buttons({super.key,
    required this.title,this.mycolor=Colors.grey,
    required this.myOnTab
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: InkWell(
        onTap: myOnTab,
        child: Container(
          height: 60,width: 60,
          decoration: BoxDecoration(
            color: mycolor,
           borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: Colors.white,
              spreadRadius: 2,
              blurRadius: 2,
                offset: Offset(0, 10)
              ),
            ],
            border: Border.all(color: Colors.white70,
            width: 2
            )
          ),
          child: Center(child: Text(title,style: MYButtonStyle,)),
        ),
      ),
    );
  }
}
