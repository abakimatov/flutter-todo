import 'package:flutter/material.dart';
import 'package:my_app/widgets/icon_decoration.dart';

class EventsScreen extends StatefulWidget {
  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class Event {
  final String time;
  final String task;
  final String desc;
  final bool isCompleted;

  const Event(this.time, this.task, this.desc, this.isCompleted);
}

final List<Event> _eventList = [
  new Event("08:00", "Call Tom about appointment", "Personal", true),
  new Event("09:00", "Fix onboarding experience", "Personal", true),
  new Event("11:20", "Edit API documentation", "Personal", true),
  new Event("13:00", "Setup user focus group", "Personal", false),
  new Event("15:45", "Have coffe with Sam", "Job", false),
  new Event("18:30", "Meet with sales", "Job", false)
];

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    double iconSize = 20;
    return ListView.builder(
      itemCount: _eventList.length,
      padding: const EdgeInsets.all(0),
      itemBuilder: (context, index) {
        final Event currentEvent = _eventList[index];
        final bool isCompleted = currentEvent.isCompleted;

        return Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: Row(children: <Widget>[
            _progressLine(
                context, iconSize, index, _eventList.length, isCompleted),
            _displayTime(currentEvent.time),
            _displayContent(currentEvent.task, currentEvent.desc)
          ]),
        );
      },
    );
  }

  Widget _displayContent(String task, String desc) {
    return Expanded(
        child: Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
            child: Container(
                padding: const EdgeInsets.all(14.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0x20000000),
                        blurRadius: 5,
                        offset: Offset(0, 3))
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(task),
                    SizedBox(
                      height: 12,
                    ),
                    Text(desc)
                  ],
                ))));
  }

  Widget _displayTime(String time) {
    return Container(
        width: 80,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(time),
        ));
  }

  Widget _progressLine(BuildContext context, double iconSize, int index,
      int listLength, bool isCompleted) {
    final IconData icon =
        isCompleted ? Icons.fiber_manual_record : Icons.radio_button_unchecked;

    return Container(
        decoration: IconDecoration(
            iconSize: iconSize,
            lineWidth: 1,
            firstData: index == 0,
            lastData: index == listLength - 1),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 3),
                      color: Color(0x20000000),
                      blurRadius: 5)
                ]),
            child: Icon(icon,
                size: iconSize, color: Theme.of(context).accentColor)));
  }
}
