import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String username;
  final String uid;
  final String email;

  const User({required this.username, required this.email, required this.uid});

  Map<String, dynamic> tojson() => {
        'username': username,
        'uid': uid,
        'email': email,
      };

  static User fromsnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      username: snapshot['username'],
      uid: snapshot['uid'],
      email: snapshot['email'],
    );
  }
}
