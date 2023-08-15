import 'package:flutter/material.dart';

class FBBody extends StatefulWidget {
  const FBBody({super.key});

  @override
  State<FBBody> createState() => _FBBodyState();
}

class _FBBodyState extends State<FBBody> {
  int cardValue = 0;
  int acceptedCardValue = 0;
  bool willAccept = false;

  @override
  void initState() {
    super.initState();

    cardValue = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Draggable<int>(
              data: cardValue,
              feedback: const Placeholder(),
              //  Card(
              //   child: Container(
              //     decoration: BoxDecoration(
              //       border: Border.all(width: 3, color: Colors.red),
              //     ),
              //     height: 50,
              //     width: 40,
              //     child: Column(
              //       children: [
              //         Text(
              //           cardValue.toString(),
              //           style: const TextStyle(color: Colors.black, fontSize: 30),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              childWhenDragging: const SizedBox(
                width: 46,
              ),
              child: Card(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.black),
                  ),
                  height: 50,
                  width: 40,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Column(
                      children: [
                        Text(
                          cardValue.toString(),
                          style: const TextStyle(color: Colors.black, fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 60,
              width: 60,
            ),
            DragTarget(
              onAccept: (data) {
                setState(() {
                  acceptedCardValue = cardValue;
                  cardValue++;
                  willAccept = false;
                });
              },
              onWillAccept: (data) {
                setState(() {
                  willAccept = true;
                });
                return willAccept;
              },
              builder: (context, candidateData, rejectedData) {
                return Card(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 3, color: willAccept ? Colors.green : Colors.red),
                    ),
                    height: 50,
                    width: 40,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Column(
                        children: [
                          Text(
                            acceptedCardValue.toString(),
                            style: const TextStyle(color: Colors.black, fontSize: 30),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
