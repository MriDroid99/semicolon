import 'package:flutter/material.dart';

class DataWidget extends StatelessWidget {
  final String label;
  final int value;
  final Function add;
  final Function minus;
  const DataWidget({
    required this.label,
    required this.value,
    required this.add,
    required this.minus,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff1d1e33),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$label',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '$value',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {
                  minus();
                },
                child: Icon(Icons.remove),
                mini: true,
              ),
              FloatingActionButton(
                onPressed: () {
                  add();
                },
                child: Icon(Icons.add),
                mini: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
