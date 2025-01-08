import 'package:flutter/material.dart';

import 'button.dart';

class FilterSheet extends StatelessWidget {
  const FilterSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      color: Color(0xff2C2E31),
      child: Column(
        children: [
          SizedBox(height: 16),
          Row(
            children: [
              SizedBox(width: 16),
              Button(
                onPressed: () {
                  Navigator.pop(context);
                },
                minSize: 44,
                child: SizedBox(
                  width: 72,
                  child: Center(
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: Color(0xffF12E36),
                        fontSize: 16,
                        fontFamily: 'w600',
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Choose Positions',
                    style: TextStyle(
                      color: Color(0xffFFF6F6),
                      fontSize: 16,
                      fontFamily: 'w600',
                    ),
                  ),
                ),
              ),
              Button(
                onPressed: () {
                  Navigator.pop(context);
                },
                minSize: 44,
                child: SizedBox(
                  width: 72,
                  child: Center(
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Color(0xffF12E36),
                        fontSize: 16,
                        fontFamily: 'w600',
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
            ],
          ),
          SizedBox(height: 24),
          Container(
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Color(0xffF12E36),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Button(
              onPressed: () {},
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Text(
                    'All Positions',
                    style: TextStyle(
                      color: Color(0xffFFF6F6),
                      fontSize: 14,
                      fontFamily: 'w600',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
