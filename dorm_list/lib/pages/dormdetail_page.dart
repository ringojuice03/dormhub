/* 
Authored by: Selwyn Guiruela
Company: King Kane
Project: DormHub
Feature: [DHUB-002] Dorm Details
Description:  Easily access comprehensive details of your selected unit, 
              including ratings, amenities, house rules, and the land owner's 
              contact information, for a seamless renting experience.
*/

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:auto_size_text/auto_size_text.dart';

class DormDetailPage extends StatefulWidget {
  const DormDetailPage({super.key});
  @override
  State<DormDetailPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DormDetailPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      // Foundation of all widgets
      body: SingleChildScrollView(
        child: Column(
          // Align all widgets vertically
          children: [
            DormImages(), // Image deader
            SizedBox(height: 18),
            Header(), // Description header
            SizedBox(height: 18),
            Divider(
              height: 8,
              thickness: 1,
              indent: 27,
              endIndent: 27,
              color: Colors.black,
            ),
            SizedBox(height: 18),
            Container(
              // Dorm offers
              child: TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                indicatorColor: Colors.black,
                tabs: [
                  Tab(
                    child: Row(
                      children: [
                        Icon(Icons.camera_alt),
                        SizedBox(width: 7),
                        AutoSizeText('Amenities',
                            style: TextStyle(fontSize: 10)),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: [
                        Icon(Icons.bolt),
                        SizedBox(width: 7),
                        AutoSizeText('Inclusions',
                            style: TextStyle(fontSize: 10)),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: [
                        Icon(Icons.edit_note_rounded),
                        SizedBox(width: 7),
                        AutoSizeText('Policies',
                            style: TextStyle(fontSize: 10)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              // Dorm offers contents
              width: double.maxFinite,
              height: 250,
              child: TabBarView(
                controller: _tabController,
                children: [
                  AmenitiesTable(),
                  Text('Table here'),
                  Text('Table here'),
                ],
              ),
            ),
            Divider(
              height: 8,
              thickness: 1,
              indent: 27,
              endIndent: 27,
              color: Colors.black,
            ),
            SizedBox(height: 18),
            OwnerContact(), // Contact owner button
            SizedBox(height: 18),
            Divider(
              height: 8,
              thickness: 1,
              indent: 27,
              endIndent: 27,
              color: Colors.black,
            ),
            SizedBox(height: 18),
            Map(), // Map proximity container
            SizedBox(height: 18),
            Divider(
              height: 8,
              thickness: 1,
              indent: 27,
              endIndent: 27,
              color: Colors.black,
            ),
            SizedBox(height: 18),
            Reviews(
                tabController: _tabController), // Reviews overview dashboard
            Checkout(), // Proceed to billing
            SizedBox(height: 33),
          ],
        ),
      ),
    );
  }
}

class DormImages extends StatelessWidget {
  const DormImages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Align(
        alignment: Alignment.center,
        heightFactor: 0.55,
        child: Image.asset(
          'assets/images/dorm1b.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class Checkout extends StatelessWidget {
  const Checkout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/svgs/horizontal.svg',
          semanticsLabel: 'Horizontal',
        ),
        SizedBox(height: 13),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('₱1,500', style: TextStyle(fontSize: 15)),
                Text('Base rent',
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(width: 92),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.black87,
                foregroundColor: Colors.white,
                minimumSize: Size(180, 52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
              ),
              onPressed: () {},
              child: Text('Check Availability', style: TextStyle(fontSize: 15)),
            ),
          ],
        ),
      ],
    );
  }
}

class Reviews extends StatelessWidget {
  const Reviews({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 27),
            Text('4.8'),
            SizedBox(width: 3),
            SvgPicture.asset(
              'assets/svgs/ratings_stars.svg',
              semanticsLabel: 'Ratings',
            ),
            SizedBox(width: 3),
            Text('based on 285 reviews'),
          ],
        ),
        SizedBox(height: 20),
        Container(
          width: double.maxFinite,
          height: 200,
          child: TabBarView(
            controller: _tabController,
            children: [
              Review1(),
              Text('Table here'),
              Text('Table here'),
            ],
          ),
        ),
        SizedBox(height: 33),
        Text('[1 / 100]', style: TextStyle(fontSize: 10)),
        SizedBox(height: 47),
      ],
    );
  }
}

class Map extends StatelessWidget {
  const Map({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('You\'ll be staying here.'),
        SizedBox(height: 18),
        Container(
          width: 359,
          height: 209,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11),
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
          ),
        ),
        SizedBox(height: 18),
        Text(
          '1234 Diaz St., Sta. Cruz, Naga City, Camarines Sur',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Container(
          width: 359,
          child: Text(
            'Landmarks lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ac mi blandit, elementum libero a, varius neque. Praesent vel ipsum dignissim.',
          ),
        ),
      ],
    );
  }
}

class OwnerContact extends StatelessWidget {
  const OwnerContact({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 27),
        child: IntrinsicWidth(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black87,
              minimumSize: Size(200, 85),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11),
              ),
            ),
            onPressed: () {},
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 26,
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Larry Amet'),
                    Text('Hosting Since 2010'),
                    Text('Owner'),
                  ],
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(Icons.chat_bubble, size: 35),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 27),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Bedspacer#1',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('1234 Diaz St., Sta. Cruz'),
              ],
            ),
            SizedBox(width: 60),
            Icon(Icons.star),
            Text('4.8 of 285 Reviews'),
          ],
        ),
        SizedBox(height: 18),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 31),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.bed),
              AutoSizeText('Comfiy',
                  style: TextStyle(fontSize: 10),
                  overflow: TextOverflow.ellipsis),
              Text('-'),
              Icon(Icons.bed),
              AutoSizeText('Comfiy',
                  style: TextStyle(fontSize: 10),
                  overflow: TextOverflow.ellipsis),
              Text('-'),
              Icon(Icons.bed),
              AutoSizeText('Comfiy',
                  style: TextStyle(fontSize: 10),
                  overflow: TextOverflow.ellipsis),
              Text('-'),
              Icon(Icons.bed),
              AutoSizeText('Comfiy',
                  style: TextStyle(fontSize: 10),
                  overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
        SizedBox(height: 18),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 27),
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ac mi blandit, elementum libero a, varius neque. Praesent vel ipsum dignissim, finibus elit a, commodo neque. Etiam id porta metus, in varius elit. Morbi efficitur purus vitae condimentum fringilla. Nullam aliquet dapibus sapien eget semper.',
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}

class Review1 extends StatelessWidget {
  const Review1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 27,
            ),
            CircleAvatar(
              backgroundColor: Colors.black,
              radius: 26,
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Jose Mari Chan',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Past Resident'),
                Text('2010 - 2014'),
              ],
            ),
            SizedBox(width: 89),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('10 years ago'),
                SvgPicture.asset(
                  'assets/svgs/ratings_stars.svg',
                  semanticsLabel: 'Ratings',
                )
              ],
            ),
          ],
        ),
        SizedBox(height: 18),
        Container(
          width: 359,
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ac mi blandit, elementum libero a, varius neque. Praesent vel ipsum  dignissim, finibus elit a, commodo neque. Etiam id porta metus, in varius elit. Morbi efficitur purus vitae condimentum fringilla. Nullam aliquet dapibus sapien eget semper.',
          ),
        ),
      ],
    );
  }
}

class AmenitiesTable extends StatelessWidget {
  const AmenitiesTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
          children: [
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Padding(
                  padding: EdgeInsets.only(left: 39),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/bunk_bed.svg',
                        semanticsLabel: 'Bunk Bed',
                      ),
                      SizedBox(width: 11),
                      Text('Bunk Bed'),
                    ],
                  ),
                ),
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Padding(
                  padding: EdgeInsets.only(left: 0),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/washing_machine.svg',
                        semanticsLabel: 'Washing Machine',
                      ),
                      SizedBox(width: 11),
                      Text('Washing Machine'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Padding(
                  padding: EdgeInsets.only(left: 39),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/desk.svg',
                        semanticsLabel: 'Desk',
                      ),
                      SizedBox(width: 11),
                      Text('Desk'),
                    ],
                  ),
                ),
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Padding(
                  padding: EdgeInsets.only(left: 0),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/gym.svg',
                        semanticsLabel: 'gym',
                      ),
                      SizedBox(width: 11),
                      Text('Gym'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Padding(
                  padding: EdgeInsets.only(left: 39),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/shared_bath.svg',
                        semanticsLabel: 'Shared Bathroom',
                      ),
                      SizedBox(width: 11),
                      Text('Shared Bath'),
                    ],
                  ),
                ),
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Padding(
                  padding: EdgeInsets.only(left: 0),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/parking_space.svg',
                        semanticsLabel: 'Parking Space',
                      ),
                      SizedBox(width: 11),
                      Text('Parking Space'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Padding(
                  padding: EdgeInsets.only(left: 39),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/shared_kitchen.svg',
                        semanticsLabel: 'Shared Kitchen',
                      ),
                      SizedBox(width: 11),
                      Text('Shared Kitchen'),
                    ],
                  ),
                ),
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Padding(
                  padding: EdgeInsets.only(left: 0),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/security_personnel.svg',
                        semanticsLabel: 'Security Personnel',
                      ),
                      SizedBox(width: 11),
                      Text('Security Personnel'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Padding(
                  padding: EdgeInsets.only(left: 39),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/refrigerator.svg',
                        semanticsLabel: 'Refrigerator',
                      ),
                      SizedBox(width: 11),
                      Text('Refrigerator'),
                    ],
                  ),
                ),
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Padding(
                  padding: EdgeInsets.only(left: 0),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/surveillance_camera.svg',
                        semanticsLabel: 'Surveillance Camera',
                      ),
                      SizedBox(width: 11),
                      Text('Surveillance Camera'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Padding(
                  padding: EdgeInsets.only(left: 39),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/microwave.svg',
                        semanticsLabel: 'Microwave',
                      ),
                      SizedBox(width: 11),
                      Text('Microwave'),
                    ],
                  ),
                ),
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Padding(
                  padding: EdgeInsets.only(left: 0),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/rooftop_terrace.svg',
                        semanticsLabel: 'Rooftop Terrace',
                      ),
                      SizedBox(width: 11),
                      Text('Rooftop Terrace'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
