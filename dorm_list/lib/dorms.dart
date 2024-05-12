class Dorm {
  final String imageUrl;
  final String name;
  final String price;
  final List<String> tags;
  Dorm(this.imageUrl, this.name, this.price, this.tags);
}

List<List<Dorm>> dormList = [
  studios,
  bedspaces,
  singles,
  efficiencies,
  pods,
];

List<Dorm> studios = [
  Dorm(
    'assets/dorms/dorm1.png',
    'Nakadashi',
    '9,500',
    ['Refrigerator', 'Microwave', 'Gym'],
  ),
  Dorm(
    'assets/dorms/dorm2.png',
    'Funadashi',
    '5,000',
    ['Bunk bed'],
  ),
  Dorm(
    'assets/dorms/dorm1.png',
    'Kimono',
    '3,500',
    ['Refrigerator', 'Microwave'],
  ),
  Dorm(
    'assets/dorms/dorm2.png',
    'Inseki',
    '2,500',
    ['Desk'],
  ),
];

List<Dorm> bedspaces = [
  Dorm(
    'assets/dorms/dorm1.png',
    'Nakadashi',
    '9,500',
    ['Refrigerator', 'Microwave', 'Gym'],
  ),
  Dorm(
    'assets/dorms/dorm2.png',
    'Funadashi',
    '5,000',
    ['Bunk bed'],
  ),
];

List<Dorm> singles = [
  Dorm(
    'assets/dorms/dorm1.png',
    'Nakadashi',
    '9,500',
    ['Refrigerator', 'Microwave', 'Gym'],
  ),
  Dorm(
    'assets/dorms/dorm2.png',
    'Funadashi',
    '5,000',
    ['Bunk bed'],
  ),
  Dorm(
    'assets/dorms/dorm1.png',
    'Kimono',
    '3,500',
    ['Refrigerator', 'Microwave'],
  ),
  Dorm(
    'assets/dorms/dorm2.png',
    'Inseki',
    '2,500',
    ['Desk'],
  ),
];

List<Dorm> efficiencies = [
  Dorm(
    'assets/dorms/dorm1.png',
    'Nakadashi',
    '9,500',
    ['Refrigerator', 'Microwave', 'Gym'],
  ),
  Dorm(
    'assets/dorms/dorm2.png',
    'Inseki',
    '2,500',
    ['Desk'],
  ),
];

List<Dorm> pods = [
  Dorm(
    'assets/dorms/dorm1.png',
    'Kimono',
    '3,500',
    ['Refrigerator', 'Microwave'],
  ),
  Dorm(
    'assets/dorms/dorm2.png',
    'Inseki',
    '2,500',
    ['Desk'],
  ),
];
