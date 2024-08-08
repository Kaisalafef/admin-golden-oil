import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../textformfiled.dart';

class Add2 extends StatelessWidget {
  Add2({super.key});

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController namecalender = TextEditingController();
  TextEditingController typecalender = TextEditingController();
  TextEditingController typeCar = TextEditingController();
  TextEditingController image = TextEditingController();

  TextEditingController price = TextEditingController();
  CollectionReference Calender = FirebaseFirestore.instance.collection('Calander');

  addCalender() async {
    if (formState.currentState!.validate()) {
      try {

        // Add oil to Firestore
        DocumentReference respones = await Calender.add({
          "name calander": namecalender.text,
          "image": image.text,
          "type calander": typecalender.text,


          "price": price.text,
        });
      } catch (e) {
        print("Error $e");
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Add Calender",textAlign:TextAlign.center  ,
            style: TextStyle(color: Colors.amber),
          ),
        ),
        body:Form(
          key: formState,child:
        ListView(

          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 20)),

            textformfild(hinttext: "name calender", mycontroller: namecalender),
            Padding(padding: EdgeInsets.symmetric(vertical: 8)),
            textformfild(hinttext: "type calender", mycontroller: typecalender),
            Padding(padding: EdgeInsets.symmetric(vertical: 8)),
            textformfild(hinttext: "image", mycontroller: image),
            Padding(padding: EdgeInsets.symmetric(vertical: 8)),




            textformfild(hinttext: "price", mycontroller: price),
            Padding(padding: EdgeInsets.symmetric(vertical: 14)),


            ElevatedButton(
              onPressed: ()
    {
              addCalender();

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(' the add is completed '),
                  duration: Duration(seconds: 3),
                ),
              );},
              child: Container(height:20,width:50,child: Text("Add")),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                elevation: 10,
                shadowColor: Colors.amber,
              ),
            ),

          ],
        ),)

    );
  }
}
