// Mocks generated by Mockito 5.4.5 from annotations
// in ai_weather_app/test/auth/login_use_case_test/login_use_case_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:ai_weather_app/core/errors/firebase_errors.dart' as _i5;
import 'package:ai_weather_app/features/auth/domain/entities/user_entity.dart'
    as _i6;
import 'package:ai_weather_app/features/auth/domain/repos/base_auth_user_repo.dart'
    as _i3;
import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [BaseAuthUserRepo].
///
/// See the documentation for Mockito's code generation for more information.
class MockBaseAuthUserRepo extends _i1.Mock implements _i3.BaseAuthUserRepo {
  MockBaseAuthUserRepo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.FirebaseFailure, String>> signUpUseUser(
    _i6.UserEntity? user,
  ) =>
      (super.noSuchMethod(
            Invocation.method(#signUpUseUser, [user]),
            returnValue:
                _i4.Future<_i2.Either<_i5.FirebaseFailure, String>>.value(
                  _FakeEither_0<_i5.FirebaseFailure, String>(
                    this,
                    Invocation.method(#signUpUseUser, [user]),
                  ),
                ),
          )
          as _i4.Future<_i2.Either<_i5.FirebaseFailure, String>>);

  @override
  _i4.Future<_i2.Either<_i5.FirebaseFailure, String>> loginUseUser(
    _i6.UserEntity? user,
  ) =>
      (super.noSuchMethod(
            Invocation.method(#loginUseUser, [user]),
            returnValue:
                _i4.Future<_i2.Either<_i5.FirebaseFailure, String>>.value(
                  _FakeEither_0<_i5.FirebaseFailure, String>(
                    this,
                    Invocation.method(#loginUseUser, [user]),
                  ),
                ),
          )
          as _i4.Future<_i2.Either<_i5.FirebaseFailure, String>>);

  @override
  _i4.Future<_i2.Either<_i5.FirebaseFailure, String>> resetUserPassword(
    _i6.UserEntity? user,
  ) =>
      (super.noSuchMethod(
            Invocation.method(#resetUserPassword, [user]),
            returnValue:
                _i4.Future<_i2.Either<_i5.FirebaseFailure, String>>.value(
                  _FakeEither_0<_i5.FirebaseFailure, String>(
                    this,
                    Invocation.method(#resetUserPassword, [user]),
                  ),
                ),
          )
          as _i4.Future<_i2.Either<_i5.FirebaseFailure, String>>);
}
