class UserProfileModel {
  const UserProfileModel({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.dateOfBirth,
    required this.country,
    required this.city,
    this.imagePath = 'assets/images/expert_4.jpg',
    this.countryCode = '+971',
    this.countryFlag = '🇦🇪',
  });

  final String fullName;
  final String email;
  final String phone;
  final DateTime dateOfBirth;
  final String country;
  final String city;
  final String imagePath;
  final String countryCode;
  final String countryFlag;

  static final mock = UserProfileModel(
    fullName: 'Ahmed Al Mansoori',
    email: 'ahmed.mansoori@email.com',
    phone: '50 123 4567',
    dateOfBirth: DateTime(1992, 5, 15),
    country: 'United Arab Emirates',
    city: 'Dubai',
  );
}

const profileCountries = [
  'United Arab Emirates',
  'Saudi Arabia',
  'Qatar',
  'Kuwait',
  'Bahrain',
  'Oman',
];
