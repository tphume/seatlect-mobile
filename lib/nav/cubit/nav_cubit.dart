import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'nav_state.dart';

class NavCubit extends Cubit<NavState> {
  NavCubit() : super(NavHome());

  void switchPage(NavState page) => emit(page);
}
