part of 'filter_list_cubit.dart';

enum FilterListStatus { initial, loading, success, failure }

/// {@template filter_list}
/// FilterListState description
/// {@endtemplate}
class FilterListState extends Equatable {
  /// {@macro filter_list}
  const FilterListState({
    this.filters = Filters.empty,
    this.status = FilterListStatus.initial,
  });

  /// [Filters] with list of filters
  final Filters filters;

  /// Status of state
  final FilterListStatus status;

  @override
  List<Object> get props => [
        filters,
        status,
      ];

  /// Creates a copy of the current FilterListState with property changes
  FilterListState copyWith({Filters? filters, FilterListStatus? status}) {
    return FilterListState(
      filters: filters ?? this.filters,
      status: status ?? this.status,
    );
  }

  bool get isLoading =>
      status == FilterListStatus.initial || status == FilterListStatus.loading;

  bool get isSuccess => status == FilterListStatus.success;

  bool get isFailure => status == FilterListStatus.failure;
}
