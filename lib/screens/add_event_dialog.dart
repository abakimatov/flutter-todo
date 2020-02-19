import 'package:flutter/material.dart';
import 'package:my_app/widgets/custom_date_time_picker.dart';
import 'package:my_app/widgets/modal_action_buttons.dart';
import 'package:my_app/widgets/custom_textfield.dart';

class AddEventDialog extends StatefulWidget {
  @override
  _AddEventDialogState createState() => _AddEventDialogState();
}

class _AddEventDialogState extends State<AddEventDialog> {
  String _selectedDate = 'Pick date';
  String _selectedTime = 'Pick time';

  Future _pickDate() async {
    DateTime datePick = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime.now().add(Duration(days: -365)),
        lastDate: new DateTime.now().add(Duration(days: 365)));

    if (datePick != null)
      setState(() {
        _selectedDate = datePick.toString();
      });
  }

  Future _pickTime() async {
    TimeOfDay timePick = await showTimePicker(
        context: context, initialTime: new TimeOfDay.now());

    if (timePick != null)
      setState(() {
        _selectedTime = timePick.toString();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Center(
              child: Text("Add new event",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
          SizedBox(
            height: 24,
          ),
          CustomTextField(labelText: "Enter event name"),
          SizedBox(
            height: 24,
          ),
          CustomTextField(labelText: "Enter description"),
          SizedBox(
            height: 24,
          ),
          CustomDateTimePicker(
              onPressed: _pickDate,
              icon: Icons.date_range,
              value: _selectedDate),
          CustomDateTimePicker(
              onPressed: _pickTime,
              icon: Icons.access_time,
              value: _selectedTime),
          SizedBox(
            height: 24,
          ),
          ModalActionButtons(
            onCancel: () {
              Navigator.of(context).pop();
            },
            onSubmit: () {},
            cancelText: 'Cancel',
            submitText: 'Save',
          )
        ]));
  }
}
