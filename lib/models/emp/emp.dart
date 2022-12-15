class Emp {
  int _id;
  String _name;
  String _img;
  double _salary;

  Emp(this._id, this._name, this._img, this._salary);

  // Setters
  set id(int id) {
    _id = id;
  }

  set name(String name) {
    _name = name;
  }

  set img(String img) {
    _img = img;
  }

  set salary(double salary) {
    _salary = salary;
  }

  // Getters
  int get id => _id;
  String get name => _name;
  String get img => _img;
  double get salary => _salary;
}
