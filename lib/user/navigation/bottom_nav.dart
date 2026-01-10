// import 'package:flutter/material.dart';
//
// class UserBottomNav extends StatefulWidget {
//   final int currentIndex;
//   final Function(int) onTap;
//
//   const UserBottomNav({
//     super.key,
//     required this.currentIndex,
//     required this.onTap,
//   });
//
//   @override
//   State<UserBottomNav> createState() => _UserBottomNavState();
// }
//
// class _UserBottomNavState extends State<UserBottomNav> {
//   final Color activeColor = const Color(0xFFFF6B6B);
//   final Color inactiveColor = Colors.grey;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 70,
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 8,
//           )
//         ],
//       ),
//       child: BottomNavigationBar(
//         currentIndex: widget.currentIndex,
//         onTap: widget.onTap,
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         selectedItemColor: activeColor,
//         unselectedItemColor: inactiveColor,
//         selectedFontSize: 12,
//         unselectedFontSize: 12,
//         showUnselectedLabels: true,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_outlined),
//             activeIcon: Icon(Icons.home),
//             label: "Home",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.map_outlined),
//             activeIcon: Icon(Icons.map),
//             label: "Map",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite_border),
//             activeIcon: Icon(Icons.favorite),
//             label: "Favourite",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.receipt_long_outlined),
//             activeIcon: Icon(Icons.receipt_long),
//             label: "My Booking",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person_outline),
//             activeIcon: Icon(Icons.person),
//             label: "Profile",
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: const Color(0xFFFF6B6B),
      unselectedItemColor: Colors.grey,
      items:  [
        BottomNavigationBarItem(icon: InkWell(child: Icon(Icons.home), onTap: (){Navigator.pushReplacementNamed(context, '/home');},),
            label: "Home"),
        BottomNavigationBarItem(icon: InkWell(child: Icon(Icons.map), onTap: (){Navigator.pushReplacementNamed(context, '/map');},),
            label: "Map"),
        BottomNavigationBarItem(icon: InkWell(child: Icon(Icons.favorite_border), onTap: (){Navigator.pushReplacementNamed(context, '/fav');},),
            label: "Favourite"),
        BottomNavigationBarItem(icon: InkWell(child: Icon(Icons.receipt_long), onTap: (){Navigator.pushReplacementNamed(context, '/book');},),
            label: "My Booking"),
        BottomNavigationBarItem(icon: InkWell(child: Icon(Icons.person_outline), onTap: (){Navigator.pushReplacementNamed(context, '/profile');},),
            label: "Profile"),
      ],
    );
  }
}
