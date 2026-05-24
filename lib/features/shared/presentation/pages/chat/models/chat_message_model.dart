enum ChatMessageSender { expert, user }

class ChatMessage {
  const ChatMessage({
    required this.text,
    required this.time,
    required this.sender,
    this.isRead = false,
  });

  final String text;
  final String time;
  final ChatMessageSender sender;
  final bool isRead;
}

const chatMessages = [
  ChatMessage(
    text: 'Good morning! How can I help you with your financial planning today?',
    time: '10:30 AM',
    sender: ChatMessageSender.expert,
  ),
  ChatMessage(
    text: "Hi Omar, I'd like to discuss my retirement planning strategy.",
    time: '10:32 AM',
    sender: ChatMessageSender.user,
    isRead: true,
  ),
  ChatMessage(
    text:
        "That's a great goal. I'd recommend starting with an emergency fund first, typically 3-6 months of expenses.",
    time: '10:33 AM',
    sender: ChatMessageSender.expert,
  ),
  ChatMessage(
    text:
        'That makes sense. I currently have about 2 months saved. What would you suggest?',
    time: '10:34 AM',
    sender: ChatMessageSender.user,
    isRead: true,
  ),
];
