import 'package:flutter/material.dart';

import '../models/case_model.dart';


class MapButton extends StatelessWidget {
  final CaseModel cell;
  final VoidCallback onClick;
  final VoidCallback onLongPress;

  const MapButton({required this.cell, required this.onClick, required this.onLongPress, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      onLongPress: onLongPress,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: cell.hidden
            ? cell.hasFlag
            ? Icon(Icons.flag, color: Colors.red)
            : Container()
            : cell.hasBomb
            ? Icon(Icons.dangerous, color: cell.hasExploded ? Colors.red : Colors.black)
            : Text(cell.number?.toString() ?? ''),
      ),
    );
  }
}