class MySingleton {
  factory MySingleton() {
    return _singleton;
  }
  MySingleton._();

  static final MySingleton _singleton = MySingleton._();

  String name = '';

  //String name
  void addName(String input) {
    name += "$input's Notes";
  }

  String printName() {
    return name;
  }
}
