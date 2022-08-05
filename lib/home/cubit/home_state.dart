part of 'home_cubit.dart';

/// {@template home}
/// HomeState description
/// {@endtemplate}
class HomeState extends Equatable {
  /// {@macro home}
  const HomeState({
    this.filterType = FilterType.category,
  });

  /// A description for customProperty
  final FilterType filterType;

  @override
  List<Object> get props => [filterType];
}
