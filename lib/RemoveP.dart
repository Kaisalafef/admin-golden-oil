import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Calender/Calender.dart';
import 'Filter/Filtera.dart';
import 'Oil/Oil.dart';

class RemoveP extends StatelessWidget {
  const RemoveP({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),
      body: ListView(
        children: [
          const SizedBox(
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
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
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

                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Oil(),));

                      },
                    ),
                  ),
                  const SizedBox(
                    width: 90,
                  ),
                  const Text(
                    "delete Oil ",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              )),
          const SizedBox(
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
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
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
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Calender(),));

                      },
                    ),
                  ),
                  const SizedBox(
                    width: 90,
                  ),
                  const Text(
                    "delete Calender ",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              )),
          const SizedBox(
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
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
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
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Filtera(),));

                      },
                    ),
                  ),
                  const SizedBox(
                    width: 90,
                  ),
                  const Text(
                    "delete Filter ",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
