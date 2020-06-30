import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';


class UsuarioAuth extends ChangeNotifier{
   String  id;
    String  nome;
    String  email;
    String  telefone;
   String  langitude;
   String  longitude ;
   String  photo;
   String  categoria;
   bool   paciente = false;
   bool doctor = false;
   bool senhavisible = true;
   TextEditingController  nascimento = new TextEditingController();

  AddName(String name){
      nome =  name;
      notifyListeners();
  }

  AddEmail(String email){
      email = email;
      notifyListeners();
  }
  AddPaciente(bool value){
      paciente = value;
      notifyListeners();
  }
  AddDoctor(bool value){
     doctor = value;
     notifyListeners();
   }
   AddSenhaVisible(bool value){
      senhavisible = value;
      notifyListeners();
   }

   AddNascimento(TextEditingController nascimento){

       this.nascimento = nascimento;
       notifyListeners();
   }

   LoadingNascimento(){
     this.nascimento = TextEditingController();
     notifyListeners();
   }




}