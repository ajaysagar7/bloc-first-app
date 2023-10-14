import 'package:bloc_jsonplaceholder/core/utils/app_util.dart';
import 'package:bloc_jsonplaceholder/src/features/posts/presentation/bloc/post_bloc.dart';
import 'package:bloc_jsonplaceholder/src/features/posts/presentation/screens/single_post_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {

    super.initState();
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
      context.read<PostBloc>().add(const PostGetPostEvents() );
     });
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        actions: [
          IconButton(
            onPressed: () {
              AppUtil.debugPrint("PostScreen refresh");
              context.read<PostBloc>().add(const PostGetPostEvents() );
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: SafeArea(child: _postBodyWidget(context)),
    );
  }

  Widget _postBodyWidget(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        switch(state.runtimeType) {
          case PostInitial:
            return const Center(child: CircularProgressIndicator());
          case PostLoading:

            return const Center(child: CircularProgressIndicator());
          case PostLoaded:
            final posts = (state as PostLoaded).posts;
            return RefreshIndicator(
                    onRefresh: () async {
          context.read<PostBloc>().add(const PostGetPostEvents() );
        },
                  child: ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      final post = posts[index];
                      return Card(
                        margin: const EdgeInsets.all(8),
                        
                        child: ListTile(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (c) => SinglePostScreen(id: post.id.toString(),)));
                          },
                          title: Text(post.title),
                          subtitle: Text(post.body),
                        ),
                      );
                    },
                  ),
                
            );
          case PostFailed:
            final message = (state as PostFailed).message;
            return Center(child: Text(message));
          default:  return const Center(child: CircularProgressIndicator());  
        }
      },
    );
  }

  @override
  void didUpdateWidget(covariant PostScreen oldWidget) {
    if(oldWidget != widget) {
      AppUtil.debugPrint("PostScreen didUpdateWidget");
      context.read<PostBloc>().add(const PostGetPostEvents() );
    }
    super.didUpdateWidget(oldWidget);
  }
}
