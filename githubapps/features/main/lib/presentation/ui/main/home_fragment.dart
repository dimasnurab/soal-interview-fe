import 'package:flutter/cupertino.dart';
import 'package:main/presentation/bloc/home/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';
import 'package:shared/utils/state_api.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  late HomeBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<HomeBloc>(context);
    initData();
  }

  initData() => _bloc.add(DoGetTrending());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.fromLTRB(16, 30, 16, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Trending",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Expanded(child: _buildBody(state)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBody(HomeState state) {
    Widget? child;

    if (state.stateApi == ResultStateApi.loading) {
      child = Center(child: LoadingIndicator());
    } else if (state.stateApi == ResultStateApi.fail) {
      child = Center(child: Text(state.errorMsg));
    } else if (state.stateApi == ResultStateApi.done) {
      child = state.data.isEmpty
          ? Center(child: Text("Data tidak ditemukan"))
          : ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 20),
              itemCount: state.data.length,
              itemBuilder: (context, index) =>
                  RepositoryCard(repo: state.data[index], isTrending: true),
            );
    } else {
      child = Container();
    }
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 750),
      switchInCurve: Curves.bounceIn,
      switchOutCurve: Curves.bounceInOut,
      child: child,
    );
  }
}
