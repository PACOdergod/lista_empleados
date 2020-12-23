class Empleado {
  int _id;
  String _nombre;
  double _salario;

  Empleado(this._id, this._nombre, this._salario);

  set id(int numero) {
    this._id = numero;
  }

  set nombre(String texto) {
    this._nombre = texto;
  }

  set salarios(double cantidad) {
    this._salario = cantidad;
  }

  int get id => this._id;
  String get nombre => this._nombre;
  double get salario => this._salario;
}
