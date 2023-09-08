class Buyer {
  final String phone;
  final String email;
  final bool isValid;

  const Buyer({
    this.phone = '',
    this.email = '',
    this.isValid = true,
  });

  Buyer copyWith({
    String? phone,
    String? email,
    bool? isValid,
  }) {
    return Buyer(
      phone: phone ?? this.phone,
      email: email ?? this.email,
      isValid: isValid ?? this.isValid,
    );
  }
}
