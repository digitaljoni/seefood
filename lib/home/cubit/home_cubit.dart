import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe_api/recipe_api.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  /// Set Filter Tab to display
  void setFilter(FilterType filterType) =>
      emit(HomeState(filterType: filterType));
}
