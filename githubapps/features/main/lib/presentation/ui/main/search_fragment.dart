import 'dart:io';

import 'package:flutter/material.dart';
import 'package:main/domain/entities/repo/repo_entity.dart';
import 'package:main/domain/entities/user/user_entity.dart';
import 'package:main/presentation/bloc/search/search_bloc.dart';
import 'package:shared/shared.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class SearchFragment extends StatefulWidget {
  const SearchFragment({super.key});

  @override
  State<SearchFragment> createState() => _SearchFragmentState();
}

class _SearchFragmentState extends State<SearchFragment> {
  late SearchBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<SearchBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.only(left: 14, right: 14, top: 20),
          child: Column(
            children: [
              DebounceTextFormField(
                onChanged: (val) {
                  _bloc.add(DoSearchUsername(val));
                },
              ),
              SizedBox(height: 30),
              _buildBody(state),
              SizedBox(height: 20),
              Visibility(
                visible: state.dataUser != null,
                child: CustomTabBar(
                  tabs: ['Repositories', "star"],
                  currentIndex: state.indexBodyTab,
                  onTabChanged: (val) => _bloc.add(DochangeTab(val)),
                ),
              ),
              SizedBox(height: 30),
              Expanded(
                child: Visibility(
                  visible: state.dataUser != null,

                  child: _buildBodyTab(state),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBodyTab(SearchState state) {
    final loadingStates = [state.stateRepositories, state.stateStarred];
    if (loadingStates.contains(ResultStateApi.loading)) {
      return Center(child: LoadingIndicator());
    }

    switch (state.indexBodyTab) {
      case 0:
        return state.itemsRepo.isEmpty
            ? Center(child: Text("Data tidak ditemukan"))
            : SingleChildScrollView(
                child: Column(
                  children: state.itemsRepo
                      .map((e) => RepositoryCard(repo: e))
                      .toList(),
                ),
              );
      case 1:
        return state.itemsStarred.isEmpty
            ? Center(child: Text("Data tidak ditemukan"))
            : SingleChildScrollView(
                child: Column(
                  children: state.itemsStarred
                      .map((e) => RepositoryCard(repo: e, isStarred: true))
                      .toList(),
                ),
              );
      default:
        return Container();
    }
  }

  Widget _buildBody(SearchState state) {
    bool isFail = [
      ResultStateApi.fail,
      ResultStateApi.notfound,
    ].contains(state.stateApi);

    Widget? child;
    if (state.stateApi == ResultStateApi.loading) {
      child = UserItemShimmer(key: ValueKey('shimmer_user'));
    } else if (state.stateApi == ResultStateApi.done) {
      child = _buildItem(state.dataUser);
    } else if (isFail) {
      child = Text(state.errorMsg, style: TextStyle(fontSize: 16));
    } else {
      child = Container();
    }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
      child: child,
    );
  }

  Widget _buildItem(UserEntity? data) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCachedImage(
                imageUrl: data?.avatarUrl ?? '',
                height: 60,
                width: 60,
                borderRadius: BorderRadius.circular(20),
              ),
              SizedBox(width: 15),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data?.name ?? '',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      data?.bio ?? '',
                      maxLines: 2,
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(height: 10),
                    Text('Repositories : ${data?.publicRepos ?? '0'}'),
                    Row(
                      children: [
                        Icon(Icons.people, color: ColorsApp.gray, size: 20),
                        SizedBox(width: 10),
                        RichText(
                          text: TextSpan(
                            text: "${data?.followers ?? 0} ",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: 'Follower · ',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: ColorsApp.gray,
                                ),
                              ),
                              TextSpan(text: '${data?.following ?? 0}'),
                              TextSpan(
                                text: ' Following',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: ColorsApp.gray,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
