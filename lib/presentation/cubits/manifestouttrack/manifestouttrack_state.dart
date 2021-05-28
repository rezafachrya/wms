part of 'manifestouttrack_cubit.dart';

abstract class ManifestouttrackState extends Equatable {
  const ManifestouttrackState();

  @override
  List<Object> get props => [];
}

class ManifestouttrackInitial extends ManifestouttrackState {}

class ManifestouttrackInsertSuccess extends ManifestouttrackState {
  final String message;

  ManifestouttrackInsertSuccess(this.message);
  @override
  List<Object> get props => [message];
}

class ManifestouttrackFailed extends ManifestouttrackState {
  final String message;

  ManifestouttrackFailed(this.message);

  @override
  List<Object> get props => [message];
}
