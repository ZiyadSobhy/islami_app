import 'package:flutter/material.dart';

import '../../../../../widgets/card_radio.dart';

class RadioTabe extends StatelessWidget {
  const RadioTabe({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardRadio(label: 'Radio Ibrahim Al-Akdar'),
        CardRadio(label: 'Radio Al-Qaria Yassen'),
        CardRadio(label: 'Radio Ahmed Al-trabulsi'),
        CardRadio(label: 'Radio Addokali Mohammad Alalim'),


      ],
    );
  }
}
