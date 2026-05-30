import 'package:flutter/material.dart';
import 'package:tnyx_mobile/src/core/theme/tokens/app_dimens.dart';
import 'package:tnyx_mobile/src/features/ai_recent_chat/presentation/action/ai_recent_chat_action.dart';
import 'package:tnyx_mobile/src/features/ai_recent_chat/presentation/view_model/ai_recent_chat_view_model.dart';

class AiRecentChatDrawer extends StatefulWidget {
  const AiRecentChatDrawer({super.key});

  @override
  State<AiRecentChatDrawer> createState() => _AiRecentChatDrawerState();
}

class _AiRecentChatDrawerState extends State<AiRecentChatDrawer> {
  late final AiRecentChatViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = AiRecentChatViewModel();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth * 0.75,
      child: Drawer(
        backgroundColor: colors.surface,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: AnimatedBuilder(
          animation: _viewModel,
          builder: (context, _) {
            final state = _viewModel.uiState;
            return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Header
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                    child: Row(
                      children: [
                        Text(
                          'Conversations',
                          style: textTheme.titleMedium?.copyWith(
                            color: colors.onSurface,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: Icon(
                            Icons.add_circle_outline_rounded, 
                            color: colors.onSurface.withOpacity(0.7),
                          ),
                          onPressed: () => _viewModel.onAction(const AiNewChatClicked()),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: colors.outlineVariant, height: 1),

                  // 2. Chat List
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      itemCount: state.chats.length,
                      itemBuilder: (context, index) {
                        return _ChatTile(
                          title: state.chats[index],
                          onTap: () {
                            _viewModel.onAction(AiChatSelected(state.chats[index]));
                            Navigator.of(context).pop();
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ChatTile extends StatelessWidget {
  const _ChatTile({required this.title, required this.onTap});
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return ListTile(
      onTap: onTap,
      leading: Icon(
        Icons.chat_bubble_outline_rounded, 
        color: colors.onSurfaceVariant.withOpacity(0.4), 
        size: 20,
      ),
      title: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: textTheme.bodyMedium?.copyWith(
          color: colors.onSurface.withOpacity(0.7),
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      visualDensity: VisualDensity.compact,
    );
  }
}
