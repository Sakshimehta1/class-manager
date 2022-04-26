import 'package:class_manager/auth_services.dart';
import 'package:class_manager/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class SignupTeacher extends StatefulWidget {
  const SignupTeacher({Key? key}) : super(key: key);

  @override
  State<SignupTeacher> createState() => _SignupTeacherState();
}

var isloading = false;

class _SignupTeacherState extends State<SignupTeacher> {
  var name;
  var email;
  var password;
  var UID;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var obscurePass = true;
  AuthService authService = AuthService();
  IconData icon_passwdeye = Icons.remove_red_eye;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   title: const Text("Add new Class"),
      //   automaticallyImplyLeading: true,
      // ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        height: context.percentHeight * 100,
        //   width: context.percentWidth*100,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              "REGISTER".text.xl2.bold.make(),
              // div(),
              const Image(
                  height: 300, image: AssetImage('assets/register.jpg')),
              form(),
              const SizedBox(height: 20),
              Button()
            ],
          ),
        ),
      ),
    );
  }

  Widget form() {
    return Form(
      key: _formkey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 0),
              child: TextFormField(
                // controller: cname,
                initialValue: "",

                onSaved: (String? value) {
                  name = value;
                },
                validator: (String? val) {
                  if (val.isEmptyOrNull) {
                    return "Field cannot be empty";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  // hintText: "Eg. CE52, CE61",
                  labelText: "Name",
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 7, bottom: 0),
              child: TextFormField(
                // controller: caddress,
                initialValue: "",
                onSaved: (String? value) {
                  email = value;
                },
                validator: (String? val) {
                  if (val.isEmptyOrNull) {
                    return "Field cannot be empty";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    labelText: "Email Id",
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(10)),
                    prefixIcon: const Icon(Icons.my_library_books)),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 7, bottom: 0),
              child: TextFormField(
                // controller: caddress,
                initialValue: "",
                onSaved: (String? value) {
                  password = value;
                },
                validator: (String? val) {
                  if (val.isEmptyOrNull) {
                    return "Field cannot be empty";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Password",
                    labelText: "Password",
                    suffixIcon: IconButton(
                      icon: Icon(icon_passwdeye),
                      onPressed: () {
                        toggle_pass();
                      },
                    ),
                    prefixIcon: const Icon(Icons.lock)),
                keyboardType: TextInputType.visiblePassword,
                obscureText: obscurePass,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void toggle_pass() {
    obscurePass = !obscurePass;
    icon_passwdeye = obscurePass ? Icons.visibility : Icons.visibility_off;
    setState(() {});
  }

  Widget Button() {
    return TextButton(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 80),
        child: isloading
            ? const SpinKitWave(
                color: Colors.white,
                size: 20,
              )
            : Text(
                "Register",
                style: GoogleFonts.varelaRound(),
              ).text.center.extraBold.white.uppercase.make(),
      ),
      style: TextButton.styleFrom(
        backgroundColor: Colors.teal,
        // shape:
        //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
      ),
      onPressed: () async {
        if (_formkey.currentState!.validate()) {
          _formkey.currentState!.save();
          isloading = true;
          setState(() {});
          UserCredential authresult = await _auth
              .createUserWithEmailAndPassword(email: email, password: password);
          // await authService.registerUser(email, password, context);
          // print("dddddddddddddddddddd" + _auth.currentUser!.uid);
          await addTeacher();
          // dynamic data = {
          //   "branch": branch,
          //   "subject": subject,
          //   "from": from,
          //   "to": to,
          //   // DateTime.now().microsecondsSinceEpoch
          // };
          // print(data);

          //

          // AuthService authService = AuthService();
          // await authService.addPatient(data);

          isloading = false;
          setState(() {});
          VxToast.show(context,
              msg: "Registered Successfully", bgColor: Colors.green);
          // Navigator.pop(context);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
        }
      },
    );
  }

  addTeacher() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    UID = _auth.currentUser?.uid;
    db.collection('teacherr').doc(UID).set({"name": name});
  }

  void registertoFirebase() async {
    var data = {
      "name": name,
      "email": email,
      "password": password,
    };
    var result = await authService.registerUser(email, password, context);
    if (result != null) {
      await addTeacher();
      VxToast.show(context, msg: "Saved data");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
    isloading = false;
    setState(() {});
  }
}

// var isloading = false;

Widget div() {
  return Divider(
    thickness: 2,
    color: Colors.teal[200],
  );
}
