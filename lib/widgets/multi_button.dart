import 'package:flutter/material.dart';

import '../model/multi_button_action.dart';

class MultiButton extends StatelessWidget {
  const MultiButton({
    super.key,
    required this.actions,
    required this.activeButtonIndex,
    required this.onTap,
    this.backgroundColor,
    this.activeColor,
    this.textStyle,
    this.activeTextStyle,
  });

  final List<MultiButtonAction> actions;
  final int activeButtonIndex;
  final Function(int)
      onTap; // Setzt den neuen ButtonIndex im Parent Widget, sodass sich auch der activeButtonIndex in diesem Widget ändert und der Button gehighlightet wird
  final Color? backgroundColor;
  final Color? activeColor;
  final TextStyle? textStyle;
  final TextStyle? activeTextStyle;

  void _handleOnTap(MultiButtonAction action) {
    onTap(actions.indexOf(action));

    action.action();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        children: actions
            .map((action) => Expanded(
                  child: GestureDetector(
                    onTap: () => _handleOnTap(action),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: actions.indexOf(action) == activeButtonIndex
                            ? (activeColor ?? Colors.transparent)
                            : (backgroundColor ?? Colors.transparent),
                        border: Border(
                          left: actions.indexOf(action) == 0
                              ? const BorderSide(color: Colors.black, width: 2)
                              : BorderSide.none,
                          top: const BorderSide(color: Colors.black, width: 2),
                          right:
                              const BorderSide(color: Colors.black, width: 2),
                          bottom:
                              const BorderSide(color: Colors.black, width: 2),
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: actions.indexOf(action) == 0
                              ? const Radius.circular(100)
                              : Radius.zero,
                          bottomLeft: actions.indexOf(action) == 0
                              ? const Radius.circular(100)
                              : Radius.zero,
                          topRight:
                              actions.indexOf(action) == (actions.length - 1)
                                  ? const Radius.circular(100)
                                  : Radius.zero,
                          bottomRight:
                              actions.indexOf(action) == (actions.length - 1)
                                  ? const Radius.circular(100)
                                  : Radius.zero,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (actions.indexOf(action) == activeButtonIndex)
                            Icon(
                              Icons.check,
                              color:
                                  actions.indexOf(action) == activeButtonIndex
                                      ? activeTextStyle?.color
                                      : textStyle?.color,
                            ),
                          if (actions.indexOf(action) == activeButtonIndex)
                            const SizedBox(width: 4),
                          Text(
                            action.name,
                            style: actions.indexOf(action) == activeButtonIndex
                                ? activeTextStyle
                                : textStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
