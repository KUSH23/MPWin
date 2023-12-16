import 'package:flutter/material.dart';
import 'package:media_partners_ai/models/jobs.dart';

class JobTile extends StatelessWidget {
  final JobDataModel jobDataModel;

  const JobTile(this.jobDataModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.primaries[jobDataModel.id! % Colors.primaries.length],
        ),
        title: Text(
          'Item ${jobDataModel.jobname}',
        ),
        trailing: IconButton(
          icon: const Icon(Icons.file_open_outlined),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Working!'),
                duration: Duration(seconds: 1),
              ),
            );
          },
        ),
      ),
    );
  }
}