import 'dart:ffi';

import 'package:flutter/material.dart';

class WDataPicer {
  final BuildContext context;

  WDataPicer({required this.context});

  showDataPicer() {
    String values = "";
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    ).then((value) =>
        values = value as String
    );
    return values;

  }}
