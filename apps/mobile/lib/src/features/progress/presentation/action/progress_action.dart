import 'package:tnyx_mobile/src/features/progress/presentation/state/progress_ui_state.dart';

sealed class ProgressAction {
  const ProgressAction();
}

class ProgressTabSelected extends ProgressAction {
  final ProgressTab tab;
  const ProgressTabSelected(this.tab);
}
