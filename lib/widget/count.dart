import 'package:flutter/material.dart';
import 'package:food_delivery/config/config.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 1;
  bool istrue = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      height: 25,
      width: 120,
      child: OutlinedButton(
        onPressed: () {},
        child: istrue == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  InkWell(
                    onTap: () {
                      if (count == 1) {
                        setState(() {
                          istrue = false;
                        });
                      } else {
                        setState(() {
                          count--;
                        });
                      }
                    },
                    child: Icon(
                      Icons.remove,
                      color: Colors.amber,
                      size: 17,
                    ),
                  ),
                  Text(
                    '$count',
                    style: TextStyle(fontSize: 10, color: Colors.amber),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        count++;
                      });
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.amber,
                      size: 17,
                    ),
                  ),
                ],
              )
            : Center(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      istrue = true;
                    });
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(color: primaryColor),
                  ),
                ),
              ),
      ),
    );
  }
}
