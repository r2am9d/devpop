import 'package:devpop/core/widgets/bottom_navbar/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            currentIndex: bnIndex.index,
            onTap: (i) => bnBloc.add(BottomNavbarSetIndex(index: i)),
            items: [
              SalomonBottomBarItem(
                icon: const Icon(Icons.home_outlined),
                title: const Text('Home'),
                selectedColor: Colors.purple,
                activeIcon: const Icon(Icons.home),
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.search),
                title: const Text('Search'),
                selectedColor: Colors.purple,
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.favorite_border),
                title: const Text('Saved'),
                selectedColor: Colors.purple,
                activeIcon: const Icon(Icons.favorite),
              ),
            ],
          ),
        );
      },
    );
  }
}
