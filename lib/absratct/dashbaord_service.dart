// ignore_for_file: public_member_api_docs, sort_constructors_first, dead_code

abstract class DashBoardService {
  factory DashBoardService() {
    const isNetwork = true;

    return isNetwork ? NetworkUser() : LocalUser();
  }
  Future<User> getUser();

  Future<bool> saveUser();
}

class User {
  String fromWhere;
  User({
    required this.fromWhere,
  });
}

class NetworkUser implements DashBoardService {
  @override
  Future<User> getUser() async {
    return User(fromWhere: 'Network');
  }

  @override
  Future<bool> saveUser() {
    throw UnimplementedError();
  }
}

class LocalUser implements DashBoardService {
  @override
  Future<User> getUser() async {
    return User(fromWhere: 'Nework');
  }

  @override
  Future<bool> saveUser() {
    throw UnimplementedError();
  }
}

class Ciubit {
  DashBoardService? dashBoardService;

  Stream<bool>? _networkStream;

  void watchNetwork() {
    _networkStream?.listen((thereisNetwork) {
      if (thereisNetwork) {
        if (dashBoardService! is NetworkUser) {
          dashBoardService = NetworkUser();
        }
        return;
      }

      dashBoardService = LocalUser();
    });
  }

  Ciubit();

  void getUser() {
    dashBoardService?.getUser();
  }
}

void main() {
  Ciubit();
}
