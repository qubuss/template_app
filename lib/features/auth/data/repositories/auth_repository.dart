import 'package:templateapp/core/http/data/models/custom_response.dart';
import 'package:templateapp/features/auth/data/models/sign_in_model.dart';
import 'package:templateapp/services/core_repository.dart';

const String authEndpoint = '/auth';

abstract class AuthRepository {
  Future<CustomResponse<SignInModel>> login({
    required String email,
    required String password,
  });
}

class AuthRepositoryImpl extends CoreRepositoryImpl implements AuthRepository {
  @override
  Future<CustomResponse<SignInModel>> login({
    required String email,
    required String password,
  }) async {
    return get(
      endpoint: '$authEndpoint/login',
      queryParameters: {
        'email': email,
        'password': password,
      },
      convert: (json) => SignInModel.fromJson(json),
    );
  }
}
