import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pearson_flutter/homepage.dart';
import 'package:pearson_flutter/screens/report/attempt_time_graph.dart';
import 'package:pearson_flutter/screens/report/questions.dart';
import 'package:pearson_flutter/screens/report/topic_wise_report.dart';
import 'package:pearson_flutter/utils/config.dart';
import 'package:pearson_flutter/widgets/report_picker.dart';
import 'package:pearson_flutter/widgets/rtab_indicator.dart';
import 'package:pearson_flutter/widgets/syllabus_picker.dart';
import 'package:pearson_flutter/widgets/widgets.dart';

class Reports extends StatefulWidget {
  final int selectedPage;
  final Widget child;
  final List<String> syllabus;
  final VoidCallback onAccountTap;

  Reports({Key key, this.child, this.syllabus, this.onAccountTap, this.selectedPage})
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
    _tabController = TabController(length: 6, vsync: this, initialIndex: widget.selectedPage == null ? 0 : widget.selectedPage);
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
            selectedExam: 'exercise',
          ),
          ReportDropdown(
            subject: _subject,
            chapter: _chapter,
            topic: _topic,
            attempt: _attempt,
            selectedExam: 'prep-meter',
          ),
          ReportDropdown(
            subject: _subject,
            chapter: _chapter,
            test: _test,
            attempt: _attempt,
            selectedExam: 'chapter-test',
          ),
          ReportDropdown(
            test: _test,
            attempt: _attempt,
            selectedExam: 'unit-test',
          ),
          ReportDropdown(
            classes: _classes,
            test: _test,
            attempt: _attempt,
            selectedExam: 'previous-paper',
          ),
          ReportDropdown(
            classes: _classes,
            mode: _mode,
            test: _test,
            attempt: _attempt,
            selectedExam: 'test-series',
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
            title: SyllabusPicker(
              syllabus: widget.syllabus,
              onChange: (v) {
                setState(() {
                  _selectedSyllabus = v;
                });
              },
            ),
            titleSpacing: 0,
            centerTitle: false,
            leading: InkWell(
                onTap: () {
                  AppConfig.popGoto(
                    context,
                    HomePage(),
                  );
                },
                child: widget.selectedPage != null ? Icon(Icons.clear) : Image.asset("assets/images/favicon.png")),
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
  final String selectedExam;

  ReportDropdown(
      {this.subject,
      this.topic,
      this.chapter,
      this.attempt,
      this.classes,
      this.mode,
      this.test,
      this.selectedExam});

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
  var _score = 2.6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Wrap(
                children: [
                  FractionallySizedBox(
                    widthFactor: 0.5,
                    child: TopicPicker(
                      items: ["Physics", "Chemistry"],
                      hint: "Select subject",
                      onChange: (v) {},
                    ),
                  ),
                  if(widget.selectedExam == "exercise" || widget.selectedExam == "prep-meter" || widget.selectedExam == "chapter-test" || widget.selectedExam == "test-series")
                    FractionallySizedBox(
                    widthFactor: 0.5,
                    child: TopicPicker(
                      items: ["Force", "Pressure"],
                      hint: "Select chapter",
                      onChange: (v) {},
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: 0.5,
                    child: TopicPicker(
                      items: ["Pascal\'s Law", "Gas Laws"],
                      hint: "Select topic",
                      onChange: (v) {},
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: 0.5,
                    child: TopicPicker(
                      items: ["Attempt 1", "Attempt 2"],
                      hint: "Select attempt",
                      onChange: (v) {},
                    ),
                  ),
                ],
              ),
            ),
              Padding(
              padding: const EdgeInsets.all(5.0),
              child: Wrap(
                children: [
                  FractionallySizedBox(
                    widthFactor: 0.5,
                    child: CountCard(
                      count: "12",
                      topic: "Total",
                      color: Colors.indigo,
                      progress: 1.0,
                    ),
                  ),
                  if(widget.selectedExam == "chapter-test" || widget.selectedExam == "unit-test" || widget.selectedExam == "previous-paper" || widget.selectedExam == "test-series")
                    FractionallySizedBox(
                      widthFactor: 0.5,
                      child: CountCard(
                        count: "8",
                        topic: "Attempt",
                        color: Colors.cyan,
                        progress: 0.75,
                      ),
                    ),
                  FractionallySizedBox(
                    widthFactor: 0.5,
                    child: CountCard(
                      count: "4",
                      topic: "Correct",
                      color: Colors.green,
                      progress: 0.25,
                    ),
                  ),
                  if(widget.selectedExam == "exercise" || widget.selectedExam == "prep-meter")
                    FractionallySizedBox(
                    widthFactor: 0.5,
                    child: CountCard(
                      count: "8",
                      topic: "Incorrect",
                      color: Colors.red,
                      progress: 0.75,
                    ),
                  ),
                  if(widget.selectedExam == "chapter-test" || widget.selectedExam == "unit-test" || widget.selectedExam == "previous-paper" || widget.selectedExam == "test-series")
                    FractionallySizedBox(
                      widthFactor: 0.5,
                      child: CountCard(
                        count: "8",
                        topic: "Skipped",
                        color: Colors.red,
                        progress: 0.75,
                      ),
                    ),
                  FractionallySizedBox(
                    widthFactor: 0.5,
                    child: CountCard(
                      count: "2:30",
                      topic: (widget.selectedExam == "chapter-test" || widget.selectedExam == "unit-test" || widget.selectedExam == "previous-paper" || widget.selectedExam == "test-series") ?"Time (MM:SS)":'Time',
                      color: Colors.cyan,
                    ),
                  ),
                  if(widget.selectedExam == "chapter-test" || widget.selectedExam == "unit-test" || widget.selectedExam == "previous-paper" || widget.selectedExam == "test-series")
                    FractionallySizedBox(
                      widthFactor: 0.5,
                      child: CountCard(
                        count: "80/186",
                        topic: "Mark",
                        color: Colors.blueAccent,
                        progress: 0.75,
                      ),
                    ),
                ],
              ),
            ),
            if(widget.selectedExam == "prep-meter" || widget.selectedExam == "exercise")
              AssessmentScoreCard(score: _score),
            Questions(),
            if(widget.selectedExam == "chapter-test" || widget.selectedExam == "unit-test" || widget.selectedExam == "previous-paper" || widget.selectedExam == "test-series")
              TopicWiseReport(),
            AttemptTimeGraph(),
          ],
        ),
      ),
    );
  }
}

class AssessmentScoreCard extends StatelessWidget {
  final double score;
  final String message;

  const AssessmentScoreCard({Key key, @required this.score, this.message})
      : super(key: key);

  get _scorePos => (score / 10) - 1;

  @override
  Widget build(BuildContext context) {
    return RCard(
      child: Column(
        children: [
          IconLabel(Icons.show_chart, "Pearson Assessment Score"),
          Divider(height: 1),
          SizedBox(height: 10),
          Align(
            alignment: Alignment(_scorePos, 0),
            child: SizedBox(
              width: 72,
              child: TooltipContainer(
                color: Colors.red.withOpacity(0.5),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Text(
                        "Your score",
                        textScaleFactor: 0.8,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "$score",
                        textScaleFactor: 1.1,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text(
                  "0",
                  style: TextStyle(color: Theme.of(context).dividerColor),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: SizedBox(
                    height: 10,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(AppConfig.kRadiusSmall),
                      child: LinearProgressIndicator(
                        value: score / 10,
                        valueColor: AlwaysStoppedAnimation(
                          Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  "10",
                  style: TextStyle(color: Theme.of(context).dividerColor),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              message ??
                  "Keep on Trying! You have not yet learned and understood the concepts in this topic. You are advised to study and take the test for this topic again.",
              textScaleFactor: 0.85,
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CountCard extends StatelessWidget {
  final String count;
  final String topic;
  final double progress;
  final Color color;

  const CountCard({Key key, this.count, this.topic, this.progress, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _color = color ?? Theme.of(context).accentColor;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 100,
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConfig.kRadiusSmall),
            side: BorderSide(color: _color, width: 1),
          ),
          clipBehavior: Clip.hardEdge,
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    SizedBox(
                      height: double.maxFinite,
                      child: LinearProgressIndicator(
                        value: progress ?? 0.0,
                        valueColor:
                            AlwaysStoppedAnimation(_color.withOpacity(0.3)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(7.5),
                      child: Center(
                        child: Text(
                          "$count",
                          textScaleFactor: 2.5,
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Text(
                  "$topic",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                color: _color,
                width: double.maxFinite,
                padding: EdgeInsets.all(7.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
