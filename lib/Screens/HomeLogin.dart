import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hospital/Views/Inscricao.dart';
import 'package:hospital/Widgets/LoginBuild.dart';

class HomeMain extends StatefulWidget{
   @override
  State<StatefulWidget> createState() {
     return HomeMainUser();
  }
}

class HomeMainUser extends State<HomeMain> with TickerProviderStateMixin{

  AnimationController _animationController ;
  Animation _animation;

  @override
  void initState() {
    _animationController  = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween(begin: -1.0, end:0.0).animate(CurvedAnimation(
        parent: _animationController,
        curve: Curves.bounceOut
    ));
    _animationController.forward();
     super.initState();
  }
     @override
  Widget build(BuildContext context) {
    final width =  MediaQuery.of(context).size.width;
      return Scaffold(
        backgroundColor: Color(0xFF223fcf),
        //0XFF4275f5
        body: SingleChildScrollView(
           child:Container(
               child: Center(
                   child:AnimatedBuilder(
                     animation:_animationController,
                     builder:(BuildContext context , Widget child){
                          return Transform(
                             transform: Matrix4.translationValues(_animation.value*width, 0.0, 0.0) ,
                             child: Center(
                                child:Container(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height/3.5
                                  ),
                                    child:  Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset("assets/logo.png", width: 160,height: 160,) ,
                                        SizedBox(height:15,),
                                        Text("Doctor Online" , style: TextStyle(
                                          color: Colors.white ,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                        ),) ,
                                        SizedBox(height:60,),
                                        Container(
                                            child:ButtonTheme(
                                                 minWidth: 200,
                                                 height: 60,
                                                 shape: RoundedRectangleBorder(
                                                   borderRadius: BorderRadius.circular(50)
                                                 ),
                                                child: FlatButton(
                                                color: Color(0XFF4275f5),
                                                onPressed: ()=>BuildLogin(context),
                                                child: Text("Log in" , style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                ),),
                                              ),
                                            )
                                        ),
                                        SizedBox(height:10,),
                                        Container(
                                            child:ButtonTheme(
                                              minWidth: 200,
                                              height: 60,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50) ,
                                                  side: BorderSide(
                                                      color: Colors.white
                                                  )
                                              ),
                                              child: FlatButton(
                                                onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (_)=> new InscricaoUser())),
                                                child: Text("Registra-se" , style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                ),),
                                              ),
                                            )
                                        ),
                                      ],
                                    ),
                                )
                             ),
                           );

                     },
                   ),
               ),
           ),
        ),
      );
  }
}