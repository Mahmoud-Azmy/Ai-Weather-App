import 'package:ai_weather_app/core/errors/firebase_errors.dart';
import 'package:ai_weather_app/features/auth/domain/entities/user_entity.dart';
import 'package:ai_weather_app/features/auth/domain/repos/base_auth_user_repo.dart';
import 'package:ai_weather_app/features/auth/domain/usecases/login_user_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_use_case_test.mocks.dart';

@GenerateMocks([BaseAuthUserRepo])
void main() {
  late LoginUserUseCase loginUserUseCase;
  late MockBaseAuthUserRepo mockBaseAuthUserRepo;

  setUp(() {
    mockBaseAuthUserRepo = MockBaseAuthUserRepo();
    loginUserUseCase = LoginUserUseCase(mockBaseAuthUserRepo);
  });

  final testUser = UserEntity(
      email: 'test@example.com', password: 'password123', name: 'mahmoud');
  final testUserId = '12345';

  test(
    'should return user ID when login is successful',
    () async {
      when(
        mockBaseAuthUserRepo.loginUseUser(any),
      ).thenAnswer(
        (_) async => Right(testUserId),
      );
      final result = await loginUserUseCase(testUser);
      expect(
        result,
        Right(testUserId),
      );
      verify(
        mockBaseAuthUserRepo.loginUseUser(testUser),
      );
      verifyNoMoreInteractions(mockBaseAuthUserRepo);
    },
  );

  test('should return FirebaseFailure when login fails', () async {
    final failure = ServerFailure('Login failed');
    when(
      mockBaseAuthUserRepo.loginUseUser(any),
    ).thenAnswer(
      (_) async => Left(failure),
    );
    final result = await loginUserUseCase(testUser);
    expect(
      result,
      Left(failure),
    );
    verify(
      mockBaseAuthUserRepo.loginUseUser(testUser),
    );
    verifyNoMoreInteractions(mockBaseAuthUserRepo);
  });
}
