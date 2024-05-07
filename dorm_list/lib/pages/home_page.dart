import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    //manage an array of tabs
    //used on app bar bottom in this case
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: colorScheme.background,
        //function for drawer
        drawer: const NavigationDrawer(),
        //function for dorm units
        body: const ReturnTabBarView(),
        appBar: AppBar(
          title: const Text('dormhub'),
          centerTitle: true,
          shadowColor: Colors.black,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.bookmark),
              onPressed: () {
                //go to bookmark page
                Navigator.pushNamed(context, '/bookmark');
              },
            ),
          ],
          //manages details of the tabs
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.door_back_door),
                text: 'Studio',
              ),
              Tab(
                icon: Icon(Icons.bed_rounded),
                text: 'Bedspace',
              ),
              Tab(
                icon: Icon(Icons.bed),
                text: 'Single',
              ),
              Tab(
                icon: Icon(Icons.bedroom_child_sharp),
                text: 'Efficiency',
              ),
              Tab(
                icon: Icon(Icons.rounded_corner),
                text: 'Pod',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//the drawer of the main scaffold is managed here
class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      //widget whose children are list tiles
      child: ListView(
        children: <Widget>[
          //header of the list view structure
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: const Text('dormhub header'),
          ),
          //similar to a button
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              //close drawer
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Booking'),
            onTap: () {
              Navigator.pushNamed(context, '/booking');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {},
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
    //widget whose elements are list view
    return TabBarView(
      children: [
        //a container with convenient properties like leading, trailing, etc
        ListView.builder(
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            //utility function for less spaghetti more code looking
            return DormUnit(
              index: index,
              dormImage: 'assets/images/dorm2.png',
              dormName: 'Dorm Name',
              dormPrice: '1,000,000',
            );
          },
        ),
        ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return DormUnit(
              index: index,
              dormImage: 'assets/images/dorm1.png',
              dormName: 'Bunnyland',
              dormPrice: '999,999,999',
            );
          },
        ),
        ListView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return DormUnit(
              index: index,
              dormImage: 'assets/images/dorm2.png',
              dormName: 'Dorm Name',
              dormPrice: '1,000,000',
            );
          },
        ),
        ListView.builder(
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return DormUnit(
              index: index,
              dormImage: 'assets/images/dorm1.png',
              dormName: 'Dorm Name',
              dormPrice: '1,000,000',
            );
          },
        ),
        ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return DormUnit(
              index: index,
              dormImage: 'assets/images/dorm2.png',
              dormName: 'Dorm Name',
              dormPrice: '1,000,000',
            );
          },
        ),
      ],
    );
  }
}

//utility class for dorm units
class DormUnit extends StatelessWidget {
  const DormUnit({
    super.key,
    required this.index,
    required this.dormImage,
    required this.dormName,
    required this.dormPrice,
  });

  final int index;
  final String dormImage;
  final String dormName;
  final String dormPrice;

  final snackBarMsg = const SnackBar(
    content: Text('Pressed Bookmark'),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 12.5, 25, 12.5),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/dorm_detail');
            },
            child: Ink(
              height: MediaQuery.of(context).size.width * 0.875,
              width: MediaQuery.of(context).size.width * 0.875,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  //dorm image
                  image: AssetImage(dormImage),
                ),
              ),
              child: ListTile(
                trailing: GestureDetector(
                  onTap: () =>
                      ScaffoldMessenger.of(context).showSnackBar(snackBarMsg),
                  child: Icon(Icons.bookmark_border_outlined),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //dorm name
                    Text('$dormName ${index + 1}'),
                    Text('${index + 1} beds available'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    //price
                    Text('₱$dormPrice'),
                    Icon(Icons.star),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
