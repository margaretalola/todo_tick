import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todotick/Task/task.dart';

class AddTaskPage extends StatefulWidget {
  final TextEditingController title;
  final TextEditingController description;
  // final QuillController notes;
  final List<String> category;
  final List<int> reminder;

  const AddTaskPage({
    Key? key,
    required this.title,
    required this.description,
    // required this.notes,
    required this.category,
    required this.reminder,
  }) : super(key: key);

  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  String? _selectedCategory;
  final List<String> categories = ['Personal', 'Exam', 'Homeworks', 'Classes', 'Other'];

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2100),
    );
    if (picked!= null) {
      setState(() {
        _dateController.text = DateFormat('dd-MM-yyyy').format(picked);
      });
    }
  }

  Future<void> _selectTime() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked!= null) {
      setState(() {
        _timeController.text = picked.format(context);
      });
    }
  }

  void _saveTask() {
    // Add your save task logic here
    print('Title: ${widget.title.text}');
    print('Description: ${widget.description.text}');
    print('Category: $_selectedCategory');
    print('Date: ${_dateController.text}');
    print('Time: ${_timeController.text}');
    // print('Notes: ${widget.notes.document.toPlainText()}');
    // Add Firestore or other database save logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Task',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              textItem('Title', widget.title, false, false, []),
              textItem('Description', widget.description, false, false, []),
              textItem('Category', TextEditingController(), false, true, categories),
              GestureDetector(
                onTap: _selectDate,
                child: AbsorbPointer(
                  child: textItem('Date', _dateController, false, false, []),
                ),
              ),
              GestureDetector(
                onTap: _selectTime,
                child: AbsorbPointer(
                  child: textItem('Time', _timeController, false, false, []),
                ),
              ),
              // largeTextItem('Notes', widget.notes),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context, 
                    MaterialPageRoute(builder: (context)  => TaskPage())
                    );
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textItem(
      String labelText,
      TextEditingController textController,
      bool obscureText,
      bool isDropdown,
      List<String> dropdownItems,
      ) {
    return Container(
      width: double.infinity,
      height: 55,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: isDropdown
          ? DropdownButtonFormField<String>(
        value: _selectedCategory,
        onChanged: (newValue) {
          setState(() {
            _selectedCategory = newValue;
            textController.text = newValue?? '';
          });
        },
        items: dropdownItems.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: 17,
            color: Colors.black,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 1,
              color: Colors.indigo,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 1,
              color: Colors.grey,
            ),
          ),
        ),
      )
          : TextFormField(
        controller: textController,
        obscureText: obscureText,
        style: TextStyle(fontSize: 17, color: Colors.black),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: 17,
            color: Colors.black,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 1,
              color: Colors.indigo,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 1,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  Widget largeTextItem(String labelText, QuillController controller) {
    return Container(
      width: double.infinity,
      height: 300,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: TextStyle(
              fontSize: 17,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              // child: QuillEditor.basic(
              //   controller: controller,s
              //   readOnly: false, // true for view only mode
              //   configurations: const QuillEditorConfigurations(
              //     placeholder: 'Enter your notes...',
              //     toolbarOptions: ToolbarOptions(
              //       toolbarSize: 30,
              //       toolbarIconSize: 20,
              //     ), controller: null,
              //   ),
              // )
            ),
          ),
        ],
      ),
    );
  }
}