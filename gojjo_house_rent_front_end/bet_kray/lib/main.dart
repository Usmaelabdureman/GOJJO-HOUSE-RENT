import 'package:bet_kray/Login/Screen/login_screen.dart';
import 'package:bet_kray/Post/Repository/post_repository.dart';
import 'package:bet_kray/Post/bloc/bloc.dart';
import 'package:bet_kray/Post/screens/index.dart';
import 'package:bet_kray/Request/bloc_observer.dart';
import 'package:bet_kray/User/bloc/user_bloc.dart';
import 'package:bet_kray/utils/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Login/UserRepository/user_repository.dart';
import 'Login/bloc/bloc.dart';
import 'Post/data_provider/post_data_provider.dart';
import 'package:go_router/go_router.dart';

import 'Request/Screens/index.dart';
import 'Request/bloc/request_bloc.dart';
import 'Request/data_providers/reqeust_data_provider.dart';
import 'Request/repository/request_repository.dart';
import 'User/data_provider/user_data_provider.dart';
import 'User/repository/user_repository.dart';
import 'User/screens/index.dart';

void main() {
   final LoginRepository loginRepository = LoginRepository();
  final PostRepository postRepository = PostRepository(PostDataProvider());
  final RequestRepository requestRepository =
      RequestRepository(RequestDataProvider());
  final UserRepository userRepository = UserRepository(UserDataProvider());

  BlocOverrides.runZoned(
      () => runApp(GojjoApp(
            loginRepository: loginRepository,
            postRepository: postRepository,
            requestRepository: requestRepository,
            userRepository: userRepository,
          )),
      blocObserver: SimpleBlocObserver());
}

class GojjoApp extends StatelessWidget {
  final LoginRepository loginRepository;
  final PostRepository postRepository;
  final RequestRepository requestRepository;
  final UserRepository userRepository;
  GojjoApp(
      {Key? key,
      required this.loginRepository,
      required this.postRepository,
      required this.requestRepository,
      required this.userRepository})
      : super(key: key);

  final _router = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginUi(),
        ),
      GoRoute(
          path: '/',
          builder: (context, state) => const MainPage(),
          routes: [
            GoRoute(
                path: 'user_posts',
                builder: (context, state) => const Home(),
                routes: [
                  GoRoute(
                    path: 'add_post',
                    pageBuilder: (context, state) => MaterialPage<void>(
                      key: state.pageKey,
                      child: PostAdd(),
                    ),
                  ),
                  GoRoute(
                    path: 'detail',
                    pageBuilder: (context, state) => MaterialPage<void>(
                      key: state.pageKey,
                      child: PostDetail(
                        post: state.extra,
                      ),
                    ),
                  ),
                  GoRoute(
                    path: 'post_update',
                    pageBuilder: (context, state) => MaterialPage<void>(
                      key: state.pageKey,
                      child: UserPostUpdate(
                        post: state.extra,
                      ),
                    ),
                  ),
                ]),
            GoRoute(
                path: 'request_list',
                builder: (context, state) => RequestList(),
                routes: [
                  GoRoute(
                    path: 'add_request',
                    pageBuilder: (context, state) => MaterialPage<void>(
                      key: state.pageKey,
                      child: AddRequest(),
                    ),
                  ),
                ]),
            GoRoute(
                path: 'user_request_list',
                builder: (context, state) => const UserRequestList(),
                routes: [
                  GoRoute(
                    path: 'edit_request',
                    pageBuilder: (context, state) => MaterialPage<void>(
                      key: state.pageKey,
                      child: UpdateUserRequest(
                        userRequest: state.extra,
                      ),
                    ),
                  ),
                ]),
            GoRoute(
              path: 'admin_request',
              builder: (context, state) => const SignupScreen(),
            ),
            GoRoute(
                path: 'profile',
                builder: (context, state) => const UserProfile(),
                routes: [
                  // GoRoute(
                  //   path: 'edit_profile',
                  //   pageBuilder: (context, state) => MaterialPage<void>(
                  //     key: state.pageKey,
                  //     child: EditUserProfile(
                  //       user: state.extra,
                  //     ),
                  //   ),
                  // ),
                ])
          ]),
      GoRoute(
        path: '/create_account',
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: '/userlist',
        builder: (context, state) => const UserList(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: (context) {
              return LoginBloc(loginRepository: loginRepository)..add(AppStarted());
            },
          ),
          BlocProvider<PostBloc>(
            create: (context) {
              return PostBloc(postRepository: postRepository)..add(PostLoad());
            },
          ),
          BlocProvider<RequestBloc>(
            create: (context) {
              return RequestBloc(requestRepository: requestRepository)
                ..add(UserRequestLoad());
            },
          ),
          BlocProvider<UserBloc>(
            create: (context) {
              return UserBloc(userRepository: userRepository)..add(LoadUser());
            },
          ),
        ],
        // create: (create) =>
        //     PostBloc(postRepository: postRepository)..add(PostLoad()),
        child: MaterialApp.router(
          routeInformationParser: _router.routeInformationParser,
          routerDelegate: _router.routerDelegate,
          debugShowCheckedModeBanner: false,
        ));
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedScreenIndex = 0;

  static List<Widget> screens = <Widget>[
    Home(),
    RequestList(),
    UserProfile(),
  ];

  void changeScreen(int index) {
    setState(() {
      selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gojjo"),
        backgroundColor: Color.fromARGB(255, 112, 80, 67),
        foregroundColor: Colors.white,
      ),
      drawer: const AppDrawer(),
      body: screens[selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        currentIndex: selectedScreenIndex,
        onTap: changeScreen,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add_outlined),
            label: "request",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "profile",
          ),
        ],
      ),
    );
  }
}
