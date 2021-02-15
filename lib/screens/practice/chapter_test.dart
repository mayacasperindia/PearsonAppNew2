import 'package:expandable/expandable.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:pearson_flutter/screens/diagnosis/diagnosis_subject.dart';
import 'package:pearson_flutter/screens/diagnosis/diagnosis_subject_item.dart';
import 'package:pearson_flutter/screens/practice/practice_test_item.dart';
import 'package:pearson_flutter/utils/config.dart';
import 'package:pearson_flutter/widgets/rtab_indicator.dart';
import 'package:pearson_flutter/widgets/syllabus_picker.dart';

class ChapterTest extends StatefulWidget {
  final List<String> syllabus;
  final VoidCallback onAccountTap;
  final ScrollController controller;
  final Function(String syllabus) onSyllabusChange;

  const ChapterTest(
      {Key key,
      this.syllabus,
      this.controller,
      this.onAccountTap,
      this.onSyllabusChange})
      : super(key: key);

  @override
  _ChapterTestState createState() => _ChapterTestState();
}

class _ChapterTestState extends State<ChapterTest>
    with SingleTickerProviderStateMixin {
  int _currentIndex;

  String _selectedSyllabus;
  TabController _tabController;

  _callback(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    if (widget.syllabus?.isNotEmpty ?? false)
      _selectedSyllabus = widget.syllabus[0];

    super.initState();
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
        Tab(text: 'Physics'.toUpperCase()),
        Tab(text: 'Chemistry'.toUpperCase()),
        Tab(text: 'Mathematics'.toUpperCase()),
      ],
      controller: _tabController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      body: TabBarView(
        children: [
          _buildContent(),
          _buildContent(),
          _buildContent(),
        ],
        controller: _tabController,
      ),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            backgroundColor: Theme.of(context).primaryColor,
            pinned: true,
            forceElevated: true,
            elevation: 1,
            titleSpacing: 0,
            centerTitle: false,
            floating: false,
            snap: false,
            title: SyllabusPicker(
              syllabus: widget.syllabus,
              onChange: (v) {
                setState(() {
                  _selectedSyllabus = v;
                });
                if (widget.onSyllabusChange != null)
                  widget.onSyllabusChange(_selectedSyllabus);
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
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            tabs: [
              Tab(text: "Physics"),
              Tab(text: "Chemistry"),
              Tab(text: "Mathematics"),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildContent(),
                _buildContent(),
                _buildContent(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildContent() {
    return ListView.builder(
      itemCount: 10,
      padding: EdgeInsets.symmetric(vertical: 10),
      itemBuilder: (context, index) => PracticeTestItem(
        index: index,
        expanded: index == _currentIndex,
        callback: _callback,
      ),
    );
  }
}
