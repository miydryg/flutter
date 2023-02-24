class MyNameLastName {
  String lastName = 'Kryzhanivsky';
  String _lastName;

  String name = 'Nazar';
  String _name;

  MyNameLastName({required this.name, required this.lastName})
      : _name = name,
        _lastName = lastName;

  String get myName => _name;
  String get mylastName => _lastName;

  set myName(String name) => _name = name;
  set mylastName(String lastName) => _lastName = lastName;
}
