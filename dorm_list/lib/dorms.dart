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

// "Bunk bed",
// "Desk",
// "Air Conditioner",
// "Refrigerator",
// "Microwave",
// "Washing Machine",
// "Bathroom",
// "Kitchen",
// "Rooftop terrace",
// "Parking space",
// "Gym",
// "Surveilance camera",
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
    'Sunflower Studios',
    '12,000',
    '5678 Panganiban Dr.',
    '4.3',
    '120',
    ['Desk', 'Air Conditioner', 'Bathroom', 'Kitchen'],
  ),
  Dorm(
    'assets/dorms/dorm2.png',
    'Mangrove Place',
    '6,500',
    '1230 Magsaysay Ave.',
    '4.1',
    '98',
    ['Bunk bed', 'Washing Machine'],
  ),
  Dorm(
    'assets/dorms/dorm1.png',
    'Emerald Suites',
    '8,500',
    '4321 Roxas Ave.',
    '4.0',
    '110',
    ['Refrigerator', 'Microwave', 'Parking space'],
  ),
  Dorm(
    'assets/dorms/dorm2.png',
    'Cypress Lodge',
    '7,500',
    '7890 Penafrancia Ave., San Francisco',
    '3.8',
    '75',
    ['Desk', 'Rooftop terrace'],
  ),
  Dorm(
    'assets/dorms/dorm2.png',
    'Maple Residences',
    '7,000',
    '1357 Elias Angeles St.',
    '4.2',
    '85',
    ['Desk', 'Surveillance camera'],
  ),
];

List<Dorm> bedspaces = [
  Dorm(
    'assets/dorms/dorm1.png',
    'Lagoon Bedspaces',
    '3,000',
    '2468 Bagumbayan St.',
    '3.9',
    '55',
    ['Refrigerator', 'Microwave', 'Gym'],
  ),
  Dorm(
    'assets/dorms/dorm2.png',
    'Cove Living',
    '2,500',
    '8642 Abella St.',
    '3.5',
    '40',
    ['Bunk bed', 'Air Conditioner'],
  ),
  Dorm(
    'assets/dorms/dorm1.png',
    'Sunset Dwellings',
    '2,800',
    '1593 Igualdad St.',
    '4.0',
    '62',
    ['Refrigerator', 'Microwave', 'Gym'],
  ),
  Dorm(
    'assets/dorms/dorm2.png',
    'Pine Haven',
    '2,600',
    '7531 Queborac Dr.',
    '3.8',
    '50',
    ['Bunk bed', 'Bathroom'],
  ),
  Dorm(
    'assets/dorms/dorm1.png',
    'Jade Living',
    '2,700',
    '8642 Del Rosario St.',
    '4.1',
    '45',
    ['Refrigerator', 'Microwave', 'Gym'],
  ),
];

List<Dorm> singles = [
  Dorm(
    'assets/dorms/dorm1.png',
    'Riverfront Singles',
    '12,500',
    '1593 Diversion Rd.',
    '4.4',
    '95',
    ['Refrigerator', 'Microwave', 'Gym'],
  ),
  Dorm(
    'assets/dorms/dorm2.png',
    'Green Fields',
    '5,500',
    '7531 Mayon Ave.',
    '4.0',
    '80',
    ['Bunk bed', 'Parking space'],
  ),
  Dorm(
    'assets/dorms/dorm1.png',
    'Harbor Suites',
    '9,000',
    '8642 Maharlika Hwy.',
    '4.1',
    '110',
    ['Refrigerator', 'Microwave', 'Washing Machine'],
  ),
  Dorm(
    'assets/dorms/dorm2.png',
    'Bamboo Grove',
    '6,000',
    '1593 San Felipe Rd.',
    '3.9',
    '70',
    ['Desk', 'Air Conditioner'],
  ),
  Dorm(
    'assets/dorms/dorm2.png',
    'Serenity Lodge',
    '6,200',
    '7531 Almeda Hwy.',
    '4.0',
    '75',
    ['Desk', 'Rooftop terrace'],
  ),
];

List<Dorm> efficiencies = [
  Dorm(
    'assets/dorms/dorm1.png',
    'Penafrancia Palace',
    '8,500',
    '8642 Penafrancia St.',
    '4.3',
    '210',
    ['Refrigerator', 'Microwave', 'Gym', 'Air Conditioner'],
  ),
  Dorm(
    'assets/dorms/dorm2.png',
    'Jacob Junction',
    '3,000',
    '1593 Jacob St.',
    '4.1',
    '190',
    ['Desk', 'Bathroom'],
  ),
  Dorm(
    'assets/dorms/dorm1.png',
    'Washington Walk',
    '8,500',
    '7531 Washington Dr.',
    '4.3',
    '220',
    ['Refrigerator', 'Microwave', 'Gym', 'Air Conditioner'],
  ),
  Dorm(
    'assets/dorms/dorm2.png',
    'Blumentritt Bliss',
    '3,000',
    '8642 Blumentritt St.',
    '4.0',
    '200',
    ['Desk', 'Bathroom'],
  ),
  Dorm(
    'assets/dorms/dorm1.png',
    'Barlin Bay',
    '8,500',
    '1593 Barlin St.',
    '4.2',
    '215',
    ['Refrigerator', 'Microwave', 'Gym', 'Air Conditioner'],
  ),
];

List<Dorm> pods = [
  Dorm(
    'assets/dorms/dorm1.png',
    'Panganiban Pod',
    '4,000',
    '7531 Panganiban Dr',
    '4.2',
    '205',
    ['Refrigerator', 'Microwave', 'Bathroom'],
  ),
  Dorm(
    'assets/dorms/dorm2.png',
    'Magsaysay Marvel',
    '3,000',
    '8642 Magsaysay Ave.',
    '4.1',
    '195',
    ['Desk', 'Bathroom'],
  ),
  Dorm(
    'assets/dorms/dorm1.png',
    'Roxas Residence',
    '4,000',
    '1593 Roxas Ave.',
    '4.2',
    '210',
    ['Refrigerator', 'Microwave', 'Bathroom'],
  ),
  Dorm(
    'assets/dorms/dorm2.png',
    'Penafrancia Pod',
    '3,000',
    '7531 Penafrancia Ave.',
    '4.0',
    '200',
    ['Desk', 'Bathroom'],
  ),
  Dorm(
    'assets/dorms/dorm1.png',
    'Penafrancia Pod',
    '4,000',
    '7531 Penafrancia Ave.',
    '4.2',
    '205',
    ['Refrigerator', 'Microwave', 'Bathroom'],
  ),
];
