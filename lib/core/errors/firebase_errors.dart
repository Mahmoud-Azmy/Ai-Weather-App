import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseFailure extends Equatable {
  final String errorMessage;

  const FirebaseFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class ServerFailure extends FirebaseFailure {
  const ServerFailure(super.errorMessage);

  /// Factory constructor to handle Firebase-specific exceptions.
  factory ServerFailure.fromFirebaseException(
      FirebaseAuthException firebaseException) {
    switch (firebaseException.code) {
      case 'email-already-in-use':
        return ServerFailure(
            'The email address is already in use by another account.');
      case 'invalid-email':
        return ServerFailure('The email address is invalid.');
      case 'operation-not-allowed':
        return ServerFailure('Email/password accounts are not enabled.');
      case 'weak-password':
        return ServerFailure('The password is too weak.');
      case 'user-disabled':
        return ServerFailure('This user account has been disabled.');
      case 'user-not-found':
        return ServerFailure('No user found with this email address.');
      case 'wrong-password':
        return ServerFailure('Incorrect password.');
      case 'invalid-credential':
        return ServerFailure(
            'Invalid credentials. Either the email is incorrect, the user does not exist, or the password is wrong.');
      case 'too-many-requests':
        return ServerFailure('Too many requests. Please try again later.');
      case 'network-request-failed':
        return ServerFailure(
            'A network error occurred. Please check your internet connection.');
      default:
        return ServerFailure(
            'An unexpected error occurred.====================== Please try again.');
    }
  }

  /// Factory constructor to handle generic Firebase errors.
  factory ServerFailure.fromGenericFirebaseError(dynamic error) {
    if (error is FirebaseAuthException) {
      return ServerFailure.fromFirebaseException(error);
    } else {
      return ServerFailure('An unexpected error occurred. Please try again.');
    }
  }
}
