import 'package:flutter/material.dart';
import 'package:flutter_application_1/post/bloc/post_bloc.dart';
import 'package:flutter_application_1/post/posts_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Posts',
      home: BlocProvider(
        // GetPostEvent отправляется сразу при создании Bloc
        create: (_) => PostBloc()..add(GetPostEvent()),
        child: const PostsPage(),
      ),
    );
  }
}
