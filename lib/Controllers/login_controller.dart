import 'package:get/get.dart';

class LoginController extends GetxController{
   String? userName, password;
   int Flag = 0;

   RxString aUserName = ''.obs;

   void checkUserName(String text){

      if(text.isAlphabetOnly){

         userName = text;
         aUserName.value = text;

         print("${text} is a username");
      }
   }
   void checkPassword(String text){

      password = text;

      if(text.isNum){
         print("${text} is a number");

      }
      else if(text.isAlphabetOnly){

         userName = text;
         print("${text} is a username");

      }
      else if(text.isEmail){
         print("${text} is email");

      }

   }
   int login(){
      Flag = 0;
      if(userName!= null && password!= null){
         if(userName == "binary" && password == "123"){
            Flag = 1;
         }
         else{
            Flag = 2;
         }
      }
      return Flag;

   }

}