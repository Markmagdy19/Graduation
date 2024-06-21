import 'dart:async';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:intl/intl.dart';

import 'package:provider/provider.dart';
import '../../controllers/task_controller.dart';
import '../../generated/l10n.dart';
import '../../models/services/notification_services.dart';
import '../../models/task.dart';
import '../../widgets/button.dart';
import '../../widgets/task_tile.dart';
import '../utils/size_config.dart';
import '../utils/theme.dart';


import '../utils/theme_provider.dart';
import 'add_task_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late NotifyHelper notifyHelper;
  final TaskController _taskController = Get.put(TaskController());
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.requestAndroidPermissions();
    notifyHelper.initializeNotification();
    _taskController.getTasks();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: context.theme.colorScheme.surface,
      appBar: _appBar(),
      body: Column(
        children: [
          _addTaskBar(),
          _addDateBar(),
          const SizedBox(
            height: 6,
          ),
          _showTasks()
        ],
      ),
    );
  }

  AppBar _appBar() => AppBar(
        elevation: 0,
        backgroundColor: context.theme.colorScheme.surface,
        leading: IconButton(
          onPressed: () {
            setState(() {
              Provider.of<ThemeProvider>(context, listen: false).setThemeMode(
                  Theme.of(context).brightness == Brightness.light
                      ? ThemeMode.dark
                      : ThemeMode.light);
              // ThemeServices().switchModeTheme();
              // NotifyHelper().displayNotification;
            });
          },
          icon: Icon(
            Theme.of(context).brightness == Brightness.dark
                ? Icons.wb_sunny_outlined
                : Icons.nightlight_round_outlined,
            size: 28,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : darkGreyClr,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              notifyHelper.cancelAllNotification();
              _taskController.deleteAllTasks();
            },
            icon: const Icon(Icons.delete_sweep_rounded),
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : darkGreyClr,
            iconSize: 28,
          ),
          const CircleAvatar(
            radius: 20,
            child: Icon(Icons.person),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      );

  _addTaskBar() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 10, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: subheadingStyle(context),
              ),
              Text(
              S.of(context).Today,
                style: headingStyle(context),
              ),
            ],
          ),
          MyButton(
            label: S.of(context).Add_Task_Button,
            onTap: () async {
              await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddTaskPage()));
              setState(() {});
              _taskController.getTasks();
            },
          )
        ],
      ),
    );
  }

  _addDateBar() {
    return Container(
      margin: const EdgeInsets.only(top: 8, left: 20),
      child: DatePicker(
        DateTime.now(),
        width: 70,
        height: 90,
        selectedTextColor: Colors.white,
        selectionColor: primaryClr,
        initialSelectedDate: DateTime.now(),
        dayTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
              color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 15),
        ),
        dateTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
              color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 20),
        ),
        monthTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
              color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 12),
        ),
        onDateChange: (newDate) {
          _selectedDate = newDate;
        },
      ),
    );
  }

  Future<void> _onRefresh() async {
    await _taskController.getTasks();
  }

  _showTasks() {
    return Expanded(
      child: Obx(() {
        if (_taskController.taskList.isEmpty) {
          return _noTaskMsg();
        } else {
          return RefreshIndicator(
            onRefresh: _onRefresh,
            child: ListView.builder(
              scrollDirection: SizeConfig.orientation == Orientation.landscape
                  ? Axis.horizontal
                  : Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                var task = _taskController.taskList[index];
                if (task.repeat == S.of(context).Daily ||
                    task.date == DateFormat.yMd().format(_selectedDate) ||
                    (task.repeat == S.of(context).Weekly &&
                        _selectedDate
                                    .difference(
                                        DateFormat.yMd().parse(task.date!))
                                    .inDays %
                                7 ==
                            0) ||
                    (task.repeat == S.of(context).Monthly &&
                        DateFormat.yMd().parse(task.date!).day ==
                            _selectedDate.day)) {
                  // Sanitize and parse the time string
                  try {
                    String sanitizedTime = _sanitizeTimeString(task.startTime!);
                    print('Sanitized time string: "$sanitizedTime"');
                    DateFormat dateFormat = DateFormat('hh:mm a');
                    var date = dateFormat.parseStrict(sanitizedTime);
                    print('Parsed date: "$date"');
                    var myTime = DateFormat('HH:mm').format(date);
                    print('Formatted time: "$myTime"');

                    notifyHelper.scheduledNotification(
                        int.parse(myTime.split(':')[0]),
                        int.parse(myTime.split(':')[1]),
                        task);
                  } catch (e) {
                    print('Error parsing time: $e');
                    return Container(); // Skip this task if there's an error
                  }

                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 1300),
                    child: SlideAnimation(
                      horizontalOffset: 300,
                      child: FadeInAnimation(
                        child: GestureDetector(
                          onTap: () {
                            _showBottomSheet(
                              context,
                              task,
                            );
                          },
                          child: TaskTile(
                            task,
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              },
              itemCount: _taskController.taskList.length,
            ),
          );
        }
      }),
    );
  }

  String _sanitizeTimeString(String time) {
    // Log the initial time string for debugging
    print('Original time string: "$time"');

    // Check each character in the string and log its code unit
    for (int i = 0; i < time.length; i++) {
      print(
          'Character at position $i: ${time[i]}, code unit: ${time.codeUnitAt(i)}');
    }

    // Remove all non-printable and control characters
    time = time.replaceAllMapped(RegExp(r'[^\x20-\x7E]'), (match) {
      String char = match.group(0)!;
      print('Found non-printable character: ${char.codeUnitAt(0)}');
      return '';
    }).trim();

    // Log the time string after removing non-printable characters
    print('After removing non-printable characters: "$time"');

    // Replace non-breaking spaces with regular spaces
    time = time
        .replaceAll('\u00A0', ' ')
        .replaceAll('\u202F', ' ')
        .trim(); // Non-breaking space and Narrow no-break space

    // Log the time string after replacing non-breaking spaces
    print('After replacing non-breaking spaces: "$time"');

    // Remove any extra spaces
    time = time.replaceAll(RegExp(r'\s+'), ' ').trim();

    // Log the time string after trimming extra spaces
    print('After trimming extra spaces: "$time"');

    // Ensure AM/PM is uppercase for DateFormat.jm()
    if (time.contains('am') || time.contains('pm')) {
      time = time.toUpperCase();
    }

    // Log the final sanitized time string
    print('Final sanitized time string: "$time"');

    return time;
  }

  _noTaskMsg() {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: const Duration(seconds: 2),
          child: RefreshIndicator(
            onRefresh: _onRefresh,
            child: SingleChildScrollView(
              child: Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                direction: SizeConfig.orientation == Orientation.landscape
                    ? Axis.horizontal
                    : Axis.vertical,
                children: [
                  SizeConfig.orientation == Orientation.landscape
                      ? const SizedBox(
                          height: 8,
                        )
                      : const SizedBox(
                          height: 220,
                        ),
                  SvgPicture.asset(
                    'assets/images/task.svg',
                    semanticsLabel: S.of(context).Task,
                    height: 100,
                    color: primaryClr.withOpacity(0.5),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 12),
                    child: Text(
                      S.of(context).Task_Message,
                      style: subTitleStyle(context),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizeConfig.orientation == Orientation.landscape
                      ? const SizedBox(
                          height: 120,
                        )
                      : const SizedBox(
                          height: 180,
                        ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  _buildBottomSheet(
      {required String label,
      required Function() onTap,
      required Color clr,
      bool isClose = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        height: 65,
        width: SizeConfig.screenWidth * 0.9,
        decoration: BoxDecoration(
          border: Border.all(
            width: 3,
            color: isClose
                ? Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey[600]!
                    : Colors.grey[300]!
                : clr,
          ),
          borderRadius: BorderRadius.circular(20),
          color: isClose ? Colors.transparent : clr,
        ),
        child: Center(
          child: Text(
            label,
            style: isClose
                ? titleStyle(context)
                : titleStyle(context).copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }

  _showBottomSheet(BuildContext context, Task task) {
    Get.bottomSheet(SingleChildScrollView(
      child: Container(
          padding: const EdgeInsets.only(top: 5),
          width: SizeConfig.screenWidth,
          height: (SizeConfig.orientation == Orientation.landscape)
              ? (task.isCompleted == 1
                  ? SizeConfig.screenHeight * 0.6
                  : SizeConfig.screenHeight * 0.8)
              : (task.isCompleted == 1
                  ? SizeConfig.screenHeight * 0.30
                  : SizeConfig.screenHeight * 0.39),
          color: Theme.of(context).brightness == Brightness.dark
              ? darkHeaderClr
              : Colors.white,
          child: Column(
            children: [
              Flexible(
                  child: Container(
                height: 8,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey[600]
                      : Colors.grey[200],
                ),
              )),
              const SizedBox(
                height: 20,
              ),
              task.isCompleted == 1
                  ? Container()
                  : _buildBottomSheet(
                      label: S.of(context).Task_Completed,
                      onTap: () {
                        notifyHelper.cancelNotification(task);
                        _taskController.markTaskAsCompleted(task.id!);
                        Get.back();
                      },
                      clr: primaryClr),
              _buildBottomSheet(
                  label:S.of(context).Delete_Task,
                  onTap: () {
                    notifyHelper.cancelNotification(task);
                    _taskController.deleteTasks(task);
                    Get.back();
                  },
                  clr: Colors.red[400]!),
              Divider(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey
                    : darkGreyClr,
              ),
              _buildBottomSheet(
                  label: S.of(context).Cancel,
                  onTap: () {
                    Get.back();
                  },
                  clr: primaryClr),
              const SizedBox(
                height: 20,
              )
            ],
          )),
    ));
  }
}
