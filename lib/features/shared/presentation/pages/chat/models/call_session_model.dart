class CallSessionModel {
  const CallSessionModel({
    required this.expertName,
    required this.expertImagePath,
    this.selfImagePath = 'assets/images/expert_2.jpg',
    this.sessionType = 'Video Session',
    this.sessionDate = 'Wed, 15 May 2024',
    this.sessionTime = '10:00 AM - 11:00 AM',
  });

  final String expertName;
  final String expertImagePath;
  final String selfImagePath;
  final String sessionType;
  final String sessionDate;
  final String sessionTime;

  static const mock = CallSessionModel(
    expertName: 'Omar Al-Harbi, CFP®',
    expertImagePath: 'assets/images/expert_1.jpg',
  );

  factory CallSessionModel.fromBooking({
    required String expertName,
    required String expertImagePath,
    required String sessionType,
    required String sessionDate,
    required String sessionTime,
  }) {
    return CallSessionModel(
      expertName: expertName,
      expertImagePath: expertImagePath,
      sessionType: sessionType,
      sessionDate: sessionDate,
      sessionTime: sessionTime,
    );
  }
}
