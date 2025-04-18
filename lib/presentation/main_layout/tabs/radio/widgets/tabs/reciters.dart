import 'package:flutter/material.dart';

import '../../../../../widgets/card_radio.dart';

class Reciters extends StatelessWidget {
  const Reciters({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardRadio(label: 'Ibrahim Al-Akdar',),
        CardRadio(label: 'Al-Qaria Yassen',),
        CardRadio(label: 'Ahmed Al-trabulsi',),
        CardRadio(label: 'Addokali Mohammad Alalim',),

      ],
    );
  }
}
