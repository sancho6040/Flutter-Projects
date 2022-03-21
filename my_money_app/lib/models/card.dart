class Card {
  int id;
  String _name;
  double _value;
  bool _isCredit;

  Card(this.id, this._name, this._value, this._isCredit);

  // int get id => id;
  String get name => _name;
  double get value => _value;
  bool get isCredit => _isCredit;

  Card.fromMap(dynamic obj)
      : id = obj['id'],
        _name = obj['name'],
        _value = obj['value'],
        _isCredit = obj['isCredit'];

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'] = id;
    map['name'] = _name;
    map['value'] = _value;
    map['isCredit'] = _isCredit;

    return map;
  }
}
