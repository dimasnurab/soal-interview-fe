import 'package:flutter/material.dart';
import 'package:main/domain/usecases/main_usecase.dart';
import 'package:main/presentation/bloc/main/main_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main/presentation/bloc/search/search_bloc.dart';
import 'package:main/presentation/ui/main/home_fragment.dart';
import 'package:main/presentation/ui/main/search_fragment.dart';
import 'package:shared/widget/custom_appbar.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late MainBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = BlocProvider.of<MainBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(),
          body: _buildBody(state.bottomNavIndex),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.bottomNavIndex,
            onTap: (value) => _bloc.add(ChangeBottomIndex(value)),

            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBody(int index) {
    switch (index) {
      case 1:
        return BlocProvider(
          create: (context) => SearchBloc(usecase: Modular.get<MainUsecase>()),
          child: SearchFragment(),
        );

      default:
        return HomeFragment();
    }
  }
}
