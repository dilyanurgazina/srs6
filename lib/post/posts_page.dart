import 'package:flutter/material.dart';
import 'package:flutter_application_1/post/bloc/post_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts'), centerTitle: true),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is LoadingPostState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is FetchedPostsState) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, i) {
                final post = state.posts[i];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    title: Text(post.title,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(post.body),
                  ),
                );
              },
            );
          }
          if (state is FailurePostState) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Не удалось загрузить посты'),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () =>
                        context.read<PostBloc>().add(GetPostEvent()),
                    child: const Text('Повторить'),
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
