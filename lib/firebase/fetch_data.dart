import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FetchData extends StatefulWidget {
  const FetchData({Key? key}) : super(key: key);

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  Query dbRef = FirebaseDatabase.instance.ref().child('Services');
  DatabaseReference reference =
      FirebaseDatabase.instance.ref().child('Services');

  Widget listItem({required Map service}) {
    return InkWell(
      onTap: () =>
          Navigator.pushReplacementNamed(context, '/service_des_screen'),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        margin:
            EdgeInsetsDirectional.only(top: 30, start: 30, end: 30, bottom: 30),
        color: Colors.grey[300],
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Image.asset("images/Component 9 – 1.png"),
                      Expanded(
                        child: Text(
                          service['name'],
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    service['description'],
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              // Text(
              //   service['id'],
              //   style: GoogleFonts.poppins(fontSize: 20),
              // ),
              // Text(
              //   service['Description'],
              //   style: GoogleFonts.poppins(
              //       fontSize: 20, decoration: TextDecoration.underline),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetching data'),
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: dbRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map service = snapshot.value as Map;
            service['key'] = snapshot.key;

            return listItem(service: service);
          },
        ),
      ),
    );
  }
}
