import 'package:flutter/material.dart';
import 'package:dorm_list/main.dart';
import 'package:dorm_list/pages/home_page.dart';
import 'package:provider/provider.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});
  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var favorites = appState.favorites;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Bookmarks'),
      ),
      body: favorites.isEmpty
          ? const Center(
              child: Text('You haven\'t bookmarked any.'),
            )
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                return DormUnit(
                  dorm: favorites[index],
                  index: index,
                );
              },
            ),
    );
  }
}
