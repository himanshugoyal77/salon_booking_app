import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime newdate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            children: [
              const Icon(
                Icons.arrow_back_ios,
                color: Colors.white60,
                size: 20,
              ),
              const Spacer(),
              Text(
                "${setMonth(newdate.month)}, ${newdate.year}",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white60,
                size: 20,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: DatePicker(
            DateTime.now(),
            // monthTextStyle: TextStyle(color: Colors.white),
            //    dateTextStyle: TextStyle(
            // color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            // dayTextStyle: TextStyle(color: Colors.white),
            deactivatedColor: Colors.white,
            initialSelectedDate: DateTime.now(),
            selectionColor: Colors.white,
            selectedTextColor: const Color(0xff721c80),
            onDateChange: (date) {
              setState(() {
                print(date.day);
                print(date.month);

                /// String updateDate = date.toString();
                newdate = date;
              });
            },
          ),
        ),
      ],
    );
  }

  String setMonth(monthNo) {
    switch (monthNo) {
      case 1:
        return "Jan";
      case 2:
        return "Feb";
      case 3:
        return "Mar";
      case 4:
        return "Apr";
      case 5:
        return "May";
      case 6:
        return "June";
      case 7:
        return "Jul";
      case 8:
        return "Aug";
      case 9:
        return "Sep";
      case 10:
        return "Oct";
      case 11:
        return "Nov";
      case 12:
        return "Dec";

      default:
        return "";
    }
  }
}
