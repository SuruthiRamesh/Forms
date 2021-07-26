import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/painting.dart';
import 'package:forms/FirstPage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;



class alreadyregistered extends StatefulWidget {
  static String tag = 'alreadyregistered';



  @override
  _alreadyregisteredState createState() => _alreadyregisteredState();
}

class _alreadyregisteredState extends State<alreadyregistered> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final professionController = TextEditingController();
  final dateController = TextEditingController();
  final citycontroller = TextEditingController();

  Future userRegistration() async{
    String name = nameController.text;
    String email = emailController.text;
    String number = numberController.text;
    String profession = professionController.text;
    String city = citycontroller.text;

    var url = 'https://cloudide.appson.in/workspace/vaishnavi/registration.php';
    var data = {'Fullname':name, 'Email_id':email, 'Phone_number':number,'Profession':profession,'City': city};
    var response = await http.post(url, body : json.encode(data));
    var message = jsonDecode(response.body);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(message),
          actions: <Widget>[
            FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  dialogshow(BuildContext context){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('Submit the Form'),
        content: Text('Are you sure,you want submit the form'),
        actions: [
          FlatButton(onPressed: ()=>[
            finaldialog(context)
          ], child: Text('Yes')),
          FlatButton(onPressed: (){Navigator.of(context).pop();}, child:Text('No') )
        ],
      );
    });
  }
  finaldialog(BuildContext context){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('Form Submitted Successfully!!!'),
        content: Text('You Form Has been submitted successfully'),
        actions: [
          FlatButton(onPressed: (){Navigator.of(context).pushNamed(FirstPage.tag);}, child: Text('Exit')),],
      );
    });
  }
  String _myactivity = '';
  String _myactivityresult = '';
  String profession_id='';
  List<String> profession = [
    "Student",
    "Working",
    "Business",
    "Unemployed",
    "Others"
  ];

  void initState(){
    super.initState();
    _myactivity = '';
    _myactivityresult = '';
  }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void validated(){
    if(formkey.currentState!.validate()){
      print('validated');
    }else{
      print('Not Validated');
    }
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent,
      leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back),color: Colors.black),
      ),
        body: Stack(
          children: [
            Container(
          decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('background4.jpg'),
            fit: BoxFit.cover,
          ),
          ),
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
    child: new Container(
    decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
          ),
          ),
          ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Center(
                child: Container(
                  width: 800,
                  height: 525,
                  color: Colors.pinkAccent[100],
                  child: ListView(
                    children: [
                      Center(child: Text('Registration Form',style:TextStyle(color:Colors.pink[900],fontWeight: FontWeight.bold,fontSize: 30))),
                      Form(
                      key: formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              height:20
                          ),
                          TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.purple,width: 10.0)
                              ),
                              icon: Icon(Icons.person,color: Colors.pink[800]),
                              hintText: 'Enter your Full Name',
                              labelText: 'Name',
                                hintStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.pink[600]),
                                labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.pink[600])
                            ),
                            validator: (value){
                              String patttern = r'(^[a-zA-Z ]*$)';
                              RegExp regExp = new RegExp(patttern);
                              if (value!.length == 0) {
                                return "Name is Required";
                              }else if (!regExp.hasMatch(value)) {
                                return "Name must be a-z and A-Z";
                              }
                              return null;
                              },
                          ),
                          SizedBox(height:20),
                          TextFormField(
                            controller: numberController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              icon: Icon(Icons.phone,color: Colors.pink[800]),
                              hintText: 'Enter Your Phone Number',
                              labelText: 'Phone Number',
                                hintStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.pink[600]),
                                labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.pink[600])
                            ),
                            validator: (value){
                              String patttern = r'(^[0-9]*$)';
                              RegExp regExp = new RegExp(patttern);
                              if (value?.length == 0) {
                                return "Mobile is Required";
                              } else if(value!.length != 10){
                                return "Mobile number must 10 digits";
                              }else if (!regExp.hasMatch(value)) {
                                return "Mobile Number must be digits";
                              }
                              return null;
                              },
                          ),
                          SizedBox(height:20),
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              icon: Icon(Icons.mail_outlined,color: Colors.pink[800]),
                              hintText: 'Enter your Email Address',
                                labelText: 'Email',
                              hintStyle: TextStyle(fontWeight: FontWeight.bold,color:Colors.pink[600]),
                              labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.pink[600])
                            ),
                            validator: (value){
                              String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                              RegExp regExp = new RegExp(pattern);
                              if (value!.length == 0) {
                                return "Email is Required";
                              } else if(!regExp.hasMatch(value)){
                                return "Invalid Email";
                              }else {
                                return null;
                              }
                              },
                          ),
                          SizedBox(height:20),
                          TextFormField(
                            controller:citycontroller,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.purple,width: 10.0)
                                ),
                                icon: Icon(Icons.map,color: Colors.pink[800]),
                                hintText: 'Enter your City Name',
                                labelText: 'City Name',
                                hintStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.pink[600]),
                                labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.pink[600])
                            ),
                            validator: (value){
                              String patttern = r'(^[a-zA-Z ]*$)';
                              RegExp regExp = new RegExp(patttern);
                              if (value!.length == 0) {
                                return "City is Required";
                              }else if (!regExp.hasMatch(value)) {
                                return "City must be a-z and A-Z";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height:20),
                          DropDownField(
                            controller: professionController,
                            icon: Icon(Icons.work,color: Colors.pink[800],),
                            value: profession_id,
                            required: true,
                            hintText: 'Choose Your Profession',
                            hintStyle: TextStyle(color: Colors.pink[600],fontWeight: FontWeight.bold),
                            labelText: 'Profession',
                            labelStyle: TextStyle(color: Colors.pink[600],fontWeight: FontWeight.bold,),
                            items: profession,
                            onValueChanged: (value){
                              profession_id = value;
                            },
                          ),
                        ],
                      ),
                    ),
                      SizedBox(height: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Builder(
                          builder:(context)=>Center(
                            child: RaisedButton(
                      padding: EdgeInsets.all(8.0),
                          child: const Text('Submit'),
                          onPressed: () =>[
                            userRegistration(),
                            if (formkey.currentState!.validate())
                            {
                              dialogshow(context)}]

                      ),
                          )
                        ),
                      ]
                    )
                    ]),
                ),
              ),
            )
          ]
        ),
    );
  }
}
