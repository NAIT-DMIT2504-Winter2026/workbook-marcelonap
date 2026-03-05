import 'package:flutter/material.dart';
import 'app_state.dart';

// We wrote this "boilerplate" class, to be able to inject our ApplicationState
// Not needed if we use --> Provider package
class AppStateProvider extends InheritedNotifier<ApplicationState> {
  const AppStateProvider({
    super.key,
    required ApplicationState appState,
    required Widget child,
  }) : super(notifier: appState, child: child);

  static AppStateProvider? maybeOf(BuildContext context) {
    // Finds a AppStateProviderin the widget tree
    return context.dependOnInheritedWidgetOfExactType<AppStateProvider>();
  }

  static ApplicationState of(BuildContext context) {
    // Check if we have an AppStateProvider in our widget tree
    final result = maybeOf(context);

    if (result == null || result.notifier == null) {
      throw StateError('No applicationState notifier found in context');
    }
    //if we do, return its notifier, which is what we actually want to inject
    return result.notifier!;
  }
}
