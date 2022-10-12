import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_q/common/presentation/base_loading_indicator.dart';
import 'package:flutter_q/features/genres/domain/notifiers/genres_notifier/genres_state_notifier.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(genresStateNotifierProvider);

        return Scaffold(
          body: state.when(
            initial: () => Container(),
            loading: () => const BaseLoadingIndicator(),
            data: (data) => ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => Text(data[index].name),
            ),
            other: (otherStates) => Container(),
            error: (failure) => const Text('Error'),
          ),
        );
      },
    );
  }
}
