class MySingleton {
  MySingleton._();
  
  static final MySingleton _singleton = MySingleton._();

  
  factory MySingleton() {
    return _singleton;
  }
  
  String name= "";
  
  //String name
  void addName(String input) {
    name+= "$input's Notes";
  }

}