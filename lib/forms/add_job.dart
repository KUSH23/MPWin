import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:media_partners_ai/main.dart';
import 'package:media_partners_ai/models/jobs.dart';

import '../controller/api.dart';

class FormWidgetsDemo extends StatefulWidget {
  const FormWidgetsDemo({super.key});

  @override
  State<FormWidgetsDemo> createState() => _FormWidgetsDemoState();
}

class _FormWidgetsDemoState extends State<FormWidgetsDemo> {
  final _formKey = GlobalKey<FormState>();
  String comapanyname = '';
  String jobname = '';
  DateTime date = DateTime.now();
  double maxValue = 0;
  bool? varnish = false;
  bool? dripoff = false;
  bool? printing = false;
  bool? embosing = false;
  bool? die_cutting = false;
  bool? pasting = false;
  bool enableFeature = false;

  bool _isButtonDisabled = false;

  @override
  void initState() {
    _isButtonDisabled = false;
  }
  // Method to Submit Feedback and save it in Google Sheets
  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // If the form is valid, proceed.
      JobDataModel newJob = JobDataModel(
          id: 0,
          comapanyname: comapanyname,
          jobname: jobname,
          varnish: varnish,
          dripoff: dripoff,
          printing: printing,
          embosing: embosing,
          diecutting: die_cutting,
          pasting: pasting,
          jobstatus: "new",
          timestamp: DateTime.now()
      );
      // print(newJob);
      setState(() {
        _isButtonDisabled = true;
      });
      bool success = await FormController().addJobs(jobDataModel : newJob);
      if(success){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Created successfully!'),
            duration: Duration(seconds: 1),
          ),
        );
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const MyHomePage(),)
        );
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Booo!'),
            duration: Duration(seconds: 1),
          ),
        );
        setState(() {
          _isButtonDisabled = false;
        });
      }

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form widgets'),
      ),
      body: Form(
        key: _formKey,
        child: Scrollbar(
          child: Align(
            alignment: Alignment.topCenter,
            child: Card(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ...[
                        TextFormField(
                          decoration: const InputDecoration(
                            filled: true,
                            hintText: 'Enter Company name...',
                            labelText: 'Company',
                          ),
                          onChanged: (value) {
                            setState(() {
                              comapanyname = value;
                            });
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            hintText: 'Enter job description...',
                            labelText: 'Job',
                          ),
                          onChanged: (value) {
                            setState(() {
                              jobname = value;
                            });
                          },
                          maxLines: 5,
                        ),
                        _FormDatePicker(
                          date: date,
                          onChanged: (value) {
                            setState(() {
                              date = value;
                            });
                          },
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Estimated value',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                            Text(
                              intl.NumberFormat.currency(
                                  symbol: "\₹", decimalDigits: 0)
                                  .format(maxValue),
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Slider(
                              min: 0,
                              max: 100000,
                              divisions: 100,
                              value: maxValue,
                              onChanged: (value) {
                                setState(() {
                                  maxValue = value;
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: varnish,
                              onChanged: (checked) {
                                setState(() {
                                  varnish = checked;
                                });
                              },
                            ),
                            Text('Varnish',
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: dripoff,
                              onChanged: (checked) {
                                setState(() {
                                  dripoff = checked;
                                });
                              },
                            ),
                            Text('Dripoff',
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: printing,
                              onChanged: (checked) {
                                setState(() {
                                  printing = checked;
                                });
                              },
                            ),
                            Text('Printing',
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: embosing,
                              onChanged: (checked) {
                                setState(() {
                                  embosing = checked;
                                });
                              },
                            ),
                            Text('Embosing',
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: die_cutting,
                              onChanged: (checked) {
                                setState(() {
                                  die_cutting = checked;
                                });
                              },
                            ),
                            Text('Die cutting',
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: pasting,
                              onChanged: (checked) {
                                setState(() {
                                  pasting = checked;
                                });
                              },
                            ),
                            Text('Pasting',
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Enable feature',
                                style: Theme.of(context).textTheme.bodyLarge),
                            Switch(
                              value: enableFeature,
                              onChanged: (enabled) {
                                setState(() {
                                  enableFeature = enabled;
                                });
                              },
                            ),
                          ],
                        ),
                        (_isButtonDisabled == true)
                        ? const Center(
                          child: CircularProgressIndicator(),
                        )
                        : MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            _submitForm();
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.create,
                                color: Colors.black,
                              ),
                              Text (
                                'Create Job',
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ].expand(
                            (widget) => [
                          widget,
                          const SizedBox(
                            height: 24,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FormDatePicker extends StatefulWidget {
  final DateTime date;
  final ValueChanged<DateTime> onChanged;

  const _FormDatePicker({
    required this.date,
    required this.onChanged,
  });

  @override
  State<_FormDatePicker> createState() => _FormDatePickerState();
}

class _FormDatePickerState extends State<_FormDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Date',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              intl.DateFormat.yMd().format(widget.date),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        TextButton(
          child: const Text('Edit'),
          onPressed: () async {
            var newDate = await showDatePicker(
              context: context,
              initialDate: widget.date,
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
            );

            // Don't change the date if the date picker returns null.
            if (newDate == null) {
              return;
            }

            widget.onChanged(newDate);
          },
        )
      ],
    );
  }
}