import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahalli/core/presentation/l10n_ext.dart';
import 'package:mahalli/core/presentation/watch_list_cubit.dart';
import 'package:mahalli/core/widgets/state_views.dart';

/// Standard list screen body: loading / error / empty / list, plus the
/// "show inactive" filter. Used by categories, products and services.
class WatchListView<C extends WatchListCubit<T>, T> extends StatelessWidget {
  const WatchListView({
    super.key,
    required this.itemBuilder,
    required this.emptyIcon,
    required this.emptyTitle,
    required this.emptyHint,
  });
  final Widget Function(BuildContext context, T item) itemBuilder;
  final IconData emptyIcon;
  final String emptyTitle;
  final String emptyHint;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<C, ListState<T>>(
      builder: (context, s) {
        final l = context.l10n;
        return Column(
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 16, top: 8),
                child: FilterChip(
                  label: Text(l.showInactive),
                  selected: s.includeInactive,
                  onSelected: context.read<C>().setIncludeInactive,
                ),
              ),
            ),
            Expanded(
              child: switch (s.status) {
                ListStatus.loading => const Center(
                  child: CircularProgressIndicator(),
                ),
                ListStatus.error => ErrorView(
                  message: l.genericError,
                  onRetry: context.read<C>().reload,
                ),
                ListStatus.loaded when s.items.isEmpty => EmptyState(
                  icon: emptyIcon,
                  title: emptyTitle,
                  hint: emptyHint,
                ),
                _ => ListView.separated(
                  padding: const EdgeInsets.only(bottom: 96),
                  itemCount: s.items.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (c, i) => itemBuilder(c, s.items[i]),
                ),
              },
            ),
          ],
        );
      },
    );
  }
}
