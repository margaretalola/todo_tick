import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Assets/getCategoryColor.dart';

class DisplayCategory extends StatefulWidget {
  DisplayCategory({Key? key}) : super(key: key);

  @override
  State<DisplayCategory> createState() => DisplayCategoryState();
}

class DisplayCategoryState extends State<DisplayCategory> {
  final List<String> categories = ['Personal', 'Exam', 'Homeworks', 'Classes', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Category',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: getCategoryColor(categories[index]), // Set card color
            child: Container(
              height: 120, // Adjust the height as needed
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    categories[index],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Change text color to contrast
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
