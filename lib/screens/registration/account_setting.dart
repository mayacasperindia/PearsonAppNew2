import 'package:flutter/material.dart';
import 'package:pearson_flutter/screens/registration/change_password.dart';
import 'package:pearson_flutter/screens/registration/profile_acct.dart';
import 'package:pearson_flutter/widgets/rtab_indicator.dart';
import 'package:pearson_flutter/widgets/syllabus_picker.dart';

class AccountSetting extends StatefulWidget {
  @override
  _AccountSettingState createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting>
    with SingleTickerProviderStateMixin{
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    // if (widget.syllabus?.isNotEmpty ?? false)
    //   _selectedSyllabus = widget.syllabus[0];
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
        Tab(text: 'Personal Info'.toUpperCase()),
        Tab(text: 'Change Password'.toUpperCase()),
      ],
      controller: _tabController,
    );
  }
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      body: TabBarView(
        children: [
          Profile(),
          Password(),
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
            title: Text("Profile Account"),
            // title: SyllabusPicker(
            //   syllabus: widget.syllabus,
            //   onChange: (v) {
            //     setState(() {
            //       _selectedSyllabus = v;
            //     });
            //   },
            // ),
            leading: Image.asset("assets/images/favicon.png"),
            bottom: makeTabBar(),
            // actions: [
            //   Hero(
            //     tag: "account",
            //     child: Material(
            //       borderRadius: BorderRadius.circular(AppConfig.kRadiusSmall),
            //       child: IconButton(
            //         onPressed: widget.onAccountTap,
            //         icon: Icon(FluentSystemIcons.ic_fluent_person_filled),
            //       ),
            //     ),
            //   ),
            // ],
          ),
        ];
      },
    );
  }
}