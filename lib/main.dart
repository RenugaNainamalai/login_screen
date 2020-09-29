import 'package:flutter/material.dart';
import 'package:login_screen/blocs/bloc.dart';
import 'package:login_screen/second_page.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
 
}
class HomePage extends StatelessWidget {
    final bloc = Bloc();

changedThePage(BuildContext context) {
  bloc.submit();
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondPage()));

}

@override 
Widget build (BuildContext context){

  return Scaffold(
    appBar: AppBar(
      title: Text("Bloc Pattern"),
    ),
    body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<String>(
              stream: bloc.email,
              builder: (context, snapshot) => 
            TextField(
              onChanged: bloc.emailChanged,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
               hintText: "Enter email",
              labelText: "Email",
              errorText: snapshot.error
              ),
            ),
            ),
            SizedBox(
              height: 20.0,
            ),
            StreamBuilder<String> (
              stream: bloc.password,
              builder: (context, snapshot) =>
            TextField(
              onChanged: bloc.passwordChanged,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
               hintText: "Enter Password",
              labelText: "Password",
              errorText: snapshot.error
              ),
            ),
            ),
            SizedBox(
              height: 20.0,
            ),
             StreamBuilder<String>(
              stream: bloc.email,
              builder: (context, snapshot) => 
            TextField(
              onChanged: bloc.emailChanged,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
               hintText: "Enter email",
              labelText: "Email",
              errorText: snapshot.error
              ),
            ),
            ),
            SizedBox(
              height: 20.0,
            ),
             StreamBuilder<String>(
              stream: bloc.name,
              builder: (context, snapshot) => 
            TextField(
              onChanged: bloc.emailChanged,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
               hintText: "Enter name",
              labelText: "Name",
              errorText: snapshot.error
              ),
            ),
            ),
            SizedBox(
              height: 20.0,
            ),
             StreamBuilder<String>(
              stream: bloc.phone,
              builder: (context, snapshot) => 
            TextField(
              onChanged: bloc.emailChanged,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
               hintText: "Enter phone",
              labelText: "Phone",
              errorText: snapshot.error
              ),
            ),
            ),
            SizedBox(
              height: 20.0,
            ),
            FlatButton(
           onPressed: () {
            DatePicker.showDatePicker(context,
          showTitleActions: true,
          minTime: DateTime(2000, 1, 1),
          maxTime: DateTime(2022, 12, 31),
          onChanged: (date) {print('change $date');},
          onConfirm: (date) {print('confirm $date');},
          currentTime: DateTime.now(), locale: LocaleType.en);},
          child: Text('Show DateTime Picker',)
          ),
            StreamBuilder<bool>(
              stream: bloc.submitCheck,
              builder: (context, snapshot) =>
            RaisedButton(
              color: Colors.blueAccent,
              onPressed: snapshot.hasData? () => changedThePage(context): null,
              child: Text("Submit"),
        ),   
        ),
          ],
        )
      ),
    )
  );
}
}



  

