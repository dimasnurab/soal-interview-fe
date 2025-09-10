import 'package:flutter/material.dart';
import 'package:main/presentation/bloc/main/main_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          appBar: AppBar(),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.bottomNavIndex,
            onTap: (value) => _bloc.add(ChangeBottomIndex(value)),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 24),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search, size: 24),
                label: "Search",
              ),
            ],
          ),
        );
      },
    );
  }
}
