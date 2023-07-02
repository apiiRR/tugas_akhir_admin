import 'package:go_router/go_router.dart';

import '../screens/attedance/attedance_screen.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/leave/leave_screen.dart';
import '../screens/main/main_screen.dart';
import '../screens/setting/setting_screen.dart';
import '../screens/users/create_user_screen.dart';
import '../screens/users/user_screen.dart';

export 'package:go_router/go_router.dart';
part 'route_name.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  // initialLocation: isLogin(),
  // redirect: (context, state) {
  //   SharedPreferences sharedPreferences = locator<SharedPreferences>();
  //   bool isFirstLaunch = sharedPreferences.getBool('first_launch') ?? true;

  //   FirebaseAuth auth = FirebaseAuth.instance;

  //   if (auth.currentUser == null) {
  //     if (isFirstLaunch) {
  //       return "/intro";
  //     } else {
  //       return "/login";
  //     }
  //   } else {
  //     return null;
  //   }
  // },
  routes: [
    ShellRoute(
        pageBuilder: (context, state, child) {
          return NoTransitionPage(child: MainScreen(child: child));
        },
        routes: [
          GoRoute(
            path: '/',
            name: Routes.dashboardPage,
            // builder: (context, state) => const HomePage(),
            pageBuilder: (context, state) =>
                NoTransitionPage(child: DashboardScreen()),
          ),
          GoRoute(
              path: '/users',
              name: Routes.usersPage,
              // builder: (context, state) => const HomePage(),
              pageBuilder: (context, state) =>
                  NoTransitionPage(child: UsersScreen()),
              routes: [
                GoRoute(
                    path: 'create',
                    name: Routes.createUserPage,
                    pageBuilder: (context, state) =>
                        NoTransitionPage(child: CreateUserScreen()))
              ]),
          GoRoute(
            path: '/attedance',
            name: Routes.attedancePage,
            // builder: (context, state) => const HomePage(),
            pageBuilder: (context, state) =>
                NoTransitionPage(child: AttedanceScreen()),
          ),
          GoRoute(
            path: '/leave',
            name: Routes.leavePage,
            // builder: (context, state) => const HomePage(),
            pageBuilder: (context, state) =>
                NoTransitionPage(child: LeaveScreen()),
          ),
          GoRoute(
            path: '/setting',
            name: Routes.settingPage,
            // builder: (context, state) => const HomePage(),
            pageBuilder: (context, state) =>
                NoTransitionPage(child: SettingScreen()),
          ),
          // GoRoute(
          //     path: '/history',
          //     name: Routes.historyPage,
          //     // builder: (context, state) => const HistoryPage()
          //     pageBuilder: (context, state) =>
          //         const NoTransitionPage(child: HistoryPage())),
          // GoRoute(
          //     path: '/leave',
          //     name: Routes.leavePage,
          //     // builder: (context, state) => const LeavePage()
          //     pageBuilder: (context, state) =>
          //         const NoTransitionPage(child: LeavePage())),
        ]),
  ],
);

// String? isLogin() {
//   SharedPreferences sharedPreferences = locator<SharedPreferences>();
//   bool isFirstLaunch = sharedPreferences.getBool('first_launch') ?? true;

//   FirebaseAuth auth = FirebaseAuth.instance;

//   if (auth.currentUser == null) {
//     if (isFirstLaunch) {
//       return "/intro";
//     } else {
//       return "/login";
//     }
//   } else {
//     return null;
//   }
// }
