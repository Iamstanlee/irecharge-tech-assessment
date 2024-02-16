import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_assessment/app/employee_productivity/bloc/employee_productivity_bloc.dart';
import 'package:mobile_assessment/app/employee_productivity/widgets/employee_list_item.dart';
import 'package:mobile_assessment/app/employee_productivity/widgets/search_and_filter_row_item.dart';
import 'package:mobile_assessment/core/design_system/dimension.dart';
import 'package:mobile_assessment/core/design_system/typography.dart';

class EmployeeListPage extends StatefulWidget {
  const EmployeeListPage({super.key});

  @override
  State<EmployeeListPage> createState() => _EmployeeListPageState();
}

class _EmployeeListPageState extends State<EmployeeListPage> {
  String query = '';

  @override
  void initState() {
    super.initState();
    context
        .read<EmployeeProductivityBloc>()
        .add(const EmployeeProductivityEvent.getEmployeeList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('End Of Year Productivity Report'),
      ),
      body: BlocBuilder<EmployeeProductivityBloc, EmployeeProductivityState>(
        builder: (context, state) {
          final employees =
              state.employees.filterByNameLevelOrDesignation(query);

          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(AppDimension.md),
                  child: SearchAndFilterRowItem(
                    onFilterPressed: () {},
                    onSearchTextChanged: (value) {
                      setState(() {
                        query = value;
                      });
                    },
                  ),
                ),
                if (state.isLoading)
                  const _LoadingState()
                else if (state.hasError)
                  _ErrorState(state.error)
                else
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: employees.length,
                    itemBuilder: (context, index) => EmployeeListItem(
                      employees[index],
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _LoadingState extends StatelessWidget {
  const _LoadingState();

  @override
  Widget build(BuildContext context) {
    return const Text('Loading, Please wait...');
  }
}

class _ErrorState extends StatelessWidget {
  final String? error;

  const _ErrorState(this.error);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Error: $error'),
        const SizedBox(height: AppDimension.xs),
        TextButton(
          onPressed: () {
            context
                .read<EmployeeProductivityBloc>()
                .add(const EmployeeProductivityEvent.getEmployeeList());
          },
          child: Text(
            'Retry',
            style: AppTypography.h2.copyWith(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
