import 'dart:async';
import 'validator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Bloc extends Object with Validators implements BaseBloc {

final _emailController = BehaviorSubject<String>();
final _passwordController = BehaviorSubject<String>();
final _nameController = BehaviorSubject<String>();
final _phoneController = BehaviorSubject<String>();

//StreamSink<String> get emailChanged => _emailController.sink;
//StreamSink<String> get passwordChanged => _emailController.sink;
Function(String) get emailChanged    => _emailController.sink.add;
Function(String) get passwordChanged => _passwordController.sink.add;
Function(String) get nameChanged => _nameController.sink.add;
Function(String) get phoneChanged => _phoneController.sink.add;

Stream<String> get email => _emailController.stream.transform(emailValidator);
Stream<String> get password => _passwordController.stream.transform(passwordValidator);
Stream<String> get name => _nameController.stream.transform(nameValidator);
Stream<String> get phone => _phoneController.stream.transform(phoneValidator);

Stream<bool> get submitCheck => Rx.combineLatest2(email, password, (e, p) => true);
Stream<bool> get submitCheck1 => Rx.combineLatest2(name,phone, ( n, ph) => true);

submit(){
  print("object");
   final validEmail    = _emailController.value;
   final validPassword = _passwordController.value;
   final validName = _nameController.value;
   final validPh = _phoneController.value;
 Firestore.instance.collection("path").add({
     "email":validEmail,
     "password":validPassword,
     "name":validName,
     "ph":validPh,
   }).then((value) => null);
    print('$validEmail and $validPassword and $validName and $validPh ');
}
  @override
  void dispose() {
    _emailController?.close();
    _passwordController?.close();
    _nameController?.close();
    _passwordController?.close();


  }


}
abstract class BaseBloc {
  void dispose();
}