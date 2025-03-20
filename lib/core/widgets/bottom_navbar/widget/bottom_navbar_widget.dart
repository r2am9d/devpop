import 'package:devpop/core/utils/utils.dart';
import 'package:devpop/core/widgets/bottom_navbar/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavbarWidget extends StatelessWidget {
  const BottomNavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bnBloc = context.read<BottomNavbarBloc>();

    return BlocBuilder<BottomNavbarBloc, BottomNavbarState>(
      buildWhen: (previous, current) => current is BottomNavbarIndex,
      builder: (ctx, s) {
        final bnIndex = bnBloc.states<BottomNavbarIndex>()!;

        return Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.purple.shade100,
              ),
            ),
          ),
          child: SalomonBottomBar(
            key: AppKeys.bottomNavbarWidget.bottomNavbar,
            currentIndex: bnIndex.index,
            onTap: (i) => bnBloc.add(BottomNavbarSetIndex(index: i)),
            items: [
              SalomonBottomBarItem(
                icon: const FaIcon(FontAwesomeIcons.sharpLightHouse),
                title: const Text('Home'),
                selectedColor: Colors.purple,
                activeIcon: const FaIcon(FontAwesomeIcons.sharpSolidHouse),
              ),
              SalomonBottomBarItem(
                icon: const FaIcon(FontAwesomeIcons.sharpLightMagnifyingGlass),
                title: const Text('Search'),
                selectedColor: Colors.purple,
                activeIcon:
                    const FaIcon(FontAwesomeIcons.sharpSolidMagnifyingGlass),
              ),
              SalomonBottomBarItem(
                icon: const FaIcon(FontAwesomeIcons.sharpLightHeart),
                title: const Text('Saved'),
                selectedColor: Colors.purple,
                activeIcon: const FaIcon(FontAwesomeIcons.sharpSolidHeart),
              ),
            ],
          ),
        );
      },
    );
  }
}
