trigger phonechangetriggeraccount on Account (before insert) {
      phonechange.accountphonechange(trigger.oldmap, trigger.newmap);
}