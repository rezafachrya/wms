part of 'manifestoutitem_cubit.dart';

abstract class ManifestoutitemState extends Equatable {
  const ManifestoutitemState();

  @override
  List<Object> get props => [];
}

class ManifestoutitemInitial extends ManifestoutitemState {}

class ManifestoutitemSuccess extends ManifestoutitemState {
  final List<TmanifestoutitemEntity> mitems;

  ManifestoutitemSuccess({
    required this.mitems,
  });

  @override
  List<Object> get props => [mitems];
}

class ManifestoutitemError extends ManifestoutitemState {}

class ManifestoutitemLoading extends ManifestoutitemState {}
