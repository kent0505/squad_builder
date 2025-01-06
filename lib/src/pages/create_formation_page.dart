import 'package:flutter/material.dart';

import '../widgets/app_bar_widget.dart';
import '../widgets/button.dart';
import '../widgets/main_button.dart';
import '../widgets/svg_widget.dart';

class CreateFormationPage extends StatefulWidget {
  const CreateFormationPage({super.key});

  @override
  State<CreateFormationPage> createState() => _CreateFormationPageState();
}

class _CreateFormationPageState extends State<CreateFormationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              AppBarWidget(
                title: 'Create New',
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
