import 'package:flutter/material.dart';

import '../widgets/main_button.dart';
import '../widgets/svg_widget.dart';
import 'leagues_page.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Color(0xffF12E36)),
          SvgWidget(
            'assets/field.svg',
            width: MediaQuery.of(context).size.width,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 460,
              decoration: BoxDecoration(
                color: Color(0xff222427),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                    child: Text(
                      'Welcome to Soccer Squad Builder!',
                      style: TextStyle(
                        color: Color(0xffFFF6F6),
                        fontSize: 32,
                        fontFamily: 'w700',
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                    child: Text(
                      'Discover detailed player information and create your ultimate soccer formation. Dive in and bring your strategy to life!',
                      style: TextStyle(
                        color: Color(0xffFFF6F6),
                        fontSize: 14,
                        fontFamily: 'w400',
                      ),
                    ),
                  ),
                  Spacer(),
                  MainButton(
                    title: 'Let’s Start',
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LeaguesPage();
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 140),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
