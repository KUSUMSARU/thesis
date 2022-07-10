import 'package:flutter/material.dart';
import 'package:rentomatic_app/tabpages/earning_tab.dart';
import 'package:rentomatic_app/tabpages/home_tab.dart';
import 'package:rentomatic_app/tabpages/profile_tab.dart';
import 'package:rentomatic_app/tabpages/ratings_tab.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    onItemClicked(int index) {
      setState(() {
        selectedIndex = index;
        tabController!.index = selectedIndex;
      });
    }

    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children: [
          HomeTabPage(),
          EarningsTabPage(),
          ProfileTabPage(),
          RatingTabPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
        ],
      ),
    );
  }
}
