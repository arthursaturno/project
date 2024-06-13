import 'package:project/src/authentication/data/models/user_model.dart';

abstract class AuthenticationRemoteDataSource {
  Future<void> createUser({
    required String createdAt,
    required String name,
    required String avatar,
  });

  Future<List<UserModel>> getUsers();
}

class AuthRemoteDataSrcImpl implements AuthenticationRemoteDataSource {
  @override
  Future<void> createUser({
    required String createdAt,
    required String name,
    required String avatar,
  }) {
    // 1. Check to make sure that it returns the right data when the status code is 200 or the proper response code
    // 2. Check to make sure that it "THROWS A CUSTOM EXCEPTION" with the right message when status code is the bad one
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }
}
