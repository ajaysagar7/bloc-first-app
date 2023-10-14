// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_jsonplaceholder/src/features/posts/domain/entities/post_entity.dart';
import 'package:bloc_jsonplaceholder/src/features/posts/presentation/bloc/post_bloc.dart';

class SinglePostScreen extends StatefulWidget {
  final String id;
  const SinglePostScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<SinglePostScreen> createState() => _SinglePostScreenState();
}

class _SinglePostScreenState extends State<SinglePostScreen> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<PostBloc>(context).add(PostGetPostByIdEvents(id: widget.id));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: SafeArea(child: _singlePostBodyWidget()),
    );
  }

  _appbarWidget() {
    return AppBar(
      title: const Text('Single Post'),
    );
  }

  _singlePostBodyWidget() {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        switch(state.runtimeType) {
          case PostLoading:
            return const Center(child: CircularProgressIndicator());
          case SinglePostLoaded:
          return _singlePostWidget((state as SinglePostLoaded).post);
          case PostFailed:
            return Center(child: Text((state as PostFailed).message));
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  _singlePostWidget(PostEntity post) {
    return ListView(
      children: [
        Card(
          margin: EdgeInsets.all(8),
          child: ListTile(
            title: Text(post.title),
            subtitle: Text(post.body),
          ),
        ),
      ],
    );
  }
}
