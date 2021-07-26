import 'package:flutter/material.dart';
import 'package:forms/AlreadyRegistered.dart';
import 'package:forms/FormFillup.dart';

class FirstPage extends StatelessWidget {
  static String tag = 'firstpage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.pink,Colors.purple])
          ),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Column(
                children: [
                  Text('Welcome',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                  Text('Registration Process',style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Please do fill the form with the Form Link Given below to participate in the Event',style:TextStyle(fontSize: 15,fontWeight: FontWeight.w500),textAlign: TextAlign.center),

                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height/3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('background2.png')
                        )
                    ),
                  ),

                  Column(
                    children: [
                      SizedBox(height:20),
                      SizedBox(
                        height: 40,
                        width: double.infinity,
                        child:RaisedButton(onPressed: (){
                          Navigator.of(context).pushNamed(Agreement.tag);
                        },
                          color: Colors.pinkAccent,
                          elevation: 10,
                          child: Text('Registration link',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color:Colors.purpleAccent,
                              ),
                              borderRadius: BorderRadius.circular(50)
                          ),
                        ),
                      ),
                    ],
                  )

                ],
              )
            ],
          )),

    );
  }
}
