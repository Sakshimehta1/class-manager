// import 'package:class_manager/addClass.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // var UID=FirebaseAuth.instance.currentUser?.uid;
  var name = "";
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('teacherr');
  // @override
  //  initState() {
  //   // TODO: implement initState
  //   getName();
  //   print("nnnnnnggggggggggggggggggnnnnnnnnnnn" + name);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Class Manager"),
      ),
      // body: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      //   child: Column(
      //     children: [
      //       "Select Class".text.xl2.semiBold.make(),
      //       const SizedBox(
      //         height: 20,
      //       ),
      //       // TextButton(onPressed: fetchList, child: "Press".text.make()),
      //       Expanded(
      //         child: RefreshIndicator(
      //           onRefresh: () async {
      //             setState(() {});
      //           },
      //           child: FutureBuilder<DocumentSnapshot>(
      //             future: collectionReference
      //                 .doc(FirebaseAuth.instance.currentUser?.uid)
      //                 .get(),
      //             builder: (BuildContext context,
      //                 AsyncSnapshot<DocumentSnapshot> snapshot) {
      //               if (snapshot.hasError) {
      //                 return const Text("Something went wrong");
      //               }

      //               if (snapshot.hasData && !snapshot.data!.exists) {
      //                 return const Text("Document does not exist");
      //               }

      //               if (snapshot.connectionState == ConnectionState.done) {
      //                 Map<String, dynamic> data =
      //                     snapshot.data!.data() as Map<String, dynamic>;
      //                 print(data);
      //                 if (data["classes"] == null) return NoClass();
      //                 // return Text("Full Name: ${data['full_name']} ${data['last_name']}");
      //                 return ListView.builder(
      //                     scrollDirection: Axis.vertical,
      //                     itemBuilder: (BuildContext context, index) {
      //                       String branch = data["classes"][index];
      //                       String subject = data[branch];
      //                       return Card(
      //                         elevation: 2,
      //                         color: Colors.primaries[
      //                                 Random().nextInt(Colors.primaries.length)]
      //                             .withOpacity(0.608),
      //                         child: InkWell(
      //                           onTap: () {
      //                             Navigator.of(context).push(MaterialPageRoute(
      //                                 builder: (context) => Options(
      //                                       branch: branch,
      //                                       subject: subject,
      //                                     )));
      //                           },
      //                           child: ListTile(
      //                             title: Text(
      //                               branch,
      //                               style: const TextStyle(
      //                                   color: Colors.white,
      //                                   fontWeight: FontWeight.bold),
      //                             ),
      //                             subtitle: Text(
      //                               subject,
      //                               style: const TextStyle(
      //                                 color: Colors.white,
      //                               ),
      //                             ),
      //                             trailing: const SizedBox(
      //                               width: 40,
      //                               child: FaIcon(
      //                                 FontAwesomeIcons.usersRectangle,
      //                                 color: Colors.white,
      //                               ),
      //                             ),
      //                           ),
      //                         ),
      //                       );
      //                     },
      //                     itemCount: data["classes"]?.length);
      //               }

      //               return const Center(
      //                 child: CircularProgressIndicator(
      //                   color: Colors.teal,
      //                 ),
      //               );
      //             },
      //           ),
      //         ),
      //       ),
      //       Button()
      //       // child: Expanded(
      //       //   child:
      //       //   ListView.builder(
      //       //       scrollDirection: Axis.vertical,
      //       //       itemBuilder: (BuildContext context, index) {
      //       //         return Card(
      //       //           elevation: 2,
      //       //           color: Colors
      //       //               .primaries[Random().nextInt(Colors.primaries.length)]
      //       //               .withOpacity(0.608),
      //       //           child: InkWell(
      //       //             onTap: () {
      //       //               Navigator.of(context).push(MaterialPageRoute(
      //       //                   builder: (context) => const Attendance()));
      //       //             },
      //       //             child: ListTile(
      //       //               title: "CE62".text.white.bold.make(),
      //       //               subtitle: "Soft Computing".text.white.make(),
      //       //               trailing: const SizedBox(
      //       //                 width: 40,
      //       //                 child: FaIcon(
      //       //                   FontAwesomeIcons.usersRectangle,
      //       //                   color: Colors.white,
      //       //                 ),
      //       //               ),
      //       //             ),
      //       //           ),
      //       //         );
      //       //       },
      //       //       itemCount: 10),
      //       // ),
      //       // ),
      //     ],
      //   ),
      // ),
      // drawer: NavDrawer(name),
    );
  }

  Widget NoClass() {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const Icon(
            Icons.no_accounts,
            size: 200,
            color: Colors.teal,
          ),
          const SizedBox(
            height: 30,
          ),
          "OOPS! No Classes Added".text.teal700.bold.xl2.make(),
          const SizedBox(
            height: 10,
          ),
          "Please Add Class and Refresh".text.black.xl.make(),
          const SizedBox(
            height: 10,
          ),
          Refresh()
        ],
      ),
    );
  }

  Widget Button() {
    return TextButton(
      child: SizedBox(
        width: context.percentWidth * 100,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 50),
          child: Text(
            "ADD NEW CLASS",
            style: GoogleFonts.varelaRound(),
          ).text.center.extraBold.white.uppercase.make(),
        ),
      ),
      style: TextButton.styleFrom(
        backgroundColor: Colors.teal,
        // shape:
        //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
      ),
      onPressed: () async {
        // setState(() {
        //   Navigator.of(context)
        //       .push(MaterialPageRoute(builder: (context) => const AddClass()));
        // });
      },
    );
  }

  Widget Refresh() {
    return TextButton(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 50),
        child: Text(
          "Refresh",
          style: GoogleFonts.varelaRound(),
        ).text.center.extraBold.white.uppercase.make(),
      ),
      style: TextButton.styleFrom(
        backgroundColor: Colors.teal,
        // shape:
        //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
      ),
      onPressed: () async {
        setState(() {});
      },
    );
  }

  getName() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    var UID = _auth.currentUser?.uid;
    FirebaseFirestore db = FirebaseFirestore.instance;
    // DocumentReference documentReference =
    await db
        .collection("teacherr")
        .doc(UID)
        .get()
        .then(((DocumentSnapshot<dynamic> documentSnapshot) {
      name = documentSnapshot.data()["name"];
    }));
    setState(() {});
    print("nnnnnnnnnnnnnnnnn" + name);
    // return "";
  }
  // Set data;
  // Map<String, dynamic>? map;
  // List classes;
  // db
  //     .collection('teacherr')
  //     .doc(UID)
  //     .get()
  //     .then((DocumentSnapshot<dynamic> documentSnapshot) {
  //   if (documentSnapshot.exists) {
  //     print('Document data: ${documentSnapshot.data()!['classes']}');
  //     if (documentSnapshot.data() != null) {
  //       List<String> classes = [];
  //       for (var i = 0; i < documentSnapshot.data()['classes']!.length; i++) {
  //         print(documentSnapshot.data()['classes'][i]);
  //       }
  //       //print(classes);
  //     }
  //     // classes=documentSnapshot.data()["classes"];
  //     // try {
  //     //   dynamic nested =
  //     //       documentSnapshot.get(FieldPath(const ['classes', 'name']));
  //     // } on StateError {
  //     //   print('No nested field exists!');
  //     // }
  //     // documentSnapshot.data()["classes"][""];
  //     // map = documentSnapshot.data() as Map<String, dynamic>?;
  //     // classes=classes["classes"];
  //   } else {
  //     print('Document does not exist on the database');
  //   }
  // });
  // List contactList = [];
  // DocumentSnapshot documentSnapshot =
  //     await firestore.collection('my_contact').doc('details').get();
  // classes = docum.data()['contacts'];
  // return contactList;

}
