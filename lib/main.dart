import 'package:flutter/material.dart';
import 'package:one_roof/screens/choose_role_screen.dart';
import 'package:one_roof/owner/property_detail_forms/pg_room_detail_form/group_room_details_screen.dart';
import 'package:one_roof/screens/onboarding_screen.dart';
import 'package:one_roof/owner/owner_dashboard_screen.dart';
import 'package:one_roof/owner/owner_dashboard_with_listings_screen.dart';
import 'package:one_roof/owner/property_detail_forms/pg_details_main_screen.dart';
import 'package:one_roof/owner/property_detail_forms/pg_room_detail_form/private_room_details_screen.dart';
import 'package:one_roof/owner/select_property_screen.dart';
import 'package:one_roof/owner/property_detail_forms/pg_room_detail_form/sharing_room_details_screen.dart';
import 'package:one_roof/screens/login_screen.dart';
import 'package:one_roof/screens/signup_screen.dart';
import 'package:one_roof/screens/splash_screen.dart';
import 'package:one_roof/owner/verification/document_verification.dart';
import 'package:one_roof/screens/welcome_screen.dart';
import 'package:one_roof/owner/verification/verify_yourself_screen.dart';
import 'package:one_roof/owner/verification/property_documents_screen.dart';
import 'package:one_roof/owner/property_detail_forms/hotel_room_details_screen.dart';
import 'package:one_roof/owner/property_detail_forms/guest_room_details_screen.dart';
import 'package:one_roof/owner/owner_dashboard_screen.dart';
import 'package:one_roof/owner/owner_dashboard_with_listings_screen.dart';
import 'package:one_roof/owner/select_property_screen.dart';
import 'package:one_roof/owner/verification/document_verification.dart';
import 'package:one_roof/owner/property_detail_forms/pg_details_main_screen.dart';
import 'package:one_roof/owner/property_detail_forms/pg_room_detail_form/sharing_room_details_screen.dart';
import 'package:one_roof/owner/property_detail_forms/pg_room_detail_form/group_room_details_screen.dart';
import 'package:one_roof/owner/property_detail_forms/pg_room_detail_form/private_room_details_screen.dart';
import 'package:one_roof/screens/otp_verification_screen.dart';
import 'package:one_roof/screens/forgot_password_screen.dart';
import 'package:one_roof/screens/reset_password_success_screen.dart';
import 'package:one_roof/user/home/user_home_screen.dart';
import 'package:one_roof/user/favorites/favorites_screen.dart';
import 'package:one_roof/user/bookings/booking_screen.dart';
import 'package:one_roof/user/home/tabs/pg_tab.dart';
import 'package:one_roof/user/home/tabs/hotel_tab.dart';
import 'package:one_roof/user/home/tabs/guest_tab.dart';
import 'package:one_roof/user/profile/profile_screen.dart';
import 'package:one_roof/user/profile/edit_profile_screen.dart';
import 'package:one_roof/user/maps/map_start_screen.dart';
import 'package:one_roof/user/chat/chat_page/chat_screen.dart';
import 'package:one_roof/user/chat/chat_list_page/chat_list_screen.dart';


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
        '/map': (context) => const MapStartScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/editProfile': (context) => const EditProfileScreen(),
        '/msg': (context) => const ChatScreen(),
        '/chatList': (context) => const ChatListScreen(),

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
