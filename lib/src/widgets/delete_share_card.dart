import 'package:flutter/material.dart';

import 'button.dart';
import 'dialog_widget.dart';
import 'svg_widget.dart';

class DeleteShareCard extends StatelessWidget {
  const DeleteShareCard({
    super.key,
    required this.onDelete,
    required this.onShare,
  });

  final void Function() onDelete;
  final void Function() onShare;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 118,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Color(0xffF12E36),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Button(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return DialogWidget(
                      title: 'Delete formation',
                      description:
                          'Are you sure you want to delete this formation?',
                      buttonTitle: 'Delete',
                      onPressed: onDelete,
                    );
                  },
                );
              },
              minSize: 52,
              child: SvgWidget('assets/delete.svg'),
            ),
          ),
          Expanded(
            child: Button(
              onPressed: onShare,
              minSize: 52,
              child: SvgWidget('assets/share.svg'),
            ),
          ),
        ],
      ),
    );
  }
}
