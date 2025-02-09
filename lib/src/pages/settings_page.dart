import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:squad_builder/src/blocs/formation/formation_bloc.dart';

import '../blocs/league/league_bloc.dart';
import '../blocs/navbar/navbar_bloc.dart';
import '../core/db.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/button.dart';
import '../widgets/dialog_widget.dart';
import 'leagues_page.dart';
import 'onboard_page.dart';
import 'privacy_page.dart';
import 'terms_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBarWidget(
          title: 'Settings',
          back: false,
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
            children: [
              _Card(
                child: Column(
                  children: [
                    SizedBox(height: 12),
                    _TitleCard(title: 'General'),
                    _Button(
                      title: 'Choose Leagues',
                      onPressed: () {
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
                    _Divider(),
                    _Button(
                      title: 'Notifications',
                      onPressed: () {},
                    ),
                    _Divider(),
                    _Button(
                      title: 'Privacy Policy',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return PrivacyPage();
                            },
                          ),
                        );
                      },
                    ),
                    _Divider(),
                    _Button(
                      title: 'Terms of use',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return TermsPage();
                            },
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 6),
                  ],
                ),
              ),
              SizedBox(height: 20),
              _Card(
                child: Column(
                  children: [
                    SizedBox(height: 12),
                    _TitleCard(title: 'Feedback'),
                    _Button(
                      title: 'Share this app',
                      onPressed: () {},
                    ),
                    _Divider(),
                    _Button(
                      title: 'Rate us',
                      onPressed: () {},
                    ),
                    _Divider(),
                    _Button(
                      title: 'Clear data',
                      color: Color(0xffD85007),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return DialogWidget(
                              title: 'Clear Data',
                              description:
                                  'Are you sure you want to clear all data? This action cannot be undone.',
                              buttonTitle: 'Clear',
                              onPressed: () async {
                                final prefs =
                                    await SharedPreferences.getInstance();
                                await prefs.clear();
                                await hiveClear();
                                if (context.mounted) {
                                  context.read<LeagueBloc>().add(ClearAll());
                                  context
                                      .read<FormationBloc>()
                                      .add(DeleteAllFormations());
                                  context
                                      .read<NavbarBloc>()
                                      .add(ChangePage(index: 1));
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return OnboardPage();
                                      },
                                    ),
                                    (route) => false,
                                  );
                                }
                              },
                            );
                          },
                        );
                      },
                    ),
                    SizedBox(height: 6),
                  ],
                ),
              ),
              const SizedBox(height: 130),
            ],
          ),
        ),
      ],
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff2C2E31),
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}

class _TitleCard extends StatelessWidget {
  const _TitleCard({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Color(0xff191919),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SizedBox(width: 12),
          Text(
            title,
            style: TextStyle(
              color: Color(0xffFFF6F6),
              fontSize: 16,
              fontFamily: 'w600',
            ),
          ),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.title,
    this.color = const Color(0xffFFF6F6),
    required this.onPressed,
  });

  final String title;
  final Color color;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      margin: EdgeInsets.symmetric(horizontal: 12),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Button(
        onPressed: onPressed,
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                color: color,
                fontSize: 14,
                fontFamily: 'w400',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      margin: EdgeInsets.symmetric(horizontal: 12),
      color: Colors.white.withValues(alpha: 0.03),
    );
  }
}
