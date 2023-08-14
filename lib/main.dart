import 'package:flutter/material.dart';
import 'package:todo_app_bloc/screens/tabs_screen.dart';
import 'package:todo_app_bloc/services/app_router.dart';
import 'blocs/bloc_exports.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // final storage = await HydratedStorage.build(
  //   storageDirectory: await getApplicationCacheDirectory(),
  // );
  //
  // HydratedBloc.storage = storage ;
  runApp(const MyApp());
}

final AppRouter _appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TasksBloc(),),
        BlocProvider(create: (context) => SwitchBloc(),),
      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Tasks App',
            theme: ThemeData(primarySwatch: Colors.blue),
            home: TabsScreen(),
            onGenerateRoute: _appRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
