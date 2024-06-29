import 'package:flutter/material.dart';

class SideBar extends StatefulWidget {
  const SideBar({
    Key? key,
    required this.width,
    required this.height,
    required this.navigator,
    required this.onHide,
  }) : super(key: key);

  final double width;
  final double height;
  final GlobalKey<NavigatorState> navigator;
  final VoidCallback onHide;

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  List<Map> menu = [
    {'title': 'Wisata', 'routeName': '/activities'},
    {'title': 'Hotel', 'routeName': '/hotels'},
    {'title': 'Restoran', 'routeName': '/restaurants'},
    {'title': 'Planning', 'routeName': '/planning'},
  ];

  int sideBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width * 0.13,
      color: Color.fromARGB(255, 16, 138, 204),
      child: Column(
        children: [
          SizedBox(height: widget.height * 0.05),
          ListView.builder(
            shrinkWrap: true,
            itemCount: menu.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return RotatedBox(
                quarterTurns: 3,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      sideBarIndex = index;
                    });
                    widget.navigator.currentState!.pushNamed(
                      menu[index]['routeName'],
                    );
                  },
                  style: TextButton.styleFrom(
                    minimumSize: const Size(100, 50),
                  ),
                  child: Text(
                    menu[index]['title'],
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: (index == sideBarIndex)
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: (index == sideBarIndex)
                              ? Colors.white
                              : Colors.white.withAlpha(200),
                          letterSpacing: 2,
                        ),
                  ),
                ),
              );
            },
          ),
          const Spacer(),
          IconButton(
            onPressed: widget.onHide,
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            tooltip: 'Hide Sidebar',
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class RootSideBar {
  static State<SideBar>? of(BuildContext context) {
    final sideBarState = context.findAncestorStateOfType<State<SideBar>>();
    return sideBarState;
  }
}
