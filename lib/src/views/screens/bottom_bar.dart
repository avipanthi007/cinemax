import 'package:cinemax/core/theme/colors.dart';
import 'package:cinemax/src/controllers/now_playing_controller.dart';
import 'package:cinemax/src/controllers/popular_movies_controller.dart';
import 'package:cinemax/src/controllers/upcoming_movies_controller.dart';
import 'package:cinemax/src/views/screens/home/downloads.dart';
import 'package:cinemax/src/views/screens/home/home_page.dart';
import 'package:cinemax/src/views/screens/home/profile.dart';
import 'package:cinemax/src/views/screens/home/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  final popularMovies = Get.find<PopularMoviesController>();
  final upcomingMovies = Get.find<UpcomingMoviesController>();
  final nowPlayingController = Get.find<NowPlayingController>();

  final List _screens = [HomeScreen(), Search(), Downloads(), Profile()];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    popularMovies.fetchPopularMovies();
    upcomingMovies.fetchUpcomingMovies();
     nowPlayingController.fetchNowPlayingMovies();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(icon: Icons.home, label: 'Home', index: 0),
            _buildNavItem(icon: Icons.search, label: 'Search', index: 1),
            _buildNavItem(icon: Icons.download, label: 'Downloads', index: 2),
            _buildNavItem(icon: Icons.person, label: 'Profile', index: 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
      {required IconData icon, required String label, required int index}) {
    final bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: isSelected ? AppColors.softColor : Colors.transparent,
            borderRadius: BorderRadius.circular(25)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.primaryColor : Colors.grey,
            ),
            const SizedBox(width: 5),
            if (isSelected)
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? AppColors.primaryColor : Colors.grey,
                  fontSize: 12,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
