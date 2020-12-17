import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pearson_flutter/screens/practice/chapter_test.dart';
import 'package:pearson_flutter/screens/practice/unit_test.dart';
import 'package:pearson_flutter/utils/config.dart';
import 'package:pearson_flutter/widgets/rtab_indicator.dart';
import 'package:pearson_flutter/widgets/syllabus_picker.dart';

class PracticeHome extends StatefulWidget {
  final List<String> syllabus;
  final VoidCallback onAccountTap;

  const PracticeHome({Key key, this.syllabus, this.onAccountTap})
      : super(key: key);

  @override
  _PracticeHomeState createState() => _PracticeHomeState();
}

class _PracticeHomeState extends State<PracticeHome>
    with SingleTickerProviderStateMixin {
  String _selectedSyllabus;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    if (widget.syllabus?.isNotEmpty ?? false)
      _selectedSyllabus = widget.syllabus[0];
  }

  TabBar makeTabBar() {
    return TabBar(
      isScrollable: true,
      unselectedLabelColor: Theme.of(context).hintColor,
      indicator: RTabIndicator(
        indicatorHeight: 3,
        indicatorColor: Theme.of(context).accentColor,
        indicatorSize: RTabIndicatorSize.tiny,
      ),
      labelStyle: Theme.of(context)
          .textTheme
          .caption
          .copyWith(fontWeight: FontWeight.w900, fontSize: 12),
      tabs: <Tab>[
        Tab(text: 'Chapter test'.toUpperCase()),
        Tab(text: 'Unit test'.toUpperCase()),
      ],
      controller: _tabController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      body: TabBarView(
        children: [
          ChapterTest(),
          UnitTest(),
        ],
        controller: _tabController,
      ),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            backgroundColor: Theme.of(context).primaryColor,
            pinned: true,
            floating: true,
            forceElevated: true,
            elevation: 1,
            titleSpacing: 0,
            centerTitle: false,
            title: SyllabusPicker(
              syllabus: widget.syllabus,
              onChange: (v) {
                setState(() {
                  _selectedSyllabus = v;
                });
              },
            ),
            leading: Image.asset("assets/images/favicon.png"),
            bottom: makeTabBar(),
            actions: [
              Hero(
                tag: "account",
                child: Material(
                  borderRadius: BorderRadius.circular(AppConfig.kRadiusSmall),
                  child: IconButton(
                    onPressed: widget.onAccountTap,
                    icon: Icon(FluentSystemIcons.ic_fluent_person_filled),
                  ),
                ),
              ),
            ],
          ),
        ];
      },
    );
  }

  _goto(Widget page) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (_) => page),
    );
    // _panelController.animatePanelToPosition(0.0, curve: Curves.easeInToLinear);
  }
}
