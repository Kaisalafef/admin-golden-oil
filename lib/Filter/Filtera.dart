import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Filtera extends StatefulWidget {
  const Filtera({super.key});

  @override
  State<Filtera> createState() => _OilState();
}

class _OilState extends State<Filtera> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final querySnapshot =
    await FirebaseFirestore.instance.collection('Filter').get();
    data.value = querySnapshot.docs;
  }
  final data = ValueNotifier<List<QueryDocumentSnapshot>>([]);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body:   ValueListenableBuilder(
        valueListenable: data,
        builder: (context, value, child) {
          return SizedBox(
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: value.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 10,
                crossAxisCount: 2,
                mainAxisExtent: 160,
              ),
              itemBuilder: (context, index) {
                return AnimationConfiguration.staggeredGrid(
                  position: index,
                  duration: Duration(milliseconds: 800),
                  columnCount: 2,
                  child: ScaleAnimation(
                      duration: Duration(milliseconds: 1200),
                      curve: Curves.fastLinearToSlowEaseIn,
                      child: FadeInAnimation(
                      child: InkWell(
                  onTap: () async {
                    showDialog(context: context, builder: ((context) => AlertDialog(
                      title: Text("Do you want remove this ?"),
                      actions: [
                        TextButton(onPressed: () {
                          Navigator.of(context).pop();
                        }, child: Text("NO")),

                        TextButton(onPressed: () async {

                          await FirebaseFirestore.instance
                              .collection("Filter")
                              .doc(value[index].id)
                              .delete();
                          //   Navigator.of(context).push(
                          //       MaterialPageRoute(builder: (context) => CartA()));
                          // },

                          await getData();
                          Navigator.of(context).pop();
                        }, child: Text("Yes")),

                      ],

                    )));}
,
                  child: Card(
                    surfaceTintColor: Colors.green,
                    shadowColor: Colors.green.shade900,
                    child: Container(
                      height: 300,
                      width: 200,
                      child: Column(
                        children: [
                          const Padding(padding: EdgeInsets.only(top: 5)),
                          Image.asset(
                            "images/${value[index]['image']}",
                            height: 100,
                            width: 160,
                            fit: BoxFit.scaleDown,
                          ),
                          Text('${value[index]['name filter']}',
                              style: const TextStyle(
                                  color:
                                  Colors.black,
                                  fontSize: 16)),
                          Text(
                            '${value[index]['type filter']}',
                            style: const TextStyle(
                                color: Colors.green, fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  ),
                ))));
              },
            ),
          );
        },
      ),

    );
  }
}
