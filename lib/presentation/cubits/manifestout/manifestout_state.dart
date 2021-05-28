part of 'manifestout_cubit.dart';

abstract class ManifestoutState extends Equatable {
  const ManifestoutState();

  @override
  List<Object> get props => [];
}

class ManifestoutInitial extends ManifestoutState {}

class UpdateManifestoutSuccess extends ManifestoutState {
  final String message;

  UpdateManifestoutSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class UpdateManifestoutFailed extends ManifestoutState {
  final String message;

  UpdateManifestoutFailed(this.message);

  @override
  List<Object> get props => [message];
}
