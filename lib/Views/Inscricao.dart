import 'dart:io';
import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:hospital/Model/UsuarioAuth.dart';
import 'package:hospital/Screens/HomeLogin.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';

class InscricaoUser extends StatefulWidget{
    @override
  State<StatefulWidget> createState() {
      return Inscricao();
  }
}

class Inscricao extends State<InscricaoUser>{
  // campos do usuario;
  TextEditingController  _nome = new TextEditingController();
  TextEditingController  _email = new TextEditingController();
  TextEditingController  _senha = new TextEditingController();
  TextEditingController  _telefone = new TextEditingController();

  bool   doctor  = false;
  bool  paciente = false;
  File _image;
  GlobalKey<FormState> _FormState =  new GlobalKey<FormState>();
  // fim do campos do usuario;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  void dispose(){
      _nome.dispose();
      _email.dispose();
      _telefone.dispose();
      _senha.dispose();
      super.dispose();
  }
  Widget build(BuildContext context) {
    final UsuarioInscricao =Provider.of<UsuarioAuth>(context);

      return Scaffold(
        appBar: new  AppBar(
            elevation: 0,
            backgroundColor:Color(0xFF223fcf),
        ),
        backgroundColor: Color(0xFF223fcf),
        body: Center(
           child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width-20,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                margin: EdgeInsets.only(
                  bottom: 10,
                ),
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 5,
                  bottom: 30
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Registra-se",style: TextStyle(
                        color: Colors.black ,
                        fontSize:22 ,
                        fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height:10,),
                    Center(
                        child: InkWell(
                          onTap: (){},
                          child: ClipOval(
                            child:Container(
                              height:60,
                              color: Color(0XFF4275f5),
                              width:60,
                              child:IconButton(icon: Icon(Icons.add ,color: Colors.white,), onPressed:(){}),
                            ),
                          ),
                        )
                    ) ,
                    SizedBox(height:15,),
                    Form(
                         key: _FormState,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "Nome Completo",
                              ),
                              validator: (nome){
                                  if(nome.isEmpty){
                                      return "O campo nome esta vázio";
                                  }else{
                                     return null;
                                  }
                              },
                              controller: _nome,
                            ) ,
                            SizedBox(height:5,) ,
                            TextFormField(
                              validator: (email){
                                if(email.isEmpty){
                                  return "O campo nome esta vázio";
                                }else{
                                   if(!EmailValidator.validate(email)){
                                      return "Insira um email";
                                   }else{
                                      return null;
                                   }
                                }
                              },
                              decoration: InputDecoration(
                                hintText: "Email",
                              ),
                              controller: _email,
                            ) ,
                            SizedBox(height:5,),
                            TextFormField(
                               obscureText: UsuarioInscricao.senhavisible,
                              decoration: InputDecoration(
                                hintText: "Senha",
                                suffixIcon: IconButton(icon:Icon(Icons.remove_red_eye), onPressed:(){
                                    UsuarioInscricao.AddSenhaVisible(!UsuarioInscricao.senhavisible);
                                })
                              ),
                              controller: _senha,
                            ) ,
                            SizedBox(height:5,),
                            TextFormField(
                              keyboardType: TextInputType.numberWithOptions(),
                              decoration: InputDecoration(
                                hintText: "Telefone",
                              ),
                              controller: _telefone,

                            ) ,
                            SizedBox(height:5,),
                            TextFormField(
                              controller: UsuarioInscricao.nascimento,
                              decoration: InputDecoration(
                                hintText: "Data de Nascimento",
                              ),
                              onTap:(){
                                UsuarioInscricao.LoadingNascimento();
                                DatePicker.showDatePicker(context,
                                    showTitleActions: true,
                                    minTime: DateTime(2018, 3, 5),
                                    maxTime: DateTime(2019, 6, 7),
                                    theme: DatePickerTheme(
                                        headerColor: Colors.white,
                                        backgroundColor:Color(0XFF4275f5),
                                        itemStyle: TextStyle(
                                            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                                        doneStyle: TextStyle(color: Colors.blue, fontSize: 16)
                                    ),
                                    onChanged: (date) {
                                      UsuarioInscricao.AddNascimento(new TextEditingController(text: date.day.toString()+"/"+date.month.toString()+"/"+date.year.toString()));
                                    },
                                    onConfirm: (date) {
                                      print('confirm $date');
                                    }, currentTime: DateTime.now(), locale: LocaleType.en
                                );
                              },
                            ) ,
                            SizedBox(height:10,),
                            Text("assinar como: " ,style: TextStyle(
                              color: Colors.black ,
                              fontWeight: FontWeight.bold ,
                            ),) ,
                            CheckboxListTile(
                                title: Text("Paciente"),
                                value: UsuarioInscricao.paciente, onChanged:(value){
                                   UsuarioInscricao.AddPaciente(value);
                                   UsuarioInscricao.AddDoctor(!value);
                            }) ,
                            CheckboxListTile(
                                title: Text("Doctor"),
                                value: UsuarioInscricao.doctor, onChanged:(value){
                                  UsuarioInscricao.AddDoctor(value);
                                  UsuarioInscricao.AddPaciente(!value);
                            }),
                            SizedBox(height:05,),
                            Center(
                              child: ButtonTheme(
                                minWidth:160,
                                height: 40,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)
                                ),
                                child: FlatButton(
                                  color: Color(0XFF4275f5),
                                  onPressed: (){
                                    if(!_FormState.currentState.validate()) return ;

                                  },
                                  child: Text("Cadastrar" , style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),),
                                ),
                              ),
                            ),
                            Center(
                              child: ButtonTheme(
                                minWidth:160,
                                height: 40,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    side: BorderSide(
                                      color:Color(0XFF4275f5),
                                    )
                                ),
                                child: FlatButton(
                                  onPressed: (){
                                     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>HomeMain()), (route) => false);
                                  },
                                  child: Text("Cancelar" , style: TextStyle(
                                    color:Color(0XFF4275f5),
                                    fontSize: 15,
                                  ),),
                                ),
                              ),
                            )

                          ],
                        )),


                  ],
                ),
              ),
           ),
        ),
      );
  }
}