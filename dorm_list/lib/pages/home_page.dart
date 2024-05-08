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
    //manage an array of tabs
    //used on app bar bottom in this case
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        //function for drawer
        drawer: const NavigationDrawer(),
        //function for dorm units
        body: const ReturnTabBarView(),
        appBar: AppBar(
          title: Text('dormhub', style: Theme.of(context).textTheme.displayMedium),
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
          bottom: TabBar(
            indicatorColor: Color(0xFF474747),
            labelColor: Color(0xFF474747),
            unselectedLabelColor: Color(0xFF8C8C8C),
            overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
            labelPadding: EdgeInsets.zero,

            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.door_back_door),
                child: Text('Studio', style: Theme.of(context).textTheme.bodySmall),
              ),
              Tab(
                icon: Icon(Icons.bed_rounded),
                child: Text('Bedspace', style: Theme.of(context).textTheme.bodySmall, overflow: TextOverflow.ellipsis),
              ),
              Tab(
                icon: Icon(Icons.bed),
                child: Text('Single', style: Theme.of(context).textTheme.bodySmall),
              ),
              Tab(
                icon: Icon(Icons.bedroom_child_sharp),
                child: Text('Efficiency', style: Theme.of(context).textTheme.bodySmall, overflow: TextOverflow.ellipsis),
              ),
              Tab(
                icon: Icon(Icons.rounded_corner),
                child: Text('Pod', style: Theme.of(context).textTheme.bodySmall),
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
          Container(
            padding: const EdgeInsets.only(top: 50, left: 25),
            height: 90,
            child: Text('dormhub', style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 20)),
          ),
          //similar to a button
          Padding(
            padding: EdgeInsets.only(left: 5), // Add 30 pixels of space to the left
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.home, size: 30),
                  title: Text('Home', style: Theme.of(context).textTheme.bodyMedium),
                  onTap: () {
                    // Close drawer
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(height: 5),
                ListTile(
                  leading: const Icon(Icons.person, size: 30),
                  title: Text('Profile', style: Theme.of(context).textTheme.bodyMedium),
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                ),
                SizedBox(height: 5),
                ListTile(
                  leading: const Icon(Icons.book, size: 30),
                  title: Text('Booking', style: Theme.of(context).textTheme.bodyMedium),
                  onTap: () {
                    Navigator.pushNamed(context, '/booking');
                  },
                ),
                SizedBox(height: 5),
                ListTile(
                  leading: const Icon(Icons.settings, size: 30),
                  title: Text('Settings', style: Theme.of(context).textTheme.bodyMedium),
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
              dormName: 'King Kane\'s Apartment',
              dormPrice: '8,000',
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
              dormPrice: '13,000',
            );
          },
        ),
        ListView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return DormUnit(
              index: index,
              dormImage: 'assets/images/dorm2.png',
              dormName: 'Johnny\'s Paradise',
              dormPrice: '9,500',
            );
          },
        ),
        ListView.builder(
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return DormUnit(
              index: index,
              dormImage: 'assets/images/dorm1.png',
              dormName: 'The House of Ryan',
              dormPrice: '15,000',
            );
          },
        ),
        ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return DormUnit(
              index: index,
              dormImage: 'assets/images/dorm2.png',
              dormName: 'Mi Casa tu Casa',
              dormPrice: '6,000',
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
    content: Text('Added to Bookmarks!'),
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
                borderRadius: BorderRadius.circular(11),
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
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //dorm name
                    Text('$dormName', style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700)),
                    Text('${index + 1} beds available', style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700, color: Color.fromARGB(255, 160, 160, 160))),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    //price
                    Text('₱$dormPrice', style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700)),
                    Row(
                      children: [
                        Text('9.5'),
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
