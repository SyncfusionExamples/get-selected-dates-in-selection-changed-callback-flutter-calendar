import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() => runApp(SelectedDateDetails());

class SelectedDateDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EventCalendar(),
    );
  }
}

class EventCalendar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScheduleExample();
}

class ScheduleExample extends State<EventCalendar> {
  final CalendarController _controller = CalendarController();
  String _text = '';

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: SfCalendar(
        view: CalendarView.day,
        allowedViews: [
          CalendarView.day,
          CalendarView.week,
          CalendarView.workWeek,
          CalendarView.month,
          CalendarView.timelineDay,
          CalendarView.timelineWeek,
          CalendarView.timelineWorkWeek,
          CalendarView.timelineMonth
        ],
        controller: _controller,
        onSelectionChanged: selectionChanged,
      ),
    );
  }

  void selectionChanged(CalendarSelectionDetails details) {
    if (_controller.view == CalendarView.month ||
        _controller.view == CalendarView.timelineMonth) {
      _text = DateFormat('dd, MMMM yyyy').format(details.date!).toString();
    } else {
      _text =
          DateFormat('dd, MMMM yyyy hh:mm a').format(details.date!).toString();
    }
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Container(
                child: new Text("Details shown by selected date changed callback")),
            content:
            Container(child: new Text("You have selected " + '$_text')),
            actions: <Widget>[
              new TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: new Text('close'))
            ],
          );
        });
  }
}
