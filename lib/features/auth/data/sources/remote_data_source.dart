import 'package:ai_weather_app/features/auth/data/models/auth_user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class RemoteDataSource {
  Future<String> loginUseUser(UserModel user);
  Future<void> signUpUseUser(UserModel user);
  Future<void> resetUserPassword(UserModel user);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  RemoteDataSourceImpl(this._firebaseAuth, this._firestore);
  @override
  Future<String> loginUseUser(UserModel user) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );
    final idToken = await userCredential.user!.getIdToken();
    return idToken ?? '';
  }

  @override
  Future<void> signUpUseUser(UserModel user) async {
    UserCredential userCredential =
        await _firebaseAuth.createUserWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );
    await _firestore.collection('users').doc(userCredential.user!.uid).set(
      {
        'name': user.name,
        'email': user.email,
        'uid': userCredential.user!.uid,
      },
    );
  }

  @override
  Future<void> resetUserPassword(UserModel user) async {
    await _firebaseAuth.sendPasswordResetEmail(email: user.email);
  }
}
