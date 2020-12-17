import 'package:flutter/material.dart';
import 'package:pearson_flutter/screens/diagnosis/diagnosis_subject.dart';
import 'package:pearson_flutter/screens/practice/chapter_test.dart';
import 'package:pearson_flutter/unused/drawerExamWidget.dart';

class ChapterTestPracticeScreen extends StatefulWidget {
  final Widget child;

  ChapterTestPracticeScreen({Key key, this.child}) : super(key: key);

  @override
  _ChapterTestPracticeScreenState createState() =>
      _ChapterTestPracticeScreenState();
}

class _ChapterTestPracticeScreenState extends State<ChapterTestPracticeScreen>
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
      backgroundColor: Color(0xff00496C),
      body: Container(
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        //   color: Colors.white,
        // ),
        child: makeTabBarView([
          ChapterTest(),
          ChapterTest(),
          ChapterTest(),
        ]),
      ),
    );
  }
}
