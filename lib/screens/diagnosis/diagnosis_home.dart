import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:pearson_flutter/screens/diagnosis/diagnosis_subject.dart';
import 'package:pearson_flutter/utils/config.dart';
import 'package:pearson_flutter/widgets/rtab_indicator.dart';
import 'package:pearson_flutter/widgets/syllabus_picker.dart';

class DiagnoseHome extends StatefulWidget {
  final Widget child;
  final List<String> syllabus;
  final VoidCallback onAccountTap;

  DiagnoseHome({Key key, this.child, this.syllabus, this.onAccountTap})
      : super(key: key);

  @override
  _DiagnoseHomeState createState() => _DiagnoseHomeState();
}

class _DiagnoseHomeState extends State<DiagnoseHome>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  String _selectedSyllabus;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    if (widget.syllabus?.isNotEmpty ?? false)
      _selectedSyllabus = widget.syllabus[0];
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  TabBar makeTabBar() {
    return TabBar(
      isScrollable: true,
      indicator: RTabIndicator(
        indicatorHeight: 3,
        indicatorColor: Theme.of(context).accentColor,
        indicatorSize: RTabIndicatorSize.tiny,
      ),
      unselectedLabelColor: Theme.of(context).hintColor,
      labelStyle: Theme.of(context)
          .textTheme
          .caption
          .copyWith(fontWeight: FontWeight.w900, fontSize: 12),
      tabs: <Tab>[
        Tab(text: 'Physics'.toUpperCase()),
        Tab(text: 'Chemistry'.toUpperCase()),
        Tab(text: 'Mathematics'.toUpperCase()),
        Tab(text: 'Biology'.toUpperCase()),
      ],
      controller: _tabController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      body: TabBarView(
        children: [
          DiagnoseSubject(),
          DiagnoseSubject(),
          DiagnoseSubject(),
          DiagnoseSubject(),
        ],
        controller: _tabController,
      ),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            automaticallyImplyLeading: false,
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
                  globalSelectedSyllabus = v;
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
}
