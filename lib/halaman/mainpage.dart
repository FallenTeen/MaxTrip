import 'package:flutter/material.dart';
import 'package:maxtrip/screens/hotels_screen.dart';
import 'package:maxtrip/screens/activities_screen.dart';
import 'package:maxtrip/screens/restoran_screen.dart';
import 'package:maxtrip/widgets/side_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  bool _isOnboarding = false;
  bool _isSidebarVisible = true;

  @override
  void initState() {
    super.initState();
    // Setel _isOnboarding ke false saat inisialisasi
    _isOnboarding = false;
  }

  void _toggleSidebar() {
    setState(() {
      _isSidebarVisible = !_isSidebarVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5EDDC),
      body: _isOnboarding
          ? _buildOnboarding(context)
          : _buildMainContent(context),
    );
  }

  Container _buildOnboarding(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background-2.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.45,
          bottom: MediaQuery.of(context).size.height * 0.1,
          left: 30,
          right: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hidden Treasures of Banyumas',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: 65,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isOnboarding = false;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                padding: EdgeInsets.zero,
                elevation: 0,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.arrow_circle_right_outlined,
                    size: 50,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Explore Now',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Row(
      children: [
        if (_isSidebarVisible)
          SideBar(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            navigator: _navigatorKey,
            onHide: _toggleSidebar,
          ),
        Expanded(
          child: GestureDetector(
            onHorizontalDragUpdate: (details) {
              if (details.primaryDelta! > 10) {
                _toggleSidebar();
              }
            },
            child: Navigator(
              key: _navigatorKey,
              initialRoute: ActivitiesScreen.routeName,
              onGenerateRoute: (settings) {
                switch (settings.name) {
                  case ActivitiesScreen.routeName:
                    return MaterialPageRoute(
                      builder: (context) => const ActivitiesScreen(),
                    );
                  case HotelsScreen.routeName:
                    return MaterialPageRoute(
                      builder: (context) => const HotelsScreen(),
                    );
                  case RestaurantsScreen.routeName:
                    return MaterialPageRoute(
                      builder: (context) => const RestaurantsScreen(),
                    );
                  default:
                    return MaterialPageRoute(
                      builder: (context) => const ActivitiesScreen(),
                    );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
