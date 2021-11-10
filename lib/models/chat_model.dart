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
      "https://scontent.fbki2-1.fna.fbcdn.net/v/t1.6435-1/p200x200/60335881_2140310806016670_3747567555141697536_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=7206a8&_nc_ohc=Z1jKtjCCNgwAX_dmgT5&tn=wfPvW8tgETo93Trs&_nc_ht=scontent.fbki2-1.fna&oh=0165453776c5215d446d944fc6a80649&oe=61A2BD40",
      false,
      "12"),
  ChatModel(
      "Julia",
      "Good morning.",
      "Yesterday",
      "https://scontent.fbki2-1.fna.fbcdn.net/v/t1.6435-1/p200x200/246623736_4675990345797636_8727313342613173353_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=7206a8&_nc_ohc=x1NwWLYyrOoAX8cbLnd&_nc_ht=scontent.fbki2-1.fna&oh=ed41dc36712f5fa1f2823389e0aaed4d&oe=61A32573",
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
      "https://scontent.fbki2-1.fna.fbcdn.net/v/t1.6435-9/242053278_4516218115066169_8403954344845290014_n.jpg?_nc_cat=100&_nc_rgb565=1&ccb=1-5&_nc_sid=b9115d&_nc_ohc=zTZFiLAnflkAX9WC7vU&_nc_oc=AQk9WwMSCEh8p8-O1eU03t_oiNnurUDSurxs3KNyUACpHlzfIXiWdN9562_pIPH6pXPRuppdiS4Tz2YliyaKEHq2&_nc_ht=scontent.fbki2-1.fna&oh=6c52af57615dbf8e1cf96b0a24aa28d5&oe=61A2C429",
      true,
      "777"),
  ChatModel(
      "Dinner",
      "It's dinner time. Wooohooo. I can't wait to try the sushi at the restaurant.",
      "18/10/2021",
      "https://i.imgur.com/dGJSYcO.jpeg",
      true,
      "999+"),
];
