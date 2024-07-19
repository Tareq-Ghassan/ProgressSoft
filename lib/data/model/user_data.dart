/// [UserData] class holds user
class UserData {
  /// [UserData] constructor
  UserData({
    required this.age,
    required this.fullName,
    required this.gender,
    required this.phone,
  });

  ///[UserData.fromMap] a `factory` function to map regx
  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      age: map['age'] as int,
      fullName: map['fullName'] as String,
      gender: map['gender'] as String,
      phone: map['phone'] as String,
    );
  }

  /// [age] holds `age`
  final int age;

  /// [fullName] holds `fullName`
  final String fullName;

  /// [gender]  holds `gender`
  final String gender;

  /// [phone]  holds `phone`
  final String phone;
}
