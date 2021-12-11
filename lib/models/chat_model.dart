class ChatModel {
  final String name;
  final String message;
  final String time;
  final String avatarUrl;
  final bool muteStatus;
  final String notificationNumber;

  ChatModel(this.name, this.message, this.time, this.avatarUrl, this.muteStatus,
      this.notificationNumber);
}

List<ChatModel> dummyChatsData = [
  ChatModel(
      "Sean Gray",
      "This is a clone of the WhatsApp app. Do let me know what you think. If you like it, please give me star.",
      "8:30 AM",
      "https://scontent.fbki2-1.fna.fbcdn.net/v/t1.6435-1/p480x480/60335881_2140310806016670_3747567555141697536_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=7206a8&_nc_ohc=Eb7Oe6Vgm94AX9hiQ7a&_nc_ht=scontent.fbki2-1.fna&oh=74933fd0903f6489dcbbf255d234f605&oe=61C82AD4",
      false,
      "12"),
  ChatModel(
      "Julia",
      "Good morning.",
      "Yesterday",
      "https://scontent.fbki2-1.fna.fbcdn.net/v/t39.30808-1/p480x480/241461495_4675990335797637_2638867654219391877_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=7206a8&_nc_ohc=Ef73PRmKSz4AX--rMOA&_nc_ht=scontent.fbki2-1.fna&oh=dfe0f1575d5eadcfe7ad0471bee10a87&oe=61A83116",
      false,
      "5"),
  ChatModel(
      "Lai",
      "Good night.",
      "Yesterday",
      "https://scontent.fbki2-1.fna.fbcdn.net/v/t1.6435-1/p200x200/147293167_3647732325344620_3763331736988746944_n.jpg?_nc_cat=111&ccb=1-5&_nc_sid=7206a8&_nc_ohc=HsM_YgdBnoIAX-Q1C3P&_nc_ht=scontent.fbki2-1.fna&oh=1e52906ea2c831f7bc64c69cf68be1f0&oe=61A4D41D",
      false,
      "0"),
  ChatModel(
      "Yii",
      "Let's go.",
      "Yesterday",
      "https://scontent.fbki2-1.fna.fbcdn.net/v/t1.18169-1/p200x200/13245318_10201576524930365_1176465319036240789_n.jpg?_nc_cat=111&ccb=1-5&_nc_sid=7206a8&_nc_ohc=sbsjaBNbzR8AX9eGxzZ&_nc_ht=scontent.fbki2-1.fna&oh=b0d2357150117480a236e93db0b9d690&oe=61A3E8A5",
      true,
      "17"),
  ChatModel(
      "Wong",
      "How are you today?",
      "Yesterday",
      "https://scontent.fbki2-1.fna.fbcdn.net/v/t31.18172-1/p200x200/23004754_10209049402507035_1404459135831782870_o.jpg?_nc_cat=101&ccb=1-5&_nc_sid=7206a8&_nc_ohc=11ZaRFa9_yEAX_z5Oog&_nc_ht=scontent.fbki2-1.fna&oh=5614abab39ac581e375f7cd4f97c12d1&oe=61A57B7C",
      true,
      "20"),
  ChatModel(
      "Ting",
      "So what's the plan today?",
      "Yesterday",
      "https://scontent.fbki2-1.fna.fbcdn.net/v/t1.6435-1/p200x200/51442644_2107722085956424_8173265344870219776_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=7206a8&_nc_ohc=GYV2YSdnTA4AX_MuRYI&_nc_ht=scontent.fbki2-1.fna&oh=081a898b6bc344b658748792df229457&oe=61A4A62E",
      true,
      "500"),
  ChatModel(
      "Lunch",
      "Let's get going. We are starving.",
      "19/10/2021",
      "https://scontent.fkul16-1.fna.fbcdn.net/v/t1.15752-9/p100x100/81768388_2433758846940336_7956456821697282048_n.png?_nc_cat=108&ccb=1-5&_nc_sid=4de414&_nc_ohc=YLTTOSTIhJoAX9msdrZ&_nc_ht=scontent.fkul16-1.fna&oh=0dd7f2ee33bd7bf008840b2b3bfb9c61&oe=61B74ECC",
      true,
      "777"),
  ChatModel(
      "Dinner",
      "It's dinner time. Wooohooo. I can't wait to try the sushi at the restaurant.",
      "18/10/2021",
      "https://scontent.fkul16-1.fna.fbcdn.net/v/t1.15752-9/p100x100/81768388_2433758846940336_7956456821697282048_n.png?_nc_cat=108&ccb=1-5&_nc_sid=4de414&_nc_ohc=YLTTOSTIhJoAX9msdrZ&_nc_ht=scontent.fkul16-1.fna&oh=0dd7f2ee33bd7bf008840b2b3bfb9c61&oe=61B74ECC",
      true,
      "999+"),
];
