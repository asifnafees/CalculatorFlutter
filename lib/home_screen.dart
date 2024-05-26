import 'package:calculator/constants/buttons.dart';
import 'package:calculator/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput='';
  var result='';
  @override
  Widget build(BuildContext context) {
    void equalPress(){
      Parser p=Parser();
      Expression expression =p.parse(userInput);
      ContextModel contextModel =ContextModel();
      double eval=expression.evaluate(EvaluationType.REAL, contextModel);
      result=eval.toString();
    }
    return Scaffold( backgroundColor: Colors.white70,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10,top: 50,right: 10),
              child: Container( height: 100,width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                    border: Border.all(color: Colors.white,width: 3),

                ),
                child: Column( mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                  Text(userInput.toString(),style: InputStyle,),
                  SizedBox(height: 50,),
                  Text(result.toString(),style: InputStyle ,)
                ],),
              ),
            ),
          ),//input data
          Expanded(flex: 2,
            child: Container(
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Buttons(title:'AC', myOnTab: () {
                        setState(() {
                          userInput='';
                          result='';
                        });
                      },
                        mycolor: Colors.redAccent,
                      ),  Buttons(title:'DEL', myOnTab: () {
                        setState(() {
                          userInput=userInput.substring(0,userInput.length-1);
                        });
                      },
                        mycolor: Colors.redAccent,),
                    ],),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Buttons(title:'1', myOnTab: () {
                      setState(() {
                        userInput+='1';
                      });
                      },),Buttons(title:'2', myOnTab: () {
                        setState(() {
                          userInput+='2';
                        });
                      },),Buttons(title:'3', myOnTab: () {
                        setState(() {
                          userInput+='3';
                        });
                      },),Buttons(title:'+', myOnTab: () {
                        setState(() {
                          userInput+='+';
                        });
                      },mycolor: CupertinoColors.activeGreen,),
                    ],),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Buttons(title:'4', myOnTab: () {
                        setState(() {
                          userInput+='4';
                        });
                      },),Buttons(title:'5', myOnTab: () {
                        setState(() {
                          userInput+='5';
                        });
                      },),Buttons(title:'6', myOnTab: () {
                        setState(() {
                          userInput+='6';
                        });
                      },),Buttons(title:'-', myOnTab: () {
                        setState(() {
                          userInput+='-';
                        });
                      },mycolor: CupertinoColors.activeGreen,),
                    ],),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Buttons(title:'7', myOnTab: () {
                        setState(() {
                          userInput+='7';
                        });
                      },),Buttons(title:'8', myOnTab: () {
                        setState(() {
                          userInput+='8';
                        });
                      },),Buttons(title:'9', myOnTab: () {
                        setState(() {
                          userInput+='9';
                        });
                      },),Buttons(title:'*',myOnTab: () {
                        setState(() {
                          userInput+='*';
                        });
                      },mycolor: CupertinoColors.activeGreen,),
                    ],),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Buttons(title:'0', myOnTab: () {
                        setState(() {
                          userInput+='0';
                        });
                      },),Buttons(title:'.', myOnTab: () {
                        setState(() {
                          userInput+='.';
                        });
                      },),Buttons(title:'=', myOnTab: () {
                        setState(() {
                          equalPress();
                        });
                      },),Buttons(title:'/', myOnTab: () {
                        setState(() {
                          userInput+='/';
                        });
                      },mycolor: CupertinoColors.activeGreen,),
                    ],),
                ],
              ),
            ),
          )//all button
        ],),
      ),
    );
  }
}
