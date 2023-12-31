import 'package:flutter/material.dart';
import 'package:mountain_app/Models/Escursione.dart';
import 'DestinationsScreen.dart';
import 'ForYouScreen.dart';
import 'SubscriptionsScreen.dart';
import '../Views/SearchBarView.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({Key? key}) : super(key: key);

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              backgroundImage: AssetImage("images/me.jpg"),
              radius: 30,
            ),
            const Text(
              "  Ciao, Federico",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 23),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.search),
              iconSize: 30,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SearchBarView(),
                  ),
                );
              },
            )
            // Your widgets here
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.explore_outlined),
              label: "Destinazioni",
              selectedIcon: Icon(Icons.explore),
            ),
            NavigationDestination(
              icon: Icon(Icons.tour_outlined),
              label: "Iscrizioni",
              selectedIcon: Icon(Icons.tour),
            ),
            NavigationDestination(
              icon: Icon(Icons.tips_and_updates_outlined),
              label: "Per Te",
              selectedIcon: Icon(Icons.tips_and_updates),
            )
          ]),
      body: SafeArea(
        child: <Widget>[
          DestinationsScreen(escursioni: Escursione.escursioniMock),
          SubscriptionsScreen(),
          ForYouScreen(),
        ][currentPageIndex],
      ),
    );
  }
}
