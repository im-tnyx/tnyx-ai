sealed class AiRecentChatAction {
  const AiRecentChatAction();
}

class AiChatSelected extends AiRecentChatAction {
  final String chatId;
  const AiChatSelected(this.chatId);
}

class AiNewChatClicked extends AiRecentChatAction {
  const AiNewChatClicked();
}
