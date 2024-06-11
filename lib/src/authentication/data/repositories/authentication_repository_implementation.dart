import 'package:dartz/dartz.dart';
import 'package:project/core/errors/exceptions.dart';
import 'package:project/core/errors/failure.dart';
import 'package:project/core/utils/typedef.dart';
import 'package:project/src/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:project/src/authentication/domain/entities/user.dart';
import 'package:project/src/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImplementation
    implements AuthenticationRepository {
  const AuthenticationRepositoryImplementation(this._remoteDataSource);

  final AuthenticationRemoteDataSource _remoteDataSource;

  @override
  ResultVoid createUser({
    required String createdAt,
    required String name,
    required String avatar,
  }) async {
    // Test-Driven Development
    // Call the remote data source
    // Make sure that it return the proper data if there is no expection
    // Check if the method returns the proper data
    // // Check if when the remoteDataSource throws an  ///exception, we return a failure and if it doesn't throw and excepetion we return the actual expected data
    try {
      await _remoteDataSource.createUser(
          createdAt: createdAt, name: name, avatar: avatar);
      return const Right(null);
    } on APIException catch (e) {
      return Left(APIFailure.fromExpeption(e));
    }
  }

  @override
  ResultFuture<List<User>> getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }
}
