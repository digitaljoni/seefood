import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe_api/recipe_api.dart';
import 'package:recipe_repository/recipe_repository.dart';
part 'filter_list_state.dart';

class FilterListCubit extends Cubit<FilterListState> {
  FilterListCubit({
    required this.filterType,
    required this.recipeRepository,
  }) : super(const FilterListState());

  final FilterType filterType;
  final RecipeRepository recipeRepository;

  Future<void> getFilters() async {
    emit(
      state.copyWith(
        status: FilterListStatus.loading,
      ),
    );

    try {
      final filters = await recipeRepository.fetchFilters(filterType);

      emit(
        state.copyWith(
          filters: filters,
          status: FilterListStatus.success,
        ),
      );
    } on Exception {
      emit(
        state.copyWith(
          status: FilterListStatus.failure,
        ),
      );
    }
  }
}
