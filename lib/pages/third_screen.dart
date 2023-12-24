import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia_mobile_dev_test/Theme/custom_theme.dart';
import 'package:suitmedia_mobile_dev_test/bloc/user/user_bloc.dart';
import 'package:suitmedia_mobile_dev_test/bloc/user_list/user_list_bloc.dart';
import 'package:suitmedia_mobile_dev_test/components/app_bar.dart';
import 'package:suitmedia_mobile_dev_test/components/user_tile.dart';
import 'package:suitmedia_mobile_dev_test/models/user.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int page = 1;
    int pageSize = 10;

    return Scaffold(
      appBar: buildAppBar(context, 'Third Screen'),
      body: BlocBuilder<UserListBloc, UserListState>(
        builder: (context, state) {
          if (state is UserListInitial) {
            BlocProvider.of<UserListBloc>(context)
                .add(GetUserList(page, pageSize));
            return const Center(child: CircularProgressIndicator());
          } else if (state is UserListLoaded) {
            return UserListView(
                users: state.users, hasReachedMax: state.hasReachedMax);
          } else {
            return const Center(child: Text('Error loading users'));
          }
        },
      ),
    );
  }
}

class UserListView extends StatefulWidget {
  final List<User> users;
  final bool hasReachedMax;

  const UserListView(
      {super.key, required this.users, required this.hasReachedMax});

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  final _scrollController = ScrollController();
  int _page = 1;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _page++;
        BlocProvider.of<UserListBloc>(context)
            .add(GetUserList(_page, widget.users.length));
      }
    });

    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients &&
          _scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent) {
        _page++;
        BlocProvider.of<UserListBloc>(context)
            .add(GetUserList(_page, widget.users.length));
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        _page = 1;
        BlocProvider.of<UserListBloc>(context).add(ResetUserList());
      },
      child: Padding(
        padding: CustomTheme.screenPaddingHorizontal,
        child: ListView.builder(
          itemCount: widget.users.length + (widget.hasReachedMax ? 0 : 1),
          physics: const AlwaysScrollableScrollPhysics(),
          controller: _scrollController,
          itemBuilder: (context, index) {
            if (index < widget.users.length) {
              return UserTile(
                user: widget.users[index],
                onTap: () {
                  BlocProvider.of<UserBloc>(context)
                      .add(GetUser(widget.users[index]));
                  Navigator.pop(context);
                },
              );

              // ListTile(
              //   title: Text(widget.users[index].firstName),
              //   subtitle: Text(widget.users[index].lastName),
              //   onTap: () {
              //     BlocProvider.of<UserBloc>(context)
              //         .add(GetUser(widget.users[index]));
              //     Navigator.pop(context);
              //   },
              // );
            } else if (widget.hasReachedMax) {
              return const Center(child: Text('No more users'));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
