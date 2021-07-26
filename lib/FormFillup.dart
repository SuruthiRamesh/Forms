import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'AlreadyRegistered.dart';

class Agreement extends StatelessWidget {
  static String tag = 'Agreement';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Instructions',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)),
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back),color: Colors.black),
      ),
      body: Stack(
        children:[
      Container(
      decoration: BoxDecoration(
      image: DecorationImage(
          image: AssetImage('background1.jpg'),
      fit: BoxFit.cover,
    ),
    ),
      ),
          Center(
          child: Padding(
            padding: EdgeInsets.all(50.0),
            child: Container(
              width: 700,
              height: 375,
              color: Colors.pinkAccent[100],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height:30),
                  Text('The Following are the Instructions for the form : - ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 20),),
                  SizedBox(height: 15),
                  Text('   * Be Careful While Filling up the form ',style:TextStyle(color:Colors.red[800],fontSize: 15)),
                  Text('   * Kindly load up with exact information',style: TextStyle(color: Colors.red[800],fontSize: 15),),
                  Text('   * Do not forget to fill all the fields in the form  ',style:TextStyle(color:Colors.red[800],fontSize: 15)),
                  SizedBox(height:85),
                  Center(child: Text('Acknowledgement',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20),)),
                  SizedBox(height: 30,),
                  Text(" I have perused the guidelines completely and I guarantee to fill just the exact informations about me with my consent",style: TextStyle(color:Colors.purple,fontWeight: FontWeight.w600),),
                  Text('We assure you that your information will not leaked or will be given to third parties',style: TextStyle(color:Colors.purple,fontWeight: FontWeight.w600)),

                  SizedBox(height: 20,),
                  Builder(
                      builder:(context)=>Center(
                        child: RaisedButton(
                          padding: EdgeInsets.all(8.0),
                          child: const Text('AGREE'),
                          onPressed: () {
                            Navigator.of(context).pushNamed(alreadyregistered.tag);
                          },
                        ),
                      )
                  ),
                ],
              ),
            ),
          ),
        ),
    ]
      ),
    );
  }
}


