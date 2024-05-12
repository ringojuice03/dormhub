/*
Authored by: Kane Beringuela
Company: N/A
Project: DormHub

Feature: [DHUB-001] Dorm List
Description: Display a list of dorms.
*/

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:dorm_list/main.dart';
import 'package:dorm_list/dorms.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            IconButton(
              icon: const Icon(Icons.bookmark),
              onPressed: () {
                Navigator.pushNamed(context, '/bookmark');
              },
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(appState.preferredSize),
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
                    const SizedBox(width: 20),
                    //filter button
                    InkWell(
                      onTap: () => setState(() {
                        appState.toggleFilter();
                      }),
                      child: Container(
                        width: 60,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Icon(Icons.flutter_dash),
                      ),
                    ),
                  ],
                ),
                //filter choices
                if (appState.isFilterPressed) ...{
                  Wrap(
                    direction: Axis.horizontal,
                    spacing: 10,
                    alignment: WrapAlignment.center,
                    children: List.generate(filterChips.length, (index) {
                      return ChoiceChip(
                        labelPadding: EdgeInsets.all(0),
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                          style: TextStyle(fontSize: 10),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        showCheckmark: false,
                      );
                    }),
                  ),
                },
                SizedBox(height: 10),
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
                      indicatorColor: Color(0xFF474747),
                      labelColor: Color(0xFF474747),
                      unselectedLabelColor: Color(0xFF8C8C8C),
                      overlayColor:
                          MaterialStateProperty.all<Color>(Colors.transparent),
                      labelPadding: EdgeInsets.zero,
                      tabs: <Widget>[
                        Tab(
                          icon: Icon(Icons.door_back_door),
                          child: Text('Studio',
                              style: Theme.of(context).textTheme.bodySmall),
                        ),
                        Tab(
                          icon: Icon(Icons.bed_rounded),
                          child: Text('Bedspace',
                              style: Theme.of(context).textTheme.bodySmall,
                              overflow: TextOverflow.ellipsis),
                        ),
                        Tab(
                          icon: Icon(Icons.bed),
                          child: Text('Single',
                              style: Theme.of(context).textTheme.bodySmall),
                        ),
                        Tab(
                          icon: Icon(Icons.bedroom_child_sharp),
                          child: Text('Efficiency',
                              style: Theme.of(context).textTheme.bodySmall,
                              overflow: TextOverflow.ellipsis),
                        ),
                        Tab(
                          icon: Icon(Icons.rounded_corner),
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
            padding:
                EdgeInsets.only(left: 5), // Add 30 pixels of space to the left
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
                SizedBox(height: 5),
                ListTile(
                  leading: const Icon(Icons.person, size: 30),
                  title: Text('Profile',
                      style: Theme.of(context).textTheme.bodyMedium),
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                ),
                SizedBox(height: 5),
                ListTile(
                  leading: const Icon(Icons.book, size: 30),
                  title: Text('Booking',
                      style: Theme.of(context).textTheme.bodyMedium),
                  onTap: () {
                    Navigator.pushNamed(context, '/booking');
                  },
                ),
                SizedBox(height: 5),
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
class DormUnit extends StatelessWidget {
  const DormUnit({
    super.key,
    required this.dorm,
    required this.index,
  });

  final Dorm dorm;
  final int index;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var snackBarMsg = SnackBar(
      content: Text(appState.isFavorite(dorm)),
    );
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 12.5, 25, 12.5),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              appState.currentDorm = dorm;
              Navigator.pushNamed(context, '/dorm_detail');
            },
            child: Ink(
              height: MediaQuery.of(context).size.width * 0.875,
              width: MediaQuery.of(context).size.width * 0.875,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                image: DecorationImage(
                  //dorm image
                  image: AssetImage(dorm.imageUrl),
                ),
              ),
              child: ListTile(
                trailing: GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(snackBarMsg);
                    appState.pressedFavorite(dorm);
                  },
                  child: Icon(Icons.bookmark_border_outlined),
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
                    Text('${dorm.name}',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.w700)),
                    Text('${index + 1} beds available',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(255, 160, 160, 160))),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    //price
                    Text('₱${dorm.price}',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.w700)),
                    Row(
                      children: [
                        Text(dorm.rating),
                        SizedBox(width: 5),
                        Icon(Icons.star, size: 18),
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
