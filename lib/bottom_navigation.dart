import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.black, // Solid black at the bottom
            Colors.transparent, // Transparent at the top
          ],
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent, // Make the navigation bar background transparent
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(icon: SvgPicture.asset(
    'assets/icons/home.svg',
    width: 20.0,  // Adjust the size as needed
    height: 20.0,
  ),label: ""),BottomNavigationBarItem(
  icon: SvgPicture.asset(
    'assets/icons/cal.svg',
    width: 20.0,  // Adjust the size as needed
    height: 20.0,
  ),
  label: '',
),

          BottomNavigationBarItem(
            icon: Stack(
              alignment: Alignment.center,
              children: [
                // Background image
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://s3-alpha-sig.figma.com/img/fd0c/4a95/5450c1607e3040fa48bb056ae1709083?Expires=1724630400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=dnSHc9woiNNab--Mp4~xcwvCJ9rLn~yn8Y7zrkabbd4tnmkZ0h-dwgFa8lyTTVAsvrlidaZUP759NMkHi6WqLz9MOJfi13Y7iOafoNBJtUExqR1UwNUbgHGaHIuYpTcFDulf4OMGuUV0BqO858ogdyX6teUSGuMgc5TPltwqawDbi77E1GWFjfSwveQts2lFIW0CZ~Tu3EuzYUQ680j7kp-iclcEZe1yZP5HHUuzQDlfeWwc2ZIdfiwSJR6o7hhZk0Hie1vjPQXEJnOU7raRvn53PBRNFZ5vVjG6jnMugmTqMF-IQKR51SYKDFF2H-lVHIcdNBuy9SWbov691iM7ww__'), // Replace with your image URL or AssetImage if local
                  radius: 32, // Adjust size accordingly
                ),
                // Icon on top
                 SvgPicture.asset(
    'assets/icons/Union.svg',
    width: 18.0,  // Adjust the size as needed
    height: 24.0,
  ),  ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(  icon: SvgPicture.asset(
    'assets/icons/msg.svg',
    width: 20.0,  // Adjust the size as needed
    height: 20.0,
  ),label: ""),
          BottomNavigationBarItem(  icon: SvgPicture.asset(
    'assets/icons/tabletennis.svg',
    width: 20.0,  // Adjust the size as needed
    height: 20.0,
  ),label: ""),
        ],
      ),
    );
  }
}
