part of 'manifest_tabbed_cubit.dart';

abstract class ManifestTabbedState extends Equatable {
  final int currentTabIndex;

  const ManifestTabbedState({this.currentTabIndex = 0});

  @override
  List<Object> get props => [currentTabIndex];
}

class ManifestTabbedInitial extends ManifestTabbedState {}

class ManifestTabChanged extends ManifestTabbedState {
  final List<TmanifestoutEntity> manifests;

  const ManifestTabChanged({int currentTabIndex = 0, required this.manifests})
      : super(currentTabIndex: currentTabIndex);

  @override
  List<Object> get props => [currentTabIndex, manifests];
}

class ManifestTabLoadError extends ManifestTabbedState {
  final AppErrorType errorType;

  const ManifestTabLoadError({
    int currentTabIndex = 0,
    required this.errorType,
  }) : super(currentTabIndex: currentTabIndex);
}

class ManifestTabLoading extends ManifestTabbedState {
  const ManifestTabLoading({int currentTabIndex = 0})
      : super(currentTabIndex: currentTabIndex);
}
