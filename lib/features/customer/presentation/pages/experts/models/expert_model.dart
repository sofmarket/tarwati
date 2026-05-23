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
    name: 'Michael Thompson, CFP®',
    title: 'Certified Financial Planner',
    rating: 4.9,
    reviewCount: 128,
    yearsExperience: 8,
    tags: ['Financial Planning', 'Investing'],
    pricePerSession: 150,
    imagePath: 'assets/images/expert_1.jpg',
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
