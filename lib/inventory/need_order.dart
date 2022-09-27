import 'package:flutter/cupertino.dart';

import '../widget/labour_card.dart';

class Need_order extends StatelessWidget {
  const Need_order({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Labourcard(
          name: 'Labour Name',
          description: 'Jobsheet Title',
          widgetintended: SizedBox(
            width: 2,
          ),
        ),
        Labourcard(
          name: 'Labour Name',
          description: 'Jobsheet Title',
          widgetintended: SizedBox(
            width: 2,
          ),
        )
      ],
    );
  }
}