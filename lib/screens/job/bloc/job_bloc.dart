import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:media_partners_ai/models/jobs.dart';
import 'package:meta/meta.dart';

import '../../../controller/api.dart';

part 'job_event.dart';
part 'job_state.dart';

class JobBloc extends Bloc<JobEvent, JobState> {
  JobBloc() : super(JobInitial()) {
    on<JobEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<JobsInitialFetchEvent>(jobsInitialFetchEvent);
  }

  FutureOr<void> jobsInitialFetchEvent(
      JobsInitialFetchEvent event, Emitter<JobState> emit) async {
    emit(JobsLoadingState());

    List<JobDataModel> mydata = await FormController().getJobsList("");
    emit(JobsLoadedSuccessState(jobs: mydata));
  }
}
