import 'package:admingoldenoil/AddP.dart';
import 'package:admingoldenoil/RemoveP.dart';
import 'package:admingoldenoil/Textappbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    getData();
  }

  // Function to get data from the 'bookings' collection
  Future<void> getData() async {
    try {
      final querySnapshot = await db.collection('bookings').get();
      print('Data fetched: ${querySnapshot.docs}');
      setState(() {
        data = querySnapshot.docs;
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  List<QueryDocumentSnapshot> data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,
        centerTitle: true,
        title: const textappbar(),
        backgroundColor: Colors.white,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await getData();
        },
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 80, left: 50, bottom: 10),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AddP(),
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          elevation: 10,
                          shadowColor: Colors.orange,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Add Product",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      )
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(
                      top: 80, left: 30, right: 30, bottom: 10),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const RemoveP(),
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          elevation: 10,
                          shadowColor: Colors.black,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Remove Product",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const Text("Reselvation :"),
            SizedBox(
              height: 400, // Specify the height of the ListView
              child: Container(
                  height: 300,
                  child: FutureBuilder(
                      future: getData(),
                      builder: (context, child) {
                        return ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.all(3),
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.indigo.shade50,
                                borderRadius: BorderRadius.circular(30),
                                border:
                                    Border.all(color: Colors.black, width: 1.4),
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                      margin: EdgeInsets.all(0),
                                      padding: EdgeInsets.all(0),
                                      height: 70,
                                      width: 40,
                                      alignment: Alignment.center,
                                      child: data[index]['data'][0]['image'] !=
                                              null
                                          ? Image.asset(
                                              "images/${data[index]['data'][0]['image']}",
                                              fit: BoxFit.fill,
                                              height: 60,
                                              width: 40,
                                              alignment: Alignment.topCenter,
                                            )
                                          : Container())
                                  // or some other default widget),
                                  ,
                                  Container(
                                    child: Column(children: [
                                      Text(
                                        "  User ID :${data[index]['user_id']}",
                                        style: const TextStyle(fontSize: 11),
                                      ),
                                      Text("Time :${data[index]['time']}",
                                          style: const TextStyle(fontSize: 12)),
                                      Text("Date : ${data[index]['date']}",
                                          style: const TextStyle(fontSize: 12))
                                    ]),
                                  ),
                                  Container(
                                      margin: EdgeInsets.all(0),
                                      padding: EdgeInsets.all(0),
                                      child: IconButton(
                                        icon: Icon(Icons.remove,
                                            color: Colors.red),
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: ((context) =>
                                                  AlertDialog(
                                                    title: Text(
                                                        "Do you want remove this ?"),
                                                    actions: [
                                                      TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text("NO")),
                                                      TextButton(
                                                          onPressed: () async {
                                                            await FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    "bookings")
                                                                .doc(data[index]
                                                                    .id)
                                                                .delete();
                                                            //   Navigator.of(context).push(
                                                            //       MaterialPageRoute(builder: (context) => CartA()));
                                                            // },

                                                            await getData();

                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                const SnackBar(
                                                                  content: Text(' the remove is completed '),
                                                                  duration: Duration(seconds: 3),
                                                                ),
                                                              );
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text("Yes")),
                                                    ],
                                                  )));
                                        },
                                      ))
                                ],
                              ),
                            );
                          },
                        );
                      })),
            )
          ],
        ),
      ),
    );
  }
}
