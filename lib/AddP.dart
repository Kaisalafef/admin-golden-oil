import 'package:admingoldenoil/Oil/add.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Calender/add2.dart';
import 'Filter/add3.dart';

class AddP extends StatelessWidget {
  const AddP({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),
      body: ListView(
        children: [
          SizedBox(
            height: 80,
          ),
          Container(
              width: 300,
              height: 100,
              decoration: BoxDecoration(color: Colors.grey.shade50,
                  border: Border.all(color: Colors.red.shade900, width: 4),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(color: Colors.grey.shade300,
                        border:
                        Border.all(color: Colors.red.shade800, width: 3),
                        borderRadius: BorderRadius.circular(20)),
                    child: IconButton(
                      icon: Icon(
                        color: Colors.red.shade800,
                        Icons.water_drop,
                        size: 40,
                      ),
                      onPressed: () {

                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Add(),));

                      },
                    ),
                  ),
                  SizedBox(
                    width: 90,
                  ),
                  Text(
                    "Add Oil ",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              )),
          SizedBox(
            height: 80,
          ),
          Container(
              width: 300,
              height: 100,
              decoration: BoxDecoration(color: Colors.grey.shade50,
                  border: Border.all(color: Colors.amber.shade800, width: 4),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(color: Colors.grey.shade300,
                        border:
                            Border.all(color: Colors.amber.shade800, width: 3),
                        borderRadius: BorderRadius.circular(20)),
                    child: IconButton(
                      icon: Icon(
                        color: Colors.amber.shade800,
                        Icons.settings_input_component_sharp,
                        size: 40,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Add2(),));

                      },
                    ),
                  ),
                  SizedBox(
                    width: 90,
                  ),
                  Text(
                    "Add Calender ",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              )),
          SizedBox(
            height: 80,
          ),
          Container(
              width: 300,
              height: 100,
              decoration: BoxDecoration(color: Colors.grey.shade50,
                  border: Border.all(color: Colors.green.shade800, width: 4),
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(color: Colors.grey.shade300,
                        border:
                        Border.all(color: Colors.green.shade800, width: 3),
                        borderRadius: BorderRadius.circular(20)),
                    child: IconButton(
                      icon: Icon(
                        color: Colors.green.shade800,
                        Icons.settings_input_hdmi,
                        size: 40,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Add3(),));

                      },
                    ),
                  ),
                  SizedBox(
                    width: 90,
                  ),
                  Text(
                    "Add Filter ",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
