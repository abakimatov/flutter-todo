import 'package:flutter/material.dart';

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
        final IconData eventIcon = isCompleted
            ? Icons.fiber_manual_record
            : Icons.radio_button_unchecked;

        return Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: Row(children: <Widget>[
            Container(
                decoration: IconDecoration(
                    iconSize: iconSize,
                    lineWidth: 1,
                    firstData: index == 0,
                    lastData: index == _eventList.length - 1),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 3),
                              color: Color(0x20000000),
                              blurRadius: 5)
                        ]),
                    child: Icon(eventIcon,
                        size: iconSize, color: Theme.of(context).accentColor))),
            Container(
                width: 80,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(currentEvent.time),
                )),
            Expanded(
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
                            Text(currentEvent.task),
                            SizedBox(
                              height: 12,
                            ),
                            Text(currentEvent.desc)
                          ],
                        ))))
          ]),
        );
      },
    );
  }
}

class IconDecoration extends Decoration {
  final double iconSize;
  final double lineWidth;
  final bool firstData;
  final bool lastData;

  IconDecoration(
      {@required double iconSize,
      @required double lineWidth,
      @required bool firstData,
      @required bool lastData})
      : this.iconSize = iconSize,
        this.lineWidth = lineWidth,
        this.firstData = firstData,
        this.lastData = lastData;

  @override
  BoxPainter createBoxPainter([onChanged]) {
    return IconLine(
        iconSize: iconSize,
        lineWidth: lineWidth,
        firstData: firstData,
        lastData: lastData);
  }
}

class IconLine extends BoxPainter {
  final double iconSize;
  final bool firstData;
  final bool lastData;

  final Paint paintLine;

  IconLine(
      {@required double iconSize,
      @required double lineWidth,
      @required bool firstData,
      @required bool lastData})
      : this.iconSize = iconSize,
        this.firstData = firstData,
        this.lastData = lastData,
        paintLine = Paint()
          ..color = Colors.red
          ..strokeCap = StrokeCap.round
          ..strokeWidth = lineWidth
          ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final leftOffset = Offset((iconSize / 2) + 24, offset.dy);
    final double iconSpace = iconSize / 1.5;

    final Offset top = configuration.size.topLeft(Offset(leftOffset.dx, 0.0));
    final Offset centerTop = configuration.size
        .centerLeft(Offset(leftOffset.dx, leftOffset.dy - iconSpace));
    final Offset centerBottom = configuration.size
        .centerLeft(Offset(leftOffset.dx, leftOffset.dy + iconSpace));
    final Offset end =
        configuration.size.bottomLeft(Offset(leftOffset.dx, leftOffset.dy * 2));
    if (!firstData) canvas.drawLine(top, centerTop, paintLine);
    if (!lastData) canvas.drawLine(centerBottom, end, paintLine);
  }
}
