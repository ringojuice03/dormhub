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
            TabBar(
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
                      const Icon(Icons.camera_alt),
                      const SizedBox(width: 7),
                      AutoSizeText('Amenities',
                          style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    children: [
                      const Icon(Icons.bolt),
                      const SizedBox(width: 7),
                      AutoSizeText('Inclusions',
                          style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    children: [
                      const Icon(Icons.edit_note_rounded),
                      const SizedBox(width: 7),
                      AutoSizeText('Policies',
                          style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
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
            const SizedBox(height: 18),
            const OwnerContact(), // Contact owner button
            const SizedBox(height: 18),
            const Divider(
              height: 8,
              thickness: 1,
              indent: 27,
              endIndent: 27,
            ),
            const SizedBox(height: 18),
            const Map(), // Map proximity container
            const SizedBox(height: 18),
            const Divider(
              height: 8,
              thickness: 1,
              indent: 27,
              endIndent: 27,
            ),
            const SizedBox(height: 18),
            Reviews(
                tabController: _tabController), // Reviews overview dashboard
            const Checkout(), // Proceed to billing
            const SizedBox(height: 33),
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
        const SizedBox(height: 13),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('₱${currentDorm.price}', style: TextStyle(fontSize: 15)),
                Text('Base rent', style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
            const SizedBox(width: 92),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFF474747),
                foregroundColor: Colors.white,
                minimumSize: const Size(190, 52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/booking');
              },
              child: Text('Check Availability',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: const Color(0xFFFFFFFF),
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
            const SizedBox(width: 27),
            const Text('4.8'),
            const SizedBox(width: 3),
            SvgPicture.asset(
              'assets/svgs/ratings_stars.svg',
              semanticsLabel: 'Ratings',
            ),
            const SizedBox(width: 3),
            Text('based on 285 reviews',
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
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
        const SizedBox(height: 33),
        Text('[1 / 100]', style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 47),
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
        const SizedBox(height: 18),
        Container(
          width: 359,
          height: 209,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11),
            border: Border.all(
              color: const Color(0xFF474747),
              width: 1,
            ),
          ),
        ),
        const SizedBox(height: 18),
        Text(
          currentDorm.address,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.w700),
        ),
        SizedBox(
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
              foregroundColor: const Color(0xFF474747),
              minimumSize: const Size(200, 85),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11),
              ),
            ),
            onPressed: () {},
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Color(0xFF474747),
                  radius: 26,
                ),
                const SizedBox(
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
                const SizedBox(
                  width: 15,
                ),
                const Icon(Icons.chat_bubble, size: 35),
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
                const Icon(Icons.star),
                Text('${currentDorm.rating} of ${currentDorm.reviews} Reviews',
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ],
        ),
        const SizedBox(height: 18),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 31),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(Icons.bed),
              AutoSizeText('Comfiy',
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis),
              const Text('-'),
              const Icon(Icons.bed),
              AutoSizeText('Comfiy',
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis),
              const Text('-'),
              const Icon(Icons.bed),
              AutoSizeText('Comfiy',
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis),
              const Text('-'),
              const Icon(Icons.bed),
              AutoSizeText('Comfiy',
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
        const SizedBox(height: 18),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27),
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
            const SizedBox(width: 15),
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
            const SizedBox(width: 89),
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
        const SizedBox(height: 18),
        SizedBox(
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
        const TableRow(
          children: [
            _DormTagLeft(
              imageUrl: 'assets/svgs/bunk_bed.svg',
              tag: 'Bunk Bed',
            ),
            _DormTagRight(
              imageUrl: 'assets/svgs/washing_machine.svg',
              tag: 'Washing Machine',
            )
          ],
        ),
        const TableRow(
          children: [
            _DormTagLeft(
              imageUrl: 'assets/svgs/desk.svg',
              tag: 'Desk',
            ),
            _DormTagRight(
              imageUrl: 'assets/svgs/gym.svg',
              tag: 'Gym',
            )
          ],
        ),
        const TableRow(
          children: [
            _DormTagLeft(
              imageUrl: 'assets/svgs/shared_bath.svg',
              tag: 'Shared Bathroom',
            ),
            _DormTagRight(
              imageUrl: 'assets/svgs/parking_space.svg',
              tag: 'Parking Space',
            )
          ],
        ),
        const TableRow(
          children: [
            _DormTagLeft(
              imageUrl: 'assets/svgs/shared_kitchen.svg',
              tag: 'Shared Kitchen',
            ),
            _DormTagRight(
              imageUrl: 'assets/svgs/aircon.svg',
              tag: 'Air Conditioner',
            )
          ],
        ),
        const TableRow(
          children: [
            _DormTagLeft(
              imageUrl: 'assets/svgs/refrigerator.svg',
              tag: 'Refrigerator',
            ),
            _DormTagRight(
              imageUrl: 'assets/svgs/surveillance_camera.svg',
              tag: 'Surveillance Camera',
            )
          ],
        ),
        const TableRow(
          children: [
            _DormTagLeft(
              imageUrl: 'assets/svgs/microwave.svg',
              tag: 'Microwave',
            ),
            _DormTagRight(
              imageUrl: 'assets/svgs/rooftop_terrace.svg',
              tag: 'Rooftop terrace',
            )
          ],
        )
      ],
    );
  }
}

class _DormTagRight extends StatelessWidget {
  const _DormTagRight({
    super.key,
    required this.imageUrl,
    required this.tag,
  });

  final String imageUrl;
  final String tag;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var currentDorm = appState.currentDorm;
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SvgPicture.asset(
              imageUrl,
              semanticsLabel: tag,
              colorFilter: ColorFilter.mode(
                const Color(0xFF474747)
                    .withOpacity(currentDorm.tags.contains(tag) ? 1 : 0.3),
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 11),
            Text(
              tag,
              style: TextStyle(
                color: Color(0xFF474747)
                    .withOpacity(currentDorm.tags.contains(tag) ? 1 : 0.3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DormTagLeft extends StatelessWidget {
  const _DormTagLeft({
    super.key,
    required this.imageUrl,
    required this.tag,
  });

  final String imageUrl;
  final String tag;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var currentDorm = appState.currentDorm;
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            children: [
              SvgPicture.asset(
                imageUrl,
                semanticsLabel: tag,
                colorFilter: ColorFilter.mode(
                  const Color(0xFF474747)
                      .withOpacity(currentDorm.tags.contains(tag) ? 1 : 0.3),
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 11),
              Text(
                tag,
                style: TextStyle(
                  color: Color(0xFF474747)
                      .withOpacity(currentDorm.tags.contains(tag) ? 1 : 0.3),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
