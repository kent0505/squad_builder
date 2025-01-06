import 'package:flutter/material.dart';

import '../pages/search_page.dart';
import 'button.dart';
import 'svg_widget.dart';

class FilterCard extends StatelessWidget {
  const FilterCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 118,
      decoration: BoxDecoration(
        color: Color(0xffF12E36),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Button(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SearchPage();
                    },
                  ),
                );
              },
              minSize: 52,
              child: SvgWidget('assets/search.svg'),
            ),
          ),
          Expanded(
            child: Button(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
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
                        ],
                      ),
                    );
                  },
                );
              },
              minSize: 52,
              child: SvgWidget('assets/filter.svg'),
            ),
          ),
        ],
      ),
    );
  }
}
