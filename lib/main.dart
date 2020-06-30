import 'package:flutter/material.dart';
import 'package:hospital/Model/UsuarioAuth.dart';
import 'package:provider/provider.dart';

import 'Screens/HomeLogin.dart';

void main()=>runApp(
   MultiProvider(
      providers:[
         ChangeNotifierProvider(
             create: (_)=> new UsuarioAuth(),
         ) ,

      ] ,
      child: MaterialApp(
        home: HomeMain(),
        theme: ThemeData(
            primaryColor: Color(0XFF4275f5)
        ),
        debugShowCheckedModeBanner: false,
      ),
   )

);