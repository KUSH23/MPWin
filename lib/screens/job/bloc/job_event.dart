part of 'job_bloc.dart';

@immutable
abstract class JobEvent {}

class JobsInitialFetchEvent extends JobEvent {}

class JobCreateButtonClickedEvent extends JobEvent {}