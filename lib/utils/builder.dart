class NotFirebase {
  NotFirebase._();

  static final NotFirebase _instance = NotFirebase._();

  static final NotFirebase instance = _instance;

  factory NotFirebase() {
    return _instance;
  }

  DataBuilder database(String path) {
    return DataBuilder(path);
  }
}

class DataBuilder {
  String? path;
  DataBuilder(this.path);

  int? count;
  Order? order;

  DataBuilder limit(int count) {
    this.count = count;
    return this;
  }

  DataBuilder orderBy(Order order) {
    this.order = order;
    return this;
  }

  void openConnection(void Function(DataMapper data) onData) async {
    await Future.delayed(const Duration(seconds: 4));
    onData.call(DataMapper());
  }
}

class DataMapper {

}

enum Order { left, right }

