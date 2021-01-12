import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:pearson_flutter/screens/diagnosis/diagnosis_subject.dart';
import 'package:pearson_flutter/utils/config.dart';
import 'package:pearson_flutter/widgets/report_picker.dart';
import 'package:pearson_flutter/widgets/rtab_indicator.dart';
import 'package:pearson_flutter/widgets/syllabus_picker.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Reports extends StatefulWidget {
  final Widget child;
  final List<String> syllabus;
  final VoidCallback onAccountTap;

  Reports({Key key, this.child, this.syllabus, this.onAccountTap})
      : super(key: key);

  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> with SingleTickerProviderStateMixin {
  TabController _tabController;

  String _selectedSyllabus;

  List<String> _subject = [
    'Physics',
    'Chemistry',
    'Mathematics',
    'Biology',
  ];
  List<String> _chapter = [
    'Chapter 1',
    'Chapter 2',
    'Chapter 3',
  ];
  List<String> _topic = [
    'Topic 1',
    'Topic 2',
    'Topic 3',
  ];
  List<String> _attempt = [
    'First',
    'Second',
    'Third',
  ];
  List<String> _classes = [
    '9th',
    '10th',
    '11th',
    '12th',
  ];
  List<String> _mode = [
    'Offline',
    'Online',
  ];
  List<String> _test = [
    'First',
    'Second',
    'Third',
  ];

  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this);
    if (widget.syllabus?.isNotEmpty ?? false)
      _selectedSyllabus = widget.syllabus[1];

    print('syllabus ${widget.syllabus}');
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
        Tab(text: 'Exercise'.toUpperCase()),
        Tab(text: 'Prep-meter'.toUpperCase()),
        Tab(text: 'Chapter Test'.toUpperCase()),
        Tab(text: 'Unit Test'.toUpperCase()),
        Tab(text: 'Previous Year Paper'.toUpperCase()),
        Tab(text: 'Test Series'.toUpperCase()),
      ],
      controller: _tabController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      body: TabBarView(
        children: [
          ReportDropdown(
            subject: _subject,
            topic: _topic,
            chapter: _chapter,
            attempt: _attempt,
          ),
          ReportDropdown(
            subject: _subject,
            chapter: _chapter,
            topic: _topic,
            attempt: _attempt,
          ),
          ReportDropdown(
            subject: _subject,
            chapter: _chapter,
            test: _test,
            attempt: _attempt,
          ),
          ReportDropdown(
            test: _test,
            attempt: _attempt,
          ),
          ReportDropdown(
            classes: _classes,
            test: _test,
            attempt: _attempt,
          ),
          ReportDropdown(
            classes: _classes,
            mode: _mode,
            test: _test,
            attempt: _attempt,
          ),
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

class ReportDropdown extends StatefulWidget {
  final List<String> subject;
  final List<String> topic;
  final List<String> chapter;
  final List<String> attempt;
  final List<String> classes;
  final List<String> mode;
  final List<String> test;

  ReportDropdown(
      {this.subject,
      this.topic,
      this.chapter,
      this.attempt,
      this.classes,
      this.mode,
      this.test});

  @override
  _ReportDropdownState createState() => _ReportDropdownState();
}

class _ReportDropdownState extends State<ReportDropdown> {
  String subjectPicker;
  String topicPicker;
  String chapterPicker;
  String attemptPicker = 'Not Selected';
  String classPicker;
  String modePicker;
  String testPicker = 'Not Selected';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Column(
          children: [
            Column(
              children: <Widget>[
                if (widget.subject?.isNotEmpty ?? false)
                  ReportsPicker(
                    subject: widget.subject,
                    select: 'Select Subject',
                    onChange: (v) {
                      setState(() {
                        subjectPicker = v;
                      });
                    },
                  ),
                if (widget.topic?.isNotEmpty ?? false)
                  ReportsPicker(
                    subject: widget.topic,
                    select: 'Select Topic',
                    onChange: (v) {
                      setState(() {
                        topicPicker = v;
                      });
                    },
                  ),
                if (widget.chapter?.isNotEmpty ?? false)
                  ReportsPicker(
                    subject: widget.chapter,
                    select: 'Select Chapter',
                    onChange: (v) {
                      setState(() {
                        chapterPicker = v;
                      });
                    },
                  ),
                if (widget.classes?.isNotEmpty ?? false)
                  ReportsPicker(
                    subject: widget.classes,
                    select: 'Select Classes',
                    onChange: (v) {
                      setState(() {
                        classPicker = v;
                      });
                    },
                  ),
                if (widget.mode?.isNotEmpty ?? false)
                  ReportsPicker(
                    subject: widget.mode,
                    select: 'Select Mode',
                    onChange: (v) {
                      setState(() {
                        modePicker = v;
                      });
                    },
                  ),
                if (widget.test?.isNotEmpty ?? false)
                  ReportsPicker(
                    subject: widget.test,
                    select: 'Select Test',
                    onChange: (v) {
                      setState(() {
                        testPicker = v;
                      });
                    },
                  ),
                if (widget.attempt?.isNotEmpty ?? false)
                  ReportsPicker(
                    subject: widget.attempt,
                    select: 'Select Attempt',
                    onChange: (v) {
                      setState(() {
                        attemptPicker = v;
                      });
                    },
                  ),
              ],
            ),
            if (attemptPicker != 'Not Selected' ?? false)
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      'Your Report',
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.3,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          padding: EdgeInsets.all(10),
                          child: CircularPercentIndicator(
                            radius: MediaQuery.of(context).size.width * 0.25,
                            lineWidth: 7,
                            animation: true,
                            percent: 60 / 100,
                            center: Text(
                              "60.0%",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                            footer: Text(
                              "Total",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17.0),
                            ),
                            backgroundColor: Colors.black12,
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: Theme.of(context).buttonColor,
                          )),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          padding: EdgeInsets.all(10),
                          child: CircularPercentIndicator(
                            radius: MediaQuery.of(context).size.width * 0.25,
                            lineWidth: 7,
                            animation: true,
                            percent: 60 / 100,
                            center: Text(
                              "60.0%",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                            footer: Text(
                              "Correct",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17.0),
                            ),
                            backgroundColor: Colors.black12,
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: Colors.green,
                          )),
                    ],
                  ),
                  if (testPicker != 'Not Selected' ?? false)
                    Row(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            padding: EdgeInsets.all(10),
                            child: CircularPercentIndicator(
                              radius: MediaQuery.of(context).size.width * 0.25,
                              lineWidth: 7,
                              animation: true,
                              percent: 40 / 100,
                              center: Text(
                                "40.0%",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              footer: Text(
                                "Attempt",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0),
                              ),
                              backgroundColor: Colors.black12,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.redAccent,
                            )),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            padding: EdgeInsets.all(10),
                            child: CircularPercentIndicator(
                              radius: MediaQuery.of(context).size.width * 0.25,
                              lineWidth: 7,
                              animation: true,
                              percent: 90 / 100,
                              center: Text(
                                "90%",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              footer: Text(
                                "Skipped",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0),
                              ),
                              backgroundColor: Colors.black12,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.cyan,
                            )),
                      ],
                    ),
                  Row(
                    children: [
                      if (testPicker == 'Not Selected' ?? true)
                        Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            padding: EdgeInsets.all(10),
                            child: CircularPercentIndicator(
                              radius: MediaQuery.of(context).size.width * 0.25,
                              lineWidth: 7,
                              animation: true,
                              percent: 40 / 100,
                              center: Text(
                                "40.0%",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              footer: Text(
                                "Incorrect",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0),
                              ),
                              backgroundColor: Colors.black12,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.redAccent,
                            )),
                      if (testPicker != 'Not Selected' ?? false)
                        Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            padding: EdgeInsets.all(10),
                            child: CircularPercentIndicator(
                              radius: MediaQuery.of(context).size.width * 0.25,
                              lineWidth: 7,
                              animation: true,
                              percent: 360 / 500,
                              center: Text(
                                "360",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              footer: Text(
                                "Mark",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0),
                              ),
                              backgroundColor: Colors.black12,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Theme.of(context).buttonColor,
                            )),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          padding: EdgeInsets.all(10),
                          child: CircularPercentIndicator(
                            radius: MediaQuery.of(context).size.width * 0.25,
                            lineWidth: 7,
                            animation: true,
                            percent: 90 / 100,
                            center: Text(
                              "90%",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                            footer: Text(
                              "Time",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17.0),
                            ),
                            backgroundColor: Colors.black12,
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: Colors.cyan,
                          )),
                    ],
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
