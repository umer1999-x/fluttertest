import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String? name, email;
  DatabaseReference? ref;
  DatabaseEvent? event;
  Future? getDataInstance;
  @override
  void initState() {
    getDataInstance = getData();
    //FirebaseDatabase.instance.ref().child('users').equalTo('uid',FirebaseAuth.instance.currentUser!.uid).
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getDataInstance,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(title: const Text('HomePage')),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welecome ${snapshot.data['name']}',
                    ),
                    Text(
                      '${snapshot.data['email']}',
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Scaffold(
              body: Center(
                  child: CircularProgressIndicator(
                color: Colors.purple,
              )),
            );
          }
        });
  }

  Future getData() async {
    ref = FirebaseDatabase.instance
        .ref('users/${FirebaseAuth.instance.currentUser!.uid}');
    event = await ref!.once();
    final doc = event!.snapshot.value;
    return doc;
  }
}
