import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gtk_flutter/app_state.dart';

class IntInputDialog extends StatefulWidget {
  final Function(int numAttending, bool state) onSelection; //callback function

  const IntInputDialog({super.key, required this.onSelection});

  @override
  State<StatefulWidget> createState() {
    return IntInputDialogState();
  }
}

class IntInputDialogState extends State<IntInputDialog> {
  String inputString = "";
  int numAttendees = 0;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Enter Number"),
      content: Center(
          child: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: "Enter number of attendees"),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            onChanged: (input) {
              setState(() {
                inputString = input;
                print("This is the input: $inputString");
                numAttendees = int.parse(inputString);
              });
            },
            controller: controller, //idk what this does
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  print("This is the numAttendees: $numAttendees");
                  widget.onSelection(numAttendees, true);
                });
                Navigator.pop(context);
              },
              child: Text("ENTER"))
        ],
      )),
    );
  }
}
