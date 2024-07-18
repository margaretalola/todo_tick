import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todotick/Assets/button.dart';
import 'package:todotick/Assets/buttonNavigation.dart';
import 'package:todotick/Task/addingTask.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

class TaskPage extends StatefulWidget {
  TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => TaskPageState();
}

class TaskPageState extends State<TaskPage> {
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  final quill.QuillController notes = quill.QuillController.basic();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _dateMessage = '';

  @override
  void initState() {
    super.initState();
    _updateDateMessage();
  }

  void _updateDateMessage() {
    final now = DateTime.now();
    final dateFormat = DateFormat('EEEE, d MMMM');
    String newDateMessage = dateFormat.format(now);
    if (newDateMessage != _dateMessage) {
      setState(() {
        _dateMessage = newDateMessage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Task',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _addTaskBar(),
          _calendarWidget(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              // child: quill.QuillEditor.basic(
              //   controller: notes,
              //   readOnly: false,
              //   configurations: null,
              // ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
          //   // child: quill.QuillToolbar.basic(controller: notes),
          // ),
        ],
      ),
      bottomNavigationBar: Buttonnavigation(),
    );
  }

  _addTaskBar() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.MMMEd().format(DateTime.now()),
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Today',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Button(
            label: '+ Add Task',
            onTap: () => Get.to(() => AddTaskPage(
              title: title,
              description: description,
              // notes: notes,
              category: [],
              reminder: [],
            )),
          ),
        ],
      ),
    );
  }

  _calendarWidget() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: Colors.indigo,
        selectedTextColor: Colors.white,
        dateTextStyle: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        dayTextStyle: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        monthTextStyle: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 13,
            color: Colors.grey,
          ),
        ),
        onDateChange: (date) {
          setState(() {
            _selectedDate = date;
          });
        },
      ),
    );
  }
}
