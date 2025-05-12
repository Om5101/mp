class UserModel {
  final String id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final DateTime dateOfBirth;
  final String address;
  final String accountType;
  final double amount;
  final int vacancies;

  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.address,
    required this.accountType,
    required this.amount,
    required this.vacancies,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'dateOfBirth': dateOfBirth.millisecondsSinceEpoch,
      'address': address,
      'accountType': accountType,
      'amount': amount,
      'vacancies': vacancies,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map, String documentId) {
    return UserModel(
      id: documentId,
      fullName: map['fullName'] ?? '',
      email: map['email'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      dateOfBirth: DateTime.fromMillisecondsSinceEpoch(map['dateOfBirth']),
      address: map['address'] ?? '',
      accountType: map['accountType'] ?? '',
      amount: (map['amount'] ?? 0).toDouble(),
      vacancies: (map['vacancies'] ?? 0).toInt(),
    );
  }
}
