import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/navbar/navbar_bloc.dart';
import 'button.dart';
import 'svg_widget.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 74,
        margin: EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 40),
        decoration: BoxDecoration(
          color: Color(0xff191919),
          borderRadius: BorderRadius.circular(12),
        ),
        child: BlocBuilder<NavbarBloc, NavbarState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _NavBarButton(
                  id: 1,
                  title: 'All Players',
                  active: state is NavbarInitial,
                ),
                _NavBarButton(
                  id: 2,
                  title: 'Formations',
                  active: state is NavbarFormations,
                ),
                _NavBarButton(
                  id: 3,
                  title: 'Settings',
                  active: state is NavbarSettings,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _NavBarButton extends StatelessWidget {
  const _NavBarButton({
    required this.id,
    required this.title,
    required this.active,
  });

  final int id;
  final String title;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: active
          ? null
          : () {
              context.read<NavbarBloc>().add(ChangePage(index: id));
            },
      padding: 0,
      child: SizedBox(
        width: 90,
        child: Column(
          children: [
            const SizedBox(height: 16),
            SvgWidget(
              'assets/tab$id.svg',
              color: active ? Color(0xffF12E36) : Color(0xffE6E6E6),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                color: active ? Color(0xffF12E36) : Color(0xff5B5858),
                fontSize: 12,
                fontFamily: 'w600',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
