import 'package:admingoldenoil/HomePage.dart';
import 'package:admingoldenoil/textformfiled.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formState = GlobalKey<FormState>();

    TextEditingController password = TextEditingController();

    return Scaffold(
      body: Stack(
        children: [
          Image.asset("images/44.jpg",fit: BoxFit.cover,height: 2000,)
,
          Column(
            children: [
              const SizedBox(height: 100,),
              Center(
                child: Container(width: 250,
                    alignment: Alignment.center,
                    child: textformfild(hinttext: "Password", mycontroller: password)),
              ),const SizedBox(height: 100,),
            ElevatedButton(onPressed: (){
              if(password.text=="golden"){
                Navigator.of(context).push(FadeRoute1(const HomePage()));
              }else{
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Wrong Password '),
                    duration: Duration(seconds: 3),
                  ),
                );
              }


            } ,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                elevation: 10,
                shadowColor: Colors.black,
              ), child: Container(height: 50,width: 150,alignment: Alignment.center,child: const Text("login",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),)
            ],
          )
        ],
      ),

    );
  }
}
class FadeRoute1 extends PageRouteBuilder {
  final Widget page;

  FadeRoute1(this.page)
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        FadeTransition(
          opacity: animation,
          child: page,
        ),
  );
}