part of 'job_bloc.dart';

@immutable
abstract class JobState {}

abstract class JobActionState extends JobState {}

class JobInitial extends JobState {}

class JobsLoadingState extends JobState {}

class JobsLoadedSuccessState extends JobState {
  List<JobDataModel> jobs;
  JobsLoadedSuccessState({required this.jobs});
}

class JobLoadingErrorState extends JobState {}