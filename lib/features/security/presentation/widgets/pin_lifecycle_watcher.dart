import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/pin_cubit.dart';
import '../pages/pin_pages.dart';

/// Locks the local session when the app returns after time in the background.
class PinLifecycleWatcher extends StatefulWidget {
  const PinLifecycleWatcher({super.key, required this.child, required this.navigatorKey});
  final Widget child;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  State<PinLifecycleWatcher> createState() => _PinLifecycleWatcherState();
}

class _PinLifecycleWatcherState extends State<PinLifecycleWatcher> with WidgetsBindingObserver {
  DateTime? _backgroundedAt;
  OverlayEntry? _lockOverlay;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _syncOverlay(context.read<PinCubit>().state.status == PinGateStatus.locked);
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _lockOverlay?.remove();
    _lockOverlay?.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused || state == AppLifecycleState.hidden) {
      _backgroundedAt ??= DateTime.now();
    } else if (state == AppLifecycleState.resumed) {
      final backgroundedAt = _backgroundedAt;
      _backgroundedAt = null;
      if (backgroundedAt != null &&
          DateTime.now().difference(backgroundedAt) >= const Duration(minutes: 5)) {
        context.read<PinCubit>().lock();
      }
    }
  }

  void _syncOverlay(bool locked) {
    if (locked && _lockOverlay == null) {
      final overlay = widget.navigatorKey.currentState?.overlay;
      if (overlay == null) return;
      _lockOverlay = OverlayEntry(builder: (_) => const PinLockPage());
      overlay.insert(_lockOverlay!);
    } else if (!locked && _lockOverlay != null) {
      _lockOverlay!.remove();
      _lockOverlay!.dispose();
      _lockOverlay = null;
    }
  }

  @override
  Widget build(BuildContext context) => BlocListener<PinCubit, PinState>(
    listener: (context, pin) => WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _syncOverlay(pin.status == PinGateStatus.locked);
    }),
    child: widget.child,
  );
}
