import 'package:flutter/material.dart';

final  TextEditingController _email = new TextEditingController();
final  TextEditingController _senha = new TextEditingController();
final  GlobalKey<FormState> _FormState = new GlobalKey<FormState>();

Widget BuildLogin(BuildContext context ){
     showModalBottomSheet(context: context, builder:(_)=> Container(
       padding: EdgeInsets.all(20),
         child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
                 Text("Login" ,style: TextStyle(
                     color: Colors.black,
                     fontWeight: FontWeight.bold,
                     fontSize: 23
                 ),) ,
                 Form(
                     key: _FormState,
                     child: Column(
                        children: [
                            TextFormField(
                               controller: _email,
                               decoration: InputDecoration(
                                   hintText: "Email"
                               ),
                            ),
                            SizedBox(height: 10,),
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Senha"
                              ),
                               obscureText: true,
                               controller: _senha,
                             ),
                            SizedBox(height: 10,),
                           Container(
                              child:ButtonTheme(
                                minWidth: 200,
                                height: 60,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)
                                ),
                                child: FlatButton(
                                  color: Color(0XFF4275f5),
                                  onPressed: (){},
                                  child: Text("Log in" , style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),),
                                ),
                              )
                           ),
                            SizedBox(height: 10,),
                           Center(
                             child: Text("OU"),
                           ) ,
                          SizedBox(height: 10,),
                          Container(
                              child:ButtonTheme(
                                minWidth: 200,
                                height: 60,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)
                                ),
                                child: FlatButton(
                                  color: Colors.red,
                                  onPressed: (){},
                                  child: Text("GOOGLE" , style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),),
                                ),
                              )
                          ),
                        ],
                     )
                 )

             ],
         ),
     ));
}