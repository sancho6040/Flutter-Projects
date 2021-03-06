class EventDetail {
  String? id;
  String _description;
  String _date;
  String _startTime;
  String _endTime;
  String _speaker;

  EventDetail(this.id, this._description, this._date, this._startTime,
      this._endTime, this._speaker);

  String get description => _description;
  String get date => _date;
  String get startTime => _startTime;
  String get endTime => _endTime;
  String get speaker => _speaker;

  EventDetail.fromMap(dynamic obj)
      //:id = obj['id'],
      : _description = obj['description'],
        _date = obj['date'],
        _startTime = obj['startTime'],
        _endTime = obj['endTime'],
        _speaker = obj['speaker'];

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    // map['id'] = id;
    map['description'] = _description;
    map['date'] = _date;
    map['startTime'] = _startTime;
    map['endTime'] = _endTime;
    map['speaker'] = _speaker;

    return map;
  }
}
