// What does the class depend on
// Answer -- AuthenticationReository
// How can we create a fake version of the dependency
// Answer -- user Mocktail
// How do we control what our dependencies do
// Answer -- Using the Mocktail's APIs
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:project/src/authentication/domain/entities/user.dart';
import 'package:project/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:project/src/authentication/domain/usecases/get_users.dart';

class MockAuthRepo extends Mock implements AuthenticationRepository {}

void main() {
  late GetUsers usecase;
  late AuthenticationRepository repository;

  setUp(() {
    repository = MockAuthRepo();
    usecase = GetUsers(repository);
  });

  const tResponse = [User.empty()];

  test(
    'should call the [AuthRepo.getusers] and return [List<User>]',
    () async {
      //Arrange
      //STUB
      when(() => repository.getUsers()).thenAnswer(
        (_) async => const Right(tResponse),
      );
      //Act
      final result = await usecase();
      //Assert
      expect(result, equals(const Right<dynamic, List<User>>(tResponse)));
      verify(() => repository.getUsers()).called(1);
      verifyNoMoreInteractions(repository);
    },
  );
}
