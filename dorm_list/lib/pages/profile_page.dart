/*
Authored by: Kane Beringuela
Company: N/A
Project: DormHub

Feature: [DHUB-003] Profile
Description: Display user's personal information.
*/

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Profile'),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.93,
          child: const Column(
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/images/cutie.jpg'),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hanni Pham',
                            style: TextStyle(fontSize: 20),
                          ),
                          Row(
                            children: [
                              Text('Verified'),
                              SizedBox(width: 3),
                              Icon(Icons.check_circle, size: 12),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Icon(Icons.keyboard_arrow_right, size: 27.5),
                ],
              ),
              Divider(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AvatarSubtitle(
                      icon: Icons.line_axis, title: '2 dorms rented'),
                  AvatarSubtitle(
                      icon: Icons.home, title: '2.3 yrs longest stay'),
                  AvatarSubtitle(
                      icon: Icons.thumb_up, title: '11/10 reputation'),
                ],
              ),
              ProfileTileHeader(title: 'Menu'),
              //one tile
              ProfileTile(
                icon: Icons.person,
                title: 'Personal Information',
              ),
              ProfileTile(
                icon: Icons.money,
                title: 'Payment',
              ),
              ProfileTile(
                icon: Icons.shape_line_sharp,
                title: 'Preferences',
              ),
              ProfileTile(
                icon: Icons.bookmark,
                title: 'Bookmarks',
              ),
              ProfileTile(
                icon: Icons.person_pin_rounded,
                title: 'Verification',
              ),
              ProfileTile(
                icon: Icons.history,
                title: 'History & Activity',
              ),
              ProfileTile(
                  icon: Icons.messenger_outlined, title: 'Review & Ratings'),
              ProfileTile(
                icon: Icons.settings,
                title: 'Settings',
              ),
              ProfileTile(icon: Icons.question_mark, title: 'Help & Support'),
              ProfileTileHeader(title: 'Hosting'),
              ProfileTile(
                  icon: Icons.person_2_outlined, title: 'Become a Host'),
            ],
          ),
        ),
      ),
    );
  }
}

class AvatarSubtitle extends StatelessWidget {
  const AvatarSubtitle({
    super.key,
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14),
        const SizedBox(width: 5),
        Text(
          title,
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}

class ProfileTileHeader extends StatelessWidget {
  const ProfileTileHeader({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 30, 0, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: InkWell(
            onTap: () {},
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(icon),
                      const SizedBox(width: 10),
                      Text(title),
                    ],
                  ),
                  const Icon(Icons.keyboard_arrow_right),
                ],
              ),
            ),
          ),
        ),
        const Divider(height: 8),
      ],
    );
  }
}
