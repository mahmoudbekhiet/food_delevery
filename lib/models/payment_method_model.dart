class PaymentMethodModel {
  final int id;
  final int userId;
  final String cardNumber;
  final String cardHolderName;
  final String expiryDate;
  final String cardType;
  final bool isDefault;

  PaymentMethodModel({
    required this.id,
    required this.userId,
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
    required this.cardType,
    this.isDefault = false,
  });

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    return PaymentMethodModel(
      id: int.parse(json['id'].toString()),
      userId: int.parse(json['user_id'].toString()),
      cardNumber: json['card_number'] ?? '',
      cardHolderName: json['card_holder_name'] ?? '',
      expiryDate: json['expiry_date'] ?? '',
      cardType: json['card_type'] ?? 'visa',
      isDefault: json['is_default'] == 1 || json['is_default'] == true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'card_number': cardNumber,
      'card_holder_name': cardHolderName,
      'expiry_date': expiryDate,
      'card_type': cardType,
      'is_default': isDefault ? 1 : 0,
    };
  }

  String get maskedCardNumber {
    if (cardNumber.length < 4) return cardNumber;
    return '**** **** **** ${cardNumber.substring(cardNumber.length - 4)}';
  }
}