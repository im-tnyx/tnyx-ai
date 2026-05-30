import 'package:tnyx_mobile/src/features/main_navigation/presentation/state/shell_ui_state.dart';

sealed class ShellAction {
  const ShellAction();
}

class ShellTabSelected extends ShellAction {
  final ShellTab tab;
  const ShellTabSelected(this.tab);
}

class ShellScrollChanged extends ShellAction {
  final double offset;
  const ShellScrollChanged(this.offset);
}

class ShellPremiumClicked extends ShellAction {
  const ShellPremiumClicked();
}

class ShellStreakClicked extends ShellAction {
  const ShellStreakClicked();
}

class ShellProfileClicked extends ShellAction {
  const ShellProfileClicked();
}
