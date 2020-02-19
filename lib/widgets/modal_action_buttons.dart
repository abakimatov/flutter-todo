import 'package:flutter/material.dart';
import 'package:my_app/widgets/custom_button.dart';

class ModalActionButtons extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onSubmit;
  final String cancelText;
  final String submitText;

  ModalActionButtons(
      {@required this.onCancel,
      @required this.onSubmit,
      @required this.cancelText,
      @required this.submitText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CustomButton(
          onPressed: onCancel,
          buttonText: cancelText,
        ),
        CustomButton(
            onPressed: onSubmit,
            buttonText: submitText,
            color: Theme.of(context).accentColor,
            textColor: Colors.white)
      ],
    );
  }
}
