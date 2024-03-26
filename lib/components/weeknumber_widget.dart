import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'constants/my_const.dart';

class WeekNumberWidget extends StatefulWidget {
  @override
  _WeekNumberWidgetState createState() => _WeekNumberWidgetState();
}

class _WeekNumberWidgetState extends State<WeekNumberWidget> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {

    List<Widget> dayWidgets = [];
    for (int i = 0; i < 7; i++) {
      DateTime day = _selectedDate.subtract(Duration(days: _selectedDate.weekday - 1)).add(Duration(days: i));
      bool isCurrentDate = day.year == DateTime.now().year && day.month == DateTime.now().month && day.day == DateTime.now().day;
      dayWidgets.add(
        Expanded(
          child: Column(
            children: [
              Text(
                DateFormat('EEE').format(day),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5,),
              Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    DateFormat('dd').format(day),
                    textAlign: TextAlign.center,
                  ),
                  if (isCurrentDate)
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.red,
                          width: 2.0,
                          style: BorderStyle.solid
                        ),
                        borderRadius: BorderRadius.circular(100)
                        // shape: BoxShape.circle,

                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text(MyConstants.monthFormat(_selectedDate),
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
            ),
            IconButton(
                onPressed: (){
                  setState(() {
                    _selectedDate = DateTime.now();
                  });
                },
                icon: Icon(Icons.today)
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    setState(() {
                      _selectedDate = _selectedDate.subtract(Duration(days: 7));
                    });
                  },
                ),
                Text(
                  'Week ${MyConstants.getWeekNumber(_selectedDate)}',
                  style: TextStyle(fontSize: 20),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {
                    setState(() {
                      _selectedDate = _selectedDate.add(Duration(days: 7));
                    });
                  },
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: dayWidgets,
        ),
      ],
    );
  }
}







