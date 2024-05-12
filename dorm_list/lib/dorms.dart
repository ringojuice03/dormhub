class Dorm {
  final String imageUrl;
  final String name;
  final String price;
  final String address;
  final String rating;
  final String reviews;
  final List<String> tags;

  Dorm(this.imageUrl, this.name, this.price, this.address, this.rating,
      this.reviews, this.tags);
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
    '1234 Diaz St., Sta. Cruz',
    '4.5',
    '245',
    ['Refrigerator', 'Microwave', 'Gym'],
  ),
  Dorm(
    'assets/dorms/dorm2.png',
    'Funadashi',
    '5,000',
    'Sta. Cruz, Camarines Sur',
    '4.5',
    '245',
    ['Bunk bed'],
  ),
  Dorm(
    'assets/dorms/dorm1.png',
    'Kimono',
    '3,500',
    'Naga City, Camarines Sur',
    '4.5',
    '245',
    ['Refrigerator', 'Microwave'],
  ),
  Dorm(
    'assets/dorms/dorm2.png',
    'Inseki',
    '2,500',
    'Camarines Sur',
    '4.5',
    '245',
    ['Desk'],
  ),
];

List<Dorm> bedspaces = [
  Dorm(
    'assets/dorms/dorm1.png',
    'Nakadashi',
    '9,500',
    'Camarines Sur',
    '4.5',
    '245',
    ['Refrigerator', 'Microwave', 'Gym'],
  ),
  Dorm(
    'assets/dorms/dorm2.png',
    'Funadashi',
    '5,000',
    'Camarines Sur',
    '4.5',
    '245',
    ['Bunk bed'],
  ),
];

List<Dorm> singles = [
  Dorm(
    'assets/dorms/dorm1.png',
    'Nakadashi',
    '9,500',
    'Camarines Sur',
    '4.5',
    '245',
    ['Refrigerator', 'Microwave', 'Gym'],
  ),
  Dorm(
    'assets/dorms/dorm2.png',
    'Funadashi',
    '5,000',
    'Camarines Sur',
    '4.5',
    '245',
    ['Bunk bed'],
  ),
  Dorm(
    'assets/dorms/dorm1.png',
    'Kimono',
    '3,500',
    'Camarines Sur',
    '4.5',
    '245',
    ['Refrigerator', 'Microwave'],
  ),
  Dorm(
    'assets/dorms/dorm2.png',
    'Inseki',
    '2,500',
    'Camarines Sur',
    '4.5',
    '245',
    ['Desk'],
  ),
];

List<Dorm> efficiencies = [
  Dorm(
    'assets/dorms/dorm1.png',
    'Nakadashi',
    '9,500',
    'Camarines Sur',
    '4.5',
    '245',
    ['Refrigerator', 'Microwave', 'Gym'],
  ),
  Dorm(
    'assets/dorms/dorm2.png',
    'Inseki',
    '2,500',
    'Camarines Sur',
    '4.5',
    '245',
    ['Desk'],
  ),
];

List<Dorm> pods = [
  Dorm(
    'assets/dorms/dorm1.png',
    'Kimono',
    '3,500',
    'Camarines Sur',
    '4.5',
    '245',
    ['Refrigerator', 'Microwave'],
  ),
  Dorm(
    'assets/dorms/dorm2.png',
    'Inseki',
    '2,500',
    'Camarines Sur',
    '4.5',
    '245',
    ['Desk'],
  ),
];
