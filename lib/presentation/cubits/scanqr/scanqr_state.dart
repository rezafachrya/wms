part of 'scanqr_cubit.dart';

abstract class ScanqrState extends Equatable {
  const ScanqrState();

  @override
  List<Object> get props => [];
}

class ScanqrInitial extends ScanqrState {}

class ScanqrSuccess extends ScanqrState {
  final TmanifestoutEntity tmanifestoutEntity;

  ScanqrSuccess(this.tmanifestoutEntity);

  @override
  List<Object> get props => [tmanifestoutEntity];
}

class ScanqrFailed extends ScanqrState {
  final String message;

  ScanqrFailed(this.message);

  @override
  List<Object> get props => [message];
}
