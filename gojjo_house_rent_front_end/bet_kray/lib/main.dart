import 'package:bet_kray/Login/Screen/login_screen.dart';
import 'package:bet_kray/Post/Repository/post_repository.dart';
import 'package:bet_kray/Post/bloc/bloc.dart';
import 'package:bet_kray/Post/screens/admin_post_list.dart';
import 'package:bet_kray/Post/screens/index.dart';
import 'package:bet_kray/Request/Screens/admin_request_list.dart';
import 'package:bet_kray/Request/bloc_observer.dart';
import 'package:bet_kray/User/bloc/user_bloc.dart';
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
import 'common/screen/home.dart';

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
    routes: [
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
                  GoRoute(
                    path: 'current_user_posts',
                    pageBuilder: (context, state) => MaterialPage<void>(
                      key: state.pageKey,
                      child: const UserPostList(),
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
                path: 'admin_profile',
                builder: (context, state) => AdminProfile(),
                routes: [
                  GoRoute(
                      path: 'admin_screen',
                      builder: (context, state) => const AdminPage(),
                      routes: [
                        GoRoute(
                          path: 'userlist',
                          builder: (context, state) => const UserList(),
                        ),
                        GoRoute(
                          path: 'postlist',
                          builder: (context, state) =>
                              const AdminPagePostList(),
                        ),
                        GoRoute(
                          path: 'requestlist',
                          builder: (context, state) =>
                              const AdminPageRequestList(),
                        ),
                        GoRoute(
                          path: 'edit_profile',
                          pageBuilder: (context, state) => MaterialPage<void>(
                            key: state.pageKey,
                            child: EditUserProfile(
                              user: state.extra,
                            ),
                          ),
                        ),
                      ]),
                ]),
            GoRoute(
                path: 'user_profile',
                builder: (context, state) => UserProfile(),
                routes: [
                  GoRoute(
                    path: 'edit_profile',
                    pageBuilder: (context, state) => MaterialPage<void>(
                      key: state.pageKey,
                      child: EditUserProfile(
                        user: state.extra,
                      ),
                    ),
                  ),
                ])
          ]),
      GoRoute(
        path: '/create_account',
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginUi(),
      ),
    ],
    initialLocation: '/login',
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: (context) {
              return LoginBloc(loginRepository: loginRepository)
                ..add(AppStarted());
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
        child: MaterialApp.router(
          routeInformationParser: _router.routeInformationParser,
          routerDelegate: _router.routerDelegate,
          debugShowCheckedModeBanner: false,
        ));
  }
}
