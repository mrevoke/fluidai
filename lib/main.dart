// lib/main.dart
import 'package:fluid/wednesday_row.dart';
import 'package:flutter/material.dart';
import 'package:fluid/bottom_navigation.dart';
import 'package:fluid/calender_date.dart';
import 'package:fluid/event_list.dart';
import 'package:fluid/today_agenda_row.dart'; // Import the TodayAgendaRow widget

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your today\'s Agenda',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int selectedIndex = 0;
  late ScrollController _scrollController;
  late AnimationController _calendarIconAnimationController;
  late AnimationController _containerAnimationController;
  late Animation<double> _calendarIconAnimation;
  late Animation<double> _containerAnimation;
  bool isWednesdayRowVisible = true;
  double wednesdayRowOpacity = 1.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _calendarIconAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _calendarIconAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _calendarIconAnimationController,
        curve: const Interval(0.5, 1.0),
      ),
    );

    _containerAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 75),
    );

    _containerAnimation =
        Tween<double>(begin: 1, end: 0).animate(_containerAnimationController);

    _scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    final scrollPosition = _scrollController.position.pixels;
    const threshold = 50.0;
    const wednesdayRowOffset = 200.0;

    wednesdayRowOpacity =
        (1 - (scrollPosition / wednesdayRowOffset)).clamp(0.0, 1.0);

    if (scrollPosition > threshold) {
      final animationValue =
          ((scrollPosition - threshold) / (wednesdayRowOffset - threshold))
              .clamp(0.0, 1.0);
      int t = 40;
      if (scrollPosition > threshold + t) {
        _calendarIconAnimationController.value =
            ((scrollPosition - threshold - t) /
                    (wednesdayRowOffset - t - threshold))
                .clamp(0.0, 1.0);
      }
      _containerAnimationController.value = animationValue * 5;
    } else {
      _calendarIconAnimationController.value = 0.0;
      _containerAnimationController.value = 0.0;
    }

    setState(() {
      isWednesdayRowVisible = scrollPosition <= wednesdayRowOffset;
    });
  }

  void _onBottomNavTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _calendarIconAnimationController.dispose();
    _containerAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/icons/image283.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              children: [
                Column(
                  children: [
                    TodayAgendaRow(
                      calendarIconAnimation: _calendarIconAnimation,
                      calendarIconAnimationController:
                          _calendarIconAnimationController,
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView(
                        controller: _scrollController,
                        children: [
                          CalendarDateLogic(
                            onDateSelected: (index) {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                          ),
                          const SizedBox(height: 20),
                          AnimatedOpacity(
                            opacity: isWednesdayRowVisible
                                ? wednesdayRowOpacity
                                : 0.0,
                            duration: const Duration(milliseconds: 300),
                            child: WednesdayRow(
                              containerAnimation: _containerAnimation,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const EventList(),
                        ],
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomBottomNavigationBar(
                    currentIndex: selectedIndex,
                    onTap: _onBottomNavTap,
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
