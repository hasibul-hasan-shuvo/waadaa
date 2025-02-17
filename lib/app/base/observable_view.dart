import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waadaa/app/base/base_state.dart';
import 'package:waadaa/app/base/base_view_model.dart';

abstract class ObservableView<ViewModel extends BaseViewModel<ViewState>,
    ViewState extends BaseState, SelectedState> extends StatelessWidget {
  const ObservableView({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: BlocSelector<ViewModel, ViewState, SelectedState>(
        selector: observeState,
        builder: body,
      ),
    );
  }

  Widget body(BuildContext context, SelectedState state);

  SelectedState observeState(ViewState state);
}
