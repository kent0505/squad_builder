import 'package:flutter/material.dart';

import '../models/formation.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/button.dart';
import '../widgets/main_button.dart';
import '../widgets/svg_widget.dart';

class EditFormationPage extends StatefulWidget {
  const EditFormationPage({super.key, required this.formation});

  final Formation formation;

  @override
  State<EditFormationPage> createState() => _EditFormationPageState();
}

class _EditFormationPageState extends State<EditFormationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              AppBarWidget(
                title: widget.formation.title,
                children: [
                  MainButton(
                    title: 'Save',
                    width: 126,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              Expanded(
                child: SvgWidget(
                  'assets/field2.svg',
                  width: MediaQuery.of(context).size.width - 32,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 46),
            ],
          ),
          Positioned(
            right: 24,
            bottom: 60,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffF12E36),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Button(
                onPressed: () {},
                minSize: 52,
                child: SvgWidget('assets/formations.svg'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
