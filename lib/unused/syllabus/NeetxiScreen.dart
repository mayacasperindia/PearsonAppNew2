import 'package:flutter/material.dart';
import 'package:pearson_flutter/unused/drawerExamWidget.dart';
import 'package:pearson_flutter/unused/syllabus/subject.dart';

class NEETXIScreen extends StatefulWidget {
  final Widget child;

  NEETXIScreen({Key key, this.child}) : super(key: key);

  @override
  _NEETXIScreenState createState() => _NEETXIScreenState();
}

class _NEETXIScreenState extends State<NEETXIScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    super.dispose();
  }

  TabBar makeTabBar() {
    return TabBar(
      isScrollable: true,
      tabs: <Tab>[
        Tab(
          text: 'Physics',
        ),
        Tab(
          text: 'Chemistry',
        ),
        Tab(
          text: 'Mathematics',
        ),
      ],
      controller: tabController,
    );
  }

  TabBarView makeTabBarView(tabs) {
    return TabBarView(
      children: tabs,
      controller: tabController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text('NEET XI'),
        centerTitle: true,
        bottom: makeTabBar(),
      ),
      endDrawer: DrawerExamWidget(),
      body: Container(
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        //   color: Colors.white,
        // ),
        child: makeTabBarView([
          SubjectScreen(),
          SubjectScreen(),
          SubjectScreen(),
        ]),
      ),
    );
  }
}
