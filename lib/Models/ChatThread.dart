class ChatThread{
  int thread_id;
  int chatting_with_id;
  String chatting_with_name;
  List messages;
  String chatting_with_avatarUrl = '-';
  DateTime last_message_time;

  ChatThread({required this.chatting_with_id,required this.chatting_with_name,required this.messages,required this.chatting_with_avatarUrl, required this.last_message_time, required this.thread_id});
}