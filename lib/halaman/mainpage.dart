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
  bool _isSideBarOpen = true;

  @override
  void initState() {
    super.initState();
    _isOnboarding = false;
  }

  void _toggleSidebar() {
    setState(() {
      _isSideBarOpen = !_isSideBarOpen;
    });
  }

  void _handleBackButton() {
    // Panggil Navigator.pop untuk kembali satu halaman
    Navigator.pop(context);
  }

  void _handleSlideRight() {
    // Menampilkan sidebar ketika geser ke kanan
    if (!_isSideBarOpen) {
      _toggleSidebar();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Mencegah aplikasi keluar saat tombol kembali ditekan
        if (!_isSideBarOpen) {
          _toggleSidebar();
          return false;
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF5EDDC),
        body: _isOnboarding
            ? _buildOnboarding(context)
            : GestureDetector(
                onHorizontalDragEnd: (details) {
                  // Memproses gestur slide ke kanan untuk menampilkan sidebar
                  if (details.primaryVelocity! > 0) {
                    _handleSlideRight();
                  }
                },
                child: Row(
                  children: [
                    if (_isSideBarOpen)
                      SideBar(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        navigator: _navigatorKey,
                        onHide: _toggleSidebar,
                      ),
                    Expanded(
                      child: Navigator(
                        key: _navigatorKey,
                        initialRoute: ActivitiesScreen.routeName,
                        onGenerateRoute: (settings) {
                          switch (settings.name) {
                            case ActivitiesScreen.routeName:
                              return MaterialPageRoute(
                                builder: (context) => const ActivitiesScreen(),
                              );
                            case HotelScreen.routeName:
                              return MaterialPageRoute(
                                builder: (context) => const HotelScreen(),
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
                  ],
                ),
              ),
      ),
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
}
