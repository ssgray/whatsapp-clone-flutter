class CallModel {
  final String name;
  final String status;
  final String avatarUrl;
  final String time;

  CallModel(this.name, this.status, this.avatarUrl, this.time);
}

List<CallModel> dummyCallsData = [
  CallModel(
      'Ting',
      'Outgoing',
      "https://scontent.fbki2-1.fna.fbcdn.net/v/t1.6435-1/p200x200/51442644_2107722085956424_8173265344870219776_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=7206a8&_nc_ohc=GYV2YSdnTA4AX_MuRYI&_nc_ht=scontent.fbki2-1.fna&oh=081a898b6bc344b658748792df229457&oe=61A4A62E",
      '7:09 PM'),
  CallModel(
      'Julia',
      'Incoming',
      "https://scontent.fbki2-1.fna.fbcdn.net/v/t1.6435-1/p200x200/246623736_4675990345797636_8727313342613173353_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=7206a8&_nc_ohc=x1NwWLYyrOoAX8cbLnd&_nc_ht=scontent.fbki2-1.fna&oh=ed41dc36712f5fa1f2823389e0aaed4d&oe=61A32573",
      '6:09 PM'),
  CallModel(
      'Julia',
      'Incoming',
      "https://scontent.fbki2-1.fna.fbcdn.net/v/t1.6435-1/p200x200/246623736_4675990345797636_8727313342613173353_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=7206a8&_nc_ohc=x1NwWLYyrOoAX8cbLnd&_nc_ht=scontent.fbki2-1.fna&oh=ed41dc36712f5fa1f2823389e0aaed4d&oe=61A32573",
      '3:11 PM'),
  CallModel(
      'Julia',
      'Incoming',
      "https://scontent.fbki2-1.fna.fbcdn.net/v/t1.6435-1/p200x200/246623736_4675990345797636_8727313342613173353_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=7206a8&_nc_ohc=x1NwWLYyrOoAX8cbLnd&_nc_ht=scontent.fbki2-1.fna&oh=ed41dc36712f5fa1f2823389e0aaed4d&oe=61A32573",
      '11:52 AM'),
  CallModel(
      'Wong',
      'Incoming',
      "https://scontent.fbki2-1.fna.fbcdn.net/v/t31.18172-1/p200x200/23004754_10209049402507035_1404459135831782870_o.jpg?_nc_cat=101&ccb=1-5&_nc_sid=7206a8&_nc_ohc=11ZaRFa9_yEAX_z5Oog&_nc_ht=scontent.fbki2-1.fna&oh=5614abab39ac581e375f7cd4f97c12d1&oe=61A57B7C",
      '10:32 AM'),
  CallModel(
      'Lai',
      'Outgoing',
      "https://scontent.fbki2-1.fna.fbcdn.net/v/t1.6435-1/p200x200/147293167_3647732325344620_3763331736988746944_n.jpg?_nc_cat=111&ccb=1-5&_nc_sid=7206a8&_nc_ohc=HsM_YgdBnoIAX-Q1C3P&_nc_ht=scontent.fbki2-1.fna&oh=1e52906ea2c831f7bc64c69cf68be1f0&oe=61A4D41D",
      '6:09 AM'),
  CallModel(
      'Julia',
      'Outgoing',
      "https://scontent.fbki2-1.fna.fbcdn.net/v/t1.6435-1/p200x200/246623736_4675990345797636_8727313342613173353_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=7206a8&_nc_ohc=x1NwWLYyrOoAX8cbLnd&_nc_ht=scontent.fbki2-1.fna&oh=ed41dc36712f5fa1f2823389e0aaed4d&oe=61A32573",
      'Yesterday'),
  CallModel(
      'Julia',
      'Incoming',
      "https://scontent.fbki2-1.fna.fbcdn.net/v/t1.6435-1/p200x200/246623736_4675990345797636_8727313342613173353_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=7206a8&_nc_ohc=x1NwWLYyrOoAX8cbLnd&_nc_ht=scontent.fbki2-1.fna&oh=ed41dc36712f5fa1f2823389e0aaed4d&oe=61A32573",
      'Yesterday'),
  CallModel(
      'Lai',
      'Outgoing',
      "https://scontent.fbki2-1.fna.fbcdn.net/v/t1.6435-1/p200x200/147293167_3647732325344620_3763331736988746944_n.jpg?_nc_cat=111&ccb=1-5&_nc_sid=7206a8&_nc_ohc=HsM_YgdBnoIAX-Q1C3P&_nc_ht=scontent.fbki2-1.fna&oh=1e52906ea2c831f7bc64c69cf68be1f0&oe=61A4D41D",
      'Yesterday'),
  CallModel(
      'Lai',
      'Incoming',
      "https://scontent.fbki2-1.fna.fbcdn.net/v/t1.6435-1/p200x200/147293167_3647732325344620_3763331736988746944_n.jpg?_nc_cat=111&ccb=1-5&_nc_sid=7206a8&_nc_ohc=HsM_YgdBnoIAX-Q1C3P&_nc_ht=scontent.fbki2-1.fna&oh=1e52906ea2c831f7bc64c69cf68be1f0&oe=61A4D41D",
      'Friday'),
  CallModel(
      'Ting',
      'Outgoing',
      "https://scontent.fbki2-1.fna.fbcdn.net/v/t1.6435-1/p200x200/51442644_2107722085956424_8173265344870219776_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=7206a8&_nc_ohc=GYV2YSdnTA4AX_MuRYI&_nc_ht=scontent.fbki2-1.fna&oh=081a898b6bc344b658748792df229457&oe=61A4A62E",
      'Thursday'),
  CallModel(
      'Ting',
      'Outgoing',
      "https://scontent.fbki2-1.fna.fbcdn.net/v/t1.6435-1/p200x200/51442644_2107722085956424_8173265344870219776_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=7206a8&_nc_ohc=GYV2YSdnTA4AX_MuRYI&_nc_ht=scontent.fbki2-1.fna&oh=081a898b6bc344b658748792df229457&oe=61A4A62E",
      '25/10/2021'),
  CallModel(
      'Ting',
      'Outgoing',
      "https://scontent.fbki2-1.fna.fbcdn.net/v/t1.6435-1/p200x200/51442644_2107722085956424_8173265344870219776_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=7206a8&_nc_ohc=GYV2YSdnTA4AX_MuRYI&_nc_ht=scontent.fbki2-1.fna&oh=081a898b6bc344b658748792df229457&oe=61A4A62E",
      '25/2021')
];
