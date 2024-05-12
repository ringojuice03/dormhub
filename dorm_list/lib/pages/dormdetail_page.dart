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
import 'package:dorm_list/main.dart';
import 'package:provider/provider.dart';

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
            const DormImages(), // Image header
            const SizedBox(height: 18),
            const Header(), // Description header
            const SizedBox(height: 18),
            const Divider(
              height: 8,
              thickness: 1,
              indent: 27,
              endIndent: 27,
            ),
            const SizedBox(height: 18),
            Container(
              // Dorm offers
              child: TabBar(
                controller: _tabController,
                indicatorColor: const Color(0xFF474747),
                labelColor: const Color(0xFF474747),
                unselectedLabelColor: const Color(0xFF8C8C8C),
                overlayColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
                tabs: [
                  Tab(
                    child: Row(
                      children: [
                        Icon(Icons.camera_alt),
                        SizedBox(width: 7),
                        AutoSizeText('Amenities',
                            style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: [
                        Icon(Icons.bolt),
                        SizedBox(width: 7),
                        AutoSizeText('Inclusions',
                            style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: [
                        Icon(Icons.edit_note_rounded),
                        SizedBox(width: 7),
                        AutoSizeText('Policies',
                            style: Theme.of(context).textTheme.bodySmall),
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
            const Divider(
              height: 8,
              thickness: 1,
              indent: 27,
              endIndent: 27,
            ),
            SizedBox(height: 18),
            OwnerContact(), // Contact owner button
            SizedBox(height: 18),
            const Divider(
              height: 8,
              thickness: 1,
              indent: 27,
              endIndent: 27,
            ),
            SizedBox(height: 18),
            Map(), // Map proximity container
            SizedBox(height: 18),
            const Divider(
              height: 8,
              thickness: 1,
              indent: 27,
              endIndent: 27,
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
    var appState = context.watch<MyAppState>();
    var currentDorm = appState.currentDorm;
    return ClipRect(
      child: Align(
        alignment: Alignment.center,
        heightFactor: 0.55,
        child: Image.asset(
          currentDorm.imageUrl,
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
    var appState = context.watch<MyAppState>();
    var currentDorm = appState.currentDorm;
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
                Text(currentDorm.price, style: TextStyle(fontSize: 15)),
                Text('Base rent', style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
            SizedBox(width: 92),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFF474747),
                foregroundColor: Colors.white,
                minimumSize: Size(190, 52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/booking');
              },
              child: Text('Check Availability',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.w600,
                      fontSize: 16)),
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
            Text('based on 285 reviews',
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        SizedBox(height: 20),
        Container(
          width: double.maxFinite,
          height: 220,
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
        Text('[1 / 100]', style: Theme.of(context).textTheme.bodySmall),
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
    var appState = context.watch<MyAppState>();
    var currentDorm = appState.currentDorm;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('You\'ll be staying here.',
            style: Theme.of(context).textTheme.bodyMedium),
        SizedBox(height: 18),
        Container(
          width: 359,
          height: 209,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11),
            border: Border.all(
              color: Color(0xFF474747),
              width: 1,
            ),
          ),
        ),
        SizedBox(height: 18),
        Text(
          currentDorm.address,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.w700),
        ),
        Container(
          width: 359,
          child: Text(
              'Landmarks lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ac mi blandit, elementum libero a, varius neque. Praesent vel ipsum dignissim.',
              style: Theme.of(context).textTheme.bodyMedium),
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
              foregroundColor: Color(0xFF474747),
              minimumSize: Size(200, 85),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11),
              ),
            ),
            onPressed: () {},
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xFF474747),
                  radius: 26,
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Larry Amet',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.w600)),
                    Text('Hosting Since 2010',
                        style: Theme.of(context).textTheme.bodyMedium),
                    Text('Owner', style: Theme.of(context).textTheme.bodySmall),
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
    var appState = context.watch<MyAppState>();
    var currentDorm = appState.currentDorm;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(currentDorm.name,
                    style: Theme.of(context).textTheme.bodyLarge),
                Text(currentDorm.address,
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            Row(
              children: [
                Icon(Icons.star),
                Text('${currentDorm.rating} of ${currentDorm.reviews} Reviews',
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
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
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis),
              Text('-'),
              Icon(Icons.bed),
              AutoSizeText('Comfiy',
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis),
              Text('-'),
              Icon(Icons.bed),
              AutoSizeText('Comfiy',
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis),
              Text('-'),
              Icon(Icons.bed),
              AutoSizeText('Comfiy',
                  style: Theme.of(context).textTheme.bodySmall,
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
            style: Theme.of(context).textTheme.bodyMedium,
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
            const SizedBox(
              width: 27,
            ),
            const CircleAvatar(
              backgroundColor: Color(0xFF474747),
              radius: 26,
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Jose Mari Chan',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.w700)),
                Text('Past Resident',
                    style: Theme.of(context).textTheme.bodyMedium),
                Text('2010 - 2014',
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            SizedBox(width: 89),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('10 years ago',
                    style: Theme.of(context).textTheme.bodyMedium),
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
              style: Theme.of(context).textTheme.bodyMedium),
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
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Padding(
                  padding: EdgeInsets.only(left: 30),
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
              child: Padding(
                padding: EdgeInsets.all(8.0),
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
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Padding(
                  padding: EdgeInsets.only(left: 30),
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
              child: Padding(
                padding: EdgeInsets.all(8.0),
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
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Padding(
                  padding: EdgeInsets.only(left: 30),
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
              child: Padding(
                padding: EdgeInsets.all(8.0),
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
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Padding(
                  padding: EdgeInsets.only(left: 30),
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
              child: Padding(
                padding: EdgeInsets.all(8.0),
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
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Padding(
                  padding: EdgeInsets.only(left: 30),
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
              child: Padding(
                padding: EdgeInsets.all(8.0),
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
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Padding(
                  padding: EdgeInsets.only(left: 30),
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
              child: Padding(
                padding: EdgeInsets.all(8.0),
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
          ],
        ),
      ],
    );
  }
}
