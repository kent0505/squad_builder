import 'package:flutter/material.dart';
import 'package:squad_builder/src/widgets/filter_sheet.dart';

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
                    return FilterSheet();
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
