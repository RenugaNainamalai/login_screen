import 'dart:async';

mixin Validators{

  var emailValidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (email,sink){
   if(email.contains("@gmail.com")){
      sink.add(email);
    } else {
      sink.addError("Email is not valid");
     }
    }
  );
var passwordValidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (password,sink){
   if(password.length >= 5){
      sink.add(password);
    } else {
      sink.addError("Password is not valid");
     }
    }
  );
var nameValidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (name,sink){
   if(name.length != 0){
      sink.add(name);
    } else {
      sink.addError("Please enter your name");
     }
    }
  );
  var phoneValidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (ph,sink){
   if(ph.length >= 10){
      sink.add(ph);
    } else {
      sink.addError("phone number is not valid");
     }
    }
  );
}