const Map<int, String> touristLabels = {
  0: 'Первый',
  1: 'Второй',
  2: 'Третий',
  3: 'Четвертый',
  4: 'Пятый',
  5: 'Шестой',
  6: 'Седьмой',
  7: 'Восьмой',
  8: 'Девятый',
  9: 'Десятый',
  10: 'Одиннадцатый',
  11: 'Двенадцатый',
  12: 'Тринадцатый',
  13: 'Четырнадцатый',
  14: 'Пятнадцатый',
  15: 'Шестнадцатый',
  16: 'Семнадцатый',
  17: 'Восемнадцатый',
  18: 'Девятнадцатый',
  19: 'Двадцатый'
};

class Tourist {
  final int index;
  final String firstName;
  final String lastName;
  final DateTime? dateOfBirth;
  final String citizenship;
  final int? passportNumber;
  final bool isValid;
  final DateTime? passportValidityPeriod;

  String get label => touristLabels[index] ?? '';

  const Tourist({
    this.index = 0,
    this.firstName = '',
    this.lastName = '',
    this.dateOfBirth,
    this.citizenship = '',
    this.passportNumber,
    this.passportValidityPeriod,
    this.isValid = true,
  });

  Tourist copyWith({
    int? index,
    String? firstName,
    String? lastName,
    DateTime? dateOfBirth,
    String? citizenship,
    int? passportNumber,
    DateTime? passportValidityPeriod,
    bool? isValid,
  }) {
    return Tourist(
      index: index ?? this.index,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      citizenship: citizenship ?? this.citizenship,
      passportNumber: passportNumber ?? this.passportNumber,
      passportValidityPeriod:
          passportValidityPeriod ?? this.passportValidityPeriod,
      isValid: isValid ?? this.isValid,
    );
  }
}
