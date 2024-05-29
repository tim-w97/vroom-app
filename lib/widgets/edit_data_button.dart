import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class EditDataButton extends StatefulWidget {
  const EditDataButton({
    super.key,
    required this.isEditing,
    required this.onTap,
  });

  final bool isEditing;
  final Function onTap;

  @override
  State<EditDataButton> createState() => _EditDataButton();
}

class _EditDataButton extends State<EditDataButton> {
  TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();

  @override
  void initState() {
    _tapGestureRecognizer.onTap = () {
      // onTap hier schaut, ob der Button gedrückt wird

      // onTap hier ist die tatsächliche Funktion welche den State von isEditing ändert
      widget.onTap();
    };

    //zum Sachen zuweisen nur einmal, build wäre immer wenn Sachen aktualisiert werden
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isEditing
        ? RichText(
            text: TextSpan(
              text: "done",
              style: TextStyle(color: Colors.blueAccent),
              recognizer: _tapGestureRecognizer,
            ),
          )
        : GestureDetector(
            onTap: () => widget.onTap(),
            child: const Icon(Icons.edit),
          );
  }
}
