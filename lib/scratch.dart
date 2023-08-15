import 'package:flutter/material.dart';

class Scratch extends StatelessWidget {
  const Scratch({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Draggable<int>(
          data: cardValue,
          feedback: const Placeholder(),
          child: const Placeholder(),
        ),
        DragTarget(
          builder: (context, candidateData, rejectedData) {},
        )
      ],
    );
  }
}
