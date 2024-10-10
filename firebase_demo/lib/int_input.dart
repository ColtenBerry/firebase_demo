import 'package:flutter/material.dart';
import 'package:gtk_flutter/int_input_dialog.dart';

import 'app_state.dart';
import 'src/widgets.dart';

class IntInput extends StatelessWidget {
  const IntInput({super.key, required this.onSelection});
  final bool state = false;
  final void Function(int numAttending) onSelection;

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case true: //have a cancel button.
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              // FilledButton(
              //   onPressed: () => onSelection(Attending.yes),
              //   child: const Text('YES'),
              // ),
              const SizedBox(width: 8),
              TextButton(
                onPressed: () => onSelection(0),
                child: const Text('CANCEL RSVP'),
              ),
            ],
          ),
        );
      case false: //have a rsvp button
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return IntInputDialog(onSelection: onSelection);
                      });
                },
                child: const Text('RSVP NOW'),
              ),
              // const SizedBox(width: 8),
              // FilledButton(
              //   onPressed: () => onSelection(Attending.no),
              //   child: const Text('NO'),
              // ),
            ],
          ),
        );
      default: // have a rsvp button
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return IntInputDialog(
                          onSelection: onSelection,
                        );
                      });
                },
                child: const Text('RSVP NOW'),
              ),
              const SizedBox(width: 8),
            ],
          ),
        );
    }
  }
}
