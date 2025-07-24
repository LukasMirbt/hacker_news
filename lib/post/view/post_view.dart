import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hacker_client/post/post.dart';
import 'package:hacker_client/post/widgets/demo_bottom_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  late final ScrollController _controller;

  final bool _isElevated = true;
  bool _isVisible = true;

  void _show() {
    if (!_isVisible) {
      setState(() => _isVisible = true);
    }
  }

  void _hide() {
    if (_isVisible) {
      setState(() => _isVisible = false);
    }
  }

  void _listen() {
    switch (_controller.position.userScrollDirection) {
      case ScrollDirection.idle:
        break;
      case ScrollDirection.forward:
        _show();
      case ScrollDirection.reverse:
        _hide();
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()..addListener(_listen);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appBarHeight = const PostAppBar().preferredSize.height;

    return ListenableProvider.value(
      value: _controller,
      child: Provider.value(
        value: _isVisible,
        child: ColoredBox(
          color: ColorScheme.of(context).surface,
          child: Stack(
            children: [
              // 1. The Scaffold now takes up the FULL screen and is NOT in a Column.
              // The list content will scroll behind the app bar.
              const Scaffold(
                backgroundColor: Colors.transparent,
                body: PostRefreshIndicator(
                  child: _Body(),
                ),
                bottomNavigationBar: DemoBottomAppBar(),
              ),

              // 2. The AppBar is positioned over the Scaffold and slides up/down.
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                // Animate the 'top' property to move the AppBar on and off screen.
                top: _isVisible ? 0 : -appBarHeight,
                left: 0,
                right: 0,
                child: const PostAppBar(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (PostBloc bloc) => bloc.state.fetchStatus.isLoading,
    );

    final isFailure = context.select(
      (PostBloc bloc) => bloc.state.fetchStatus.isFailure,
    );

    if (isFailure) {
      return const AlwaysScrollable(
        child: ErrorText(),
      );
    }

    return Skeletonizer(
      enabled: isLoading,
      child: const PostBody(),
    );
  }
}
