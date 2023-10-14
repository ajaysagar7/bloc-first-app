import 'package:bloc_jsonplaceholder/core/services/locator.dart';
import 'package:bloc_jsonplaceholder/src/features/posts/presentation/bloc/post_bloc.dart';
import 'package:bloc_jsonplaceholder/src/features/posts/presentation/screens/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (c) =>  locator.get<PostBloc>()),
      ],
      child: const MaterialApp(
        home: PostScreen(),
      ),
    );
  }
}
