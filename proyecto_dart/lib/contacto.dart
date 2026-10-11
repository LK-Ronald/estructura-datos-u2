class Contacto {
  final String _nombre;
  final String _telefono;
  final String _email;

  Contacto(this._nombre, this._telefono, this._email);

  String get nombre => _nombre;
  String get telefono => _telefono;
  String get email => _email;

  @override
  String toString() => '$_nombre: $_telefono - $_email';
}