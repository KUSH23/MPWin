import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_partners_ai/models/jobs.dart';

import '../../templates/jobtile.dart';
import 'bloc/job_bloc.dart';

class JobsListPage extends StatefulWidget {
  const JobsListPage({super.key});

  @override
  State<JobsListPage> createState() => _JobsListPageState();
}

class _JobsListPageState extends State<JobsListPage> {

  final JobBloc jobsBloc = JobBloc();

  @override
  void initState() {
    jobsBloc.add(JobsInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: const Text("Jobs"),
      ),
      body: BlocConsumer<JobBloc, JobState>(
        bloc: jobsBloc,
        listenWhen: (previous, current) => current is JobActionState,
        buildWhen: (previous, current) => current is !JobActionState,
        listener: (context, state) {
          // if(state is PostsAdditionState || state is PostsUpdateFormState || state is PostsTransactionFormState || state is PostsProductDataFormState){
          //   Navigator.push(context, MaterialPageRoute(builder: (context)=> Cart(postsBloc: widget.postsBloc, homeBloc:widget.homeBloc)));
          // }
          // }else if(state is PostsAdditionErrorState){
          //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Error!")));
          // }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case JobsLoadingState:
              return Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Loading...",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  // SearchField(postsBloc: widget.postsBloc),
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                ],
              );
            case JobsLoadedSuccessState:
              final successState = state as JobsLoadedSuccessState;
              return ListView.builder(
                itemCount: successState.jobs.length,
                cacheExtent: 20.0,
                controller: ScrollController(),
                padding: const EdgeInsets.symmetric(vertical: 16),
                itemBuilder: (context, index) => JobTile(successState.jobs[index]),
              );
            case JobLoadingErrorState:
              return const Center(child: Text ('Error') );
            default:
              return  const Center(child: Text ('Error'));
          }
        },
      ),
    );
  }
}
