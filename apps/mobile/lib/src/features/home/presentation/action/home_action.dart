sealed class HomeAction {
  const HomeAction();
}

class HomeRefreshRequested extends HomeAction {
  const HomeRefreshRequested();
}

// Kept for internal feature actions if needed in future
class HomeInternalAction extends HomeAction {
  const HomeInternalAction();
}
