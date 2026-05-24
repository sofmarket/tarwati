class ExpertModel {
  const ExpertModel({
    required this.name,
    required this.title,
    required this.rating,
    required this.reviewCount,
    required this.yearsExperience,
    required this.tags,
    required this.pricePerSession,
    required this.imagePath,
    this.isOnline = true,
    this.about = '',
    this.expertiseAreas = const [],
    this.sessionCount = 0,
    this.satisfactionRate = 98,
    this.audioSessionPrice = 100,
    this.sessionDurationMinutes = 60,
  });

  final String name;
  final String title;
  final double rating;
  final int reviewCount;
  final int yearsExperience;
  final List<String> tags;
  final int pricePerSession;
  final String imagePath;
  final bool isOnline;
  final String about;
  final List<String> expertiseAreas;
  final int sessionCount;
  final int satisfactionRate;
  final int audioSessionPrice;
  final int sessionDurationMinutes;

  String get firstName => name.split(',').first.split(' ').first;
}

const expertCategories = [
  'All',
  'Financial Planning',
  'Investing',
  'Retirement',
  'Tax',
];

const expertsList = [
  ExpertModel(
    name: 'Omar Al-Harbi, CFP®',
    title: 'Certified Financial Planner',
    rating: 4.9,
    reviewCount: 128,
    yearsExperience: 8,
    tags: ['Financial Planning', 'Investing', 'Retirement'],
    pricePerSession: 150,
    imagePath: 'assets/images/expert_1.jpg',
    about:
        'Omar is a Certified Financial Planner with over 8 years of experience helping individuals and families achieve their financial goals. He specializes in comprehensive financial planning, investment strategies, and retirement planning.',
    expertiseAreas: [
      'Financial Planning',
      'Investment Management',
      'Retirement Planning',
      'Wealth Management',
      'Tax Planning',
      'Debt Management',
    ],
    sessionCount: 820,
    satisfactionRate: 98,
    audioSessionPrice: 100,
  ),
  ExpertModel(
    name: 'Sarah Chen, CFA®',
    title: 'Investment Analyst',
    rating: 4.8,
    reviewCount: 96,
    yearsExperience: 6,
    tags: ['Investing', 'Wealth Management'],
    pricePerSession: 120,
    imagePath: 'assets/images/expert_2.jpg',
  ),
  ExpertModel(
    name: 'David Rodriguez, CPA®',
    title: 'Tax & Financial Advisor',
    rating: 4.9,
    reviewCount: 112,
    yearsExperience: 10,
    tags: ['Tax Planning', 'Retirement'],
    pricePerSession: 130,
    imagePath: 'assets/images/expert_3.jpeg',
  ),
  ExpertModel(
    name: 'James Wilson, CFP®',
    title: 'Retirement Specialist',
    rating: 4.7,
    reviewCount: 84,
    yearsExperience: 12,
    tags: ['Retirement', 'Financial Planning'],
    pricePerSession: 140,
    imagePath: 'assets/images/expert_4.jpg',
  ),
];
