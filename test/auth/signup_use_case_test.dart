import 'package:ai_weather_app/core/errors/firebase_errors.dart';
import 'package:ai_weather_app/features/auth/domain/entities/user_entity.dart';
import 'package:ai_weather_app/features/auth/domain/repos/base_auth_user_repo.dart';
import 'package:ai_weather_app/features/auth/domain/usecases/sign_up_user_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_use_case_test.mocks.dart';


@GenerateMocks([BaseAuthUserRepo])
void main() {
  late SignUpUserUseCase signUpUserUseCase;
  late MockBaseAuthUserRepo mockBaseAuthUserRepo;

  setUp(() {
    mockBaseAuthUserRepo = MockBaseAuthUserRepo();
    signUpUserUseCase = SignUpUserUseCase(mockBaseAuthUserRepo);
  });

  final testUser = UserEntity(
      email: 'test@example.com', password: 'password123', name: 'MahmoudAzmy');
  const testUid = '12345';

  test(
    'should return user ID when sign-up is successful',
    () async {
      when(
        mockBaseAuthUserRepo.signUpUseUser(any),
      ).thenAnswer(
        (_) async => const Right(testUid),
      );
      final result = await signUpUserUseCase(testUser);
      expect(
        result,
        const Right(testUid),
      );
      verify(
        mockBaseAuthUserRepo.signUpUseUser(testUser),
      );
      verifyNoMoreInteractions(mockBaseAuthUserRepo);
    },
  );

  test(
    'should return FirebaseFailure when sign-up fails',
    () async {
      // Arrange
      final failure = ServerFailure('Sign-up failed');
      when(
        mockBaseAuthUserRepo.signUpUseUser(any),
      ).thenAnswer(
        (_) async => Left(failure),
      );
      final result = await signUpUserUseCase(testUser);
      expect(result, Left(failure));
      verify(
        mockBaseAuthUserRepo.signUpUseUser(testUser),
      );
      verifyNoMoreInteractions(mockBaseAuthUserRepo);
    },
  );
}
