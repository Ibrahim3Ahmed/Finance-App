import 'package:go_router/go_router.dart';
import 'package:new_learn/core/routing/app_routes.dart';
import 'package:new_learn/features/auth/CreateNewPasswordScreen.dart';
import 'package:new_learn/features/auth/forget_password_screen.dart';
import 'package:new_learn/features/auth/otp_verification_screen.dart';
import 'package:new_learn/features/auth/login_screen.dart' as login;
import 'package:new_learn/features/auth/register_screen.dart' as register;
import 'package:new_learn/features/on_boarding_screen/on_boarding_screen.dart';
import 'package:new_learn/features/home/presentation/screens/home_screen.dart';

class RouterGenerationConfig {
  static final GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.onBoardingScreen,
    routes: [
      GoRoute(
        path: AppRoutes.onBoardingScreen,
        name: AppRoutes.onBoardingScreen,
        builder: (context, state) => const OnBoardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.loginScreen,
        name: AppRoutes.loginScreen,
        builder: (context, state) => const login.LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.registerScreen,
        name: AppRoutes.registerScreen,
        builder: (context, state) => const register.RegisterScreen(),
      ),
      GoRoute(
        name: AppRoutes.forgetPassword,
        path: '/forget-password',
        builder: (context, state) => const ForgetPasswordScreen(),
      ),
      GoRoute(
        name: AppRoutes.otpScreen,
        path: '/otp',
        builder: (context, state) => const OtpScreen(),
      ),
      GoRoute(
        name: AppRoutes.createNewPasswordScreen,
        path: '/createNewPassword',
        builder: (context, state) => const CreateNewPasswordScreen(),
      ),
      GoRoute(
        path: AppRoutes.homeScreen,
        name: 'homeScreen', // بدل AppRoutes.homeScreen لو كنت عايز تستخدم name
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
