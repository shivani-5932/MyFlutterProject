import 'package:flutter/material.dart';
import 'package:one_roof/screens/choose_role_screen.dart';
import 'package:one_roof/screens/group_room_details_screen.dart';
import 'package:one_roof/screens/onboarding_screen.dart';
import 'package:one_roof/screens/owner_dashboard_screen.dart';
import 'package:one_roof/screens/owner_dashboard_with_listings_screen.dart';
import 'package:one_roof/screens/pg_details_main_screen.dart';
import 'package:one_roof/screens/private_room_details_screen.dart';
import 'package:one_roof/screens/select_property_screen.dart';
import 'package:one_roof/screens/sharing_room_details_screen.dart';
import 'package:one_roof/screens/login_screen.dart';
import 'package:one_roof/screens/signup_screen.dart';
import 'package:one_roof/screens/splash_screen.dart';
import 'package:one_roof/screens/document_verification.dart';
import 'package:one_roof/screens/welcome_screen.dart';
import 'package:one_roof/screens/verify_yourself_screen.dart';
import 'package:one_roof/screens/property_documents_screen.dart';
import 'package:one_roof/screens/hotel_room_details_screen.dart';
import 'package:one_roof/screens/guest_room_details_screen.dart';
import 'package:one_roof/screens/owner_dashboard_screen.dart';
import 'package:one_roof/screens/owner_dashboard_with_listings_screen.dart';
import 'package:one_roof/screens/select_property_screen.dart';
import 'package:one_roof/screens/document_verification.dart';
import 'package:one_roof/screens/pg_details_main_screen.dart';
import 'package:one_roof/screens/sharing_room_details_screen.dart';
import 'package:one_roof/screens/group_room_details_screen.dart';
import 'package:one_roof/screens/private_room_details_screen.dart';
import 'package:one_roof/screens/otp_verification_screen.dart';
import 'package:one_roof/screens/forgot_password_screen.dart';
import 'package:one_roof/screens/reset_password_success_screen.dart';
import 'package:one_roof/user/home/user_home_screen.dart';
import 'package:one_roof/user/favorites/favorites_screen.dart';
import 'package:one_roof/user/bookings/booking_screen.dart';
import 'package:one_roof/user/home/tabs/pg_tab.dart';
import 'package:one_roof/user/home/tabs/hotel_tab.dart';
import 'package:one_roof/user/home/tabs/guest_tab.dart';


// import 'splash_screen.dart';
// import 'onboarding_screen.dart';
// import 'welcome_screen.dart';
// import 'signup_screen.dart';
// import 'login_screen.dart';
// import 'choose_role_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/onboarding': (context) => OnboardingScreen(),
        '/welcome': (context) => WelcomeScreen(),
        '/signup': (context) => SignUpScreen(),
        '/login': (context) => LoginScreen(),
        '/otp': (context) => OtpVerificationScreen(),
        '/forgotPassword': (context) => ForgotPasswordScreen(),
        '/resetPassword': (context) => ResetPasswordSuccessScreen(),
        '/choose_role': (context) => ChooseRoleScreen(),
        '/ownerDashboard': (context) => const OwnerDashboardScreen(),
        '/listingsDashboard': (context) => const OwnerDashboardWithListings(),
        '/selectProperty': (context) => const SelectPropertyScreen(),
        '/verification': (context) => const DocumentVerification(),
        /// PG MAIN SCREEN
        '/pgDetails': (context) => const PgDetailsMainScreen(),
        '/guestDetails': (context) => const GuestRoomDetailsScreen(),
        '/hotelDetails': (context) => const HotelRoomDetailsScreen(),
        '/home': (context) => const UserHomeScreen(),
        '/fav': (context) => const FavouritesScreen(),
        '/book': (context) => const BookingScreen(),

        /// ROOM DETAILS
        '/sharingRoom': (context) => const SharingRoomScreen(),
        '/groupRoom': (context) => const GroupRoomScreen(),
        '/privateRoom': (context) => const PrivateRoomScreen(),

        /// VERIFICATION
        '/verifyYourself': (context) => const VerifyYourselfScreen(),
        '/propertyDocuments': (context) => const PropertyDocumentsScreen(),


      },
    );
  }
}
