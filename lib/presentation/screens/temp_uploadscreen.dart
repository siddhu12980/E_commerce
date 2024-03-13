import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_com/auth/auth_methods.dart';
import 'package:e_com/bloc/user_provider.dart';
import 'package:e_com/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({
    super.key,
  });

  @override
  State<UploadScreen> createState() => UploadScreenState();
}

class UploadScreenState extends State<UploadScreen> {
  User? _user;
  final AuthMethods _authMethods = AuthMethods();

  Future<void> refreshUser() async {
    User user = await _authMethods.getUserDetails();

    _user = user;
  }

  @override
  void initState() {
    // TODO: implement initState
    refreshUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(_user!.uid).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text("Full Name: ${data['username']} ${data['uid']}");
        }

        return const Text("loading");
      },
    );
  }
}
