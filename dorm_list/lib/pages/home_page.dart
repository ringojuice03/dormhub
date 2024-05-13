/*
Authored by: Kane Beringuela
Company: N/A
Project: DormHub

Feature: [DHUB-001] Dorm List
Description: Display a list of dorms.
*/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dorm_list/main.dart';
import 'package:dorm_list/dorms.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool fBool = true;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var filterChips = appState.filterChips;
    var filterBool = appState.filterBool;
    //manage an array of tabs
    //used on app bar bottom in this case
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        drawer: const NavigationDrawer(),
        body: const ReturnTabBarView(),
        appBar: AppBar(
          title:
              Text('dormhub', style: Theme.of(context).textTheme.displayMedium),
          centerTitle: true,
          shadowColor: Colors.black,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: IconButton(
                icon: const Icon(Icons.bookmark),
                onPressed: () {
                  Navigator.pushNamed(context, '/bookmark');
                },
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(appState.preferredSize),
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //search bar 
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 260,
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 15),
                              Icon(Icons.search),
                              SizedBox(width: 10),
                              Text('Search'),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      //filter button
                      ElevatedButton(
                        onPressed: () => setState(() {
                          fBool = !fBool;
                          appState.toggleFilter();
                        }), 
                        style: ElevatedButton.styleFrom(
                          backgroundColor: fBool ? Colors.white : const Color(0xFF474747),
                          foregroundColor: fBool ? const Color(0xFF474747) : Colors.white,
                          minimumSize: const Size(58, 52),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11),
                          )
                        ),
                        child: const Icon(Icons.filter_alt_rounded),
                      ),
                    ],
                  ),
                  //filter choices
                  if (appState.isFilterPressed) ... {
                    Wrap(
                      direction: Axis.horizontal,
                      spacing: 10,
                      alignment: WrapAlignment.center,
                      children: List.generate(filterChips.length, (index) {
                        return ChoiceChip(
                          labelPadding: const EdgeInsets.all(0),
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          selectedColor: Colors.black.withOpacity(0.2),
                          selected: filterBool[index],
                          onSelected: (newBoolValue) {
                            setState(() {
                              filterBool[index] = newBoolValue;
                              appState.pressedTag(filterChips[index]);
                            });
                          },
                          label: Text(
                            filterChips[index],
                            style: const TextStyle(fontSize: 10),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          showCheckmark: false,
                        );
                      }),
                    ),
                  },
                  const SizedBox(height: 10),
                  //bottom tabs
                  Material(
                    elevation: 0.5,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: appState.isFilterPressed
                                ? Colors.black.withOpacity(0.2)
                                : Colors.transparent,
                          ),
                        ),
                      ),
                      child: TabBar(
                        indicatorColor: const Color(0xFF474747),
                        labelColor: const Color(0xFF474747),
                        unselectedLabelColor: const Color(0xFF8C8C8C),
                        overlayColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        labelPadding: EdgeInsets.zero,
                        tabs: <Widget>[
                          Tab(
                            icon: const Icon(Icons.sensor_door),
                            child: Text('Studio',
                                style: Theme.of(context).textTheme.bodySmall),
                          ),
                          Tab(
                            icon: const Icon(Icons.bed),
                            child: Text('Bedspace',
                                style: Theme.of(context).textTheme.bodySmall,
                                overflow: TextOverflow.ellipsis),
                          ),
                          Tab(
                            icon: const Icon(Icons.airline_seat_individual_suite),
                            child: Text('Single',
                                style: Theme.of(context).textTheme.bodySmall),
                          ),
                          Tab(
                            icon: const Icon(Icons.chair),
                            child: Text('Shared',
                                style: Theme.of(context).textTheme.bodySmall,
                                overflow: TextOverflow.ellipsis),
                          ),
                          Tab(
                            icon: const Icon(Icons.circle),
                            child: Text('Pod',
                                style: Theme.of(context).textTheme.bodySmall),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//the drawer of the main scaffold
class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      //widget whose children are list tiles
      child: ListView(
        children: <Widget>[
          //header of the list view structure
          Container(
            padding: const EdgeInsets.only(top: 50, left: 25),
            height: 90,
            child: Text('dormhub',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontSize: 20)),
          ),
          //similar to a button
          Padding(
            padding: const EdgeInsets.only(
                left: 5), // Add 30 pixels of space to the left
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.home, size: 30),
                  title: Text('Home',
                      style: Theme.of(context).textTheme.bodyMedium),
                  onTap: () {
                    // Close drawer
                    Navigator.of(context).pop();
                  },
                ),
                const SizedBox(height: 5),
                ListTile(
                  leading: const Icon(Icons.person, size: 30),
                  title: Text('Profile',
                      style: Theme.of(context).textTheme.bodyMedium),
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                ),
                const SizedBox(height: 5),
                ListTile(
                  leading: const Icon(Icons.book, size: 30),
                  title: Text('Booking',
                      style: Theme.of(context).textTheme.bodyMedium),
                  onTap: () {
                    Navigator.pushNamed(context, '/booking');
                  },
                ),
                const SizedBox(height: 5),
                ListTile(
                  leading: const Icon(Icons.settings, size: 30),
                  title: Text('Settings',
                      style: Theme.of(context).textTheme.bodyMedium),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//displays the list of dorms (image, name, and price)
class ReturnTabBarView extends StatelessWidget {
  const ReturnTabBarView({super.key});
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    //generates the dorm for each category
    return TabBarView(
      children: dormList.map(
        (dormCategory) {
          var filteredDorms = appState.updateFilteredDorms(dormCategory);
          return ListView.builder(
            itemCount: filteredDorms.length,
            itemBuilder: (context, index) {
              return DormUnit(
                dorm: filteredDorms[index],
                index: index,
              );
            },
          );
        },
      ).toList(),
    );
  }
}

//utility class for dorm units
class DormUnit extends StatefulWidget {
  const DormUnit({
    super.key,
    required this.dorm,
    required this.index,
  });

  final Dorm dorm;
  final int index;

  @override
  State<DormUnit> createState() => _DormUnitState();
}

class _DormUnitState extends State<DormUnit> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var snackBarMsg = SnackBar(
      content: Text(appState.isFavorite(widget.dorm)),
    );
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 12.5, 25, 12.5),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              appState.currentDorm = widget.dorm;
              Navigator.pushNamed(context, '/dorm_detail');
            },
            child: Ink(
              height: MediaQuery.of(context).size.width * 0.875,
              width: MediaQuery.of(context).size.width * 0.875,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                image: DecorationImage(
                  //dorm image
                  image: AssetImage(widget.dorm.imageUrl),
                ),
              ),
              child: ListTile(
                trailing: GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(snackBarMsg);
                    appState.pressedFavorite(widget.dorm);
                    widget.dorm.bBool = !widget.dorm.bBool;
                  },
                  child: Column(
                    children: [
                      SizedBox(height: 16),
                      widget.dorm.bBool ? const Icon(Icons.bookmark, size: 40) : const Opacity(opacity: 0.5, child: Icon(Icons.bookmark_border_outlined, size: 40)),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //dorm name
                    Text(widget.dorm.name,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.w700)),
                    Text('${widget.index + 1} beds available',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: const Color.fromARGB(255, 160, 160, 160))),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    //price
                    Text('₱ ${widget.dorm.price}',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.w700)),
                    Row(
                      children: [
                        Text(widget.dorm.rating),
                        const SizedBox(width: 5),
                        const Icon(Icons.star, size: 18),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
