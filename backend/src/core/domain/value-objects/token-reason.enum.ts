/**
 * Reasons for token credits and debits.
 * Used as the `reason` field in TokenTransaction records.
 * Keep values lowercase_snake for readability in ledger history.
 */
export enum TokenReason {
  // Credits
  DAILY_CHECKIN = "daily_checkin",
  COMPLETE_PROFILE = "complete_profile",
  INVITE_FRIEND = "invite_friend",
  NEW_MATCH = "new_match",
  MISSION_REWARD = "mission_reward",
  WEEKLY_RANK_1ST = "weekly_rank_1st",
  WEEKLY_RANK_2ND = "weekly_rank_2nd",
  WEEKLY_RANK_3RD = "weekly_rank_3rd",

  // Debits
  SUPER_LIKE = "super_like",
  STREAK_SHIELD = "streak_shield",
  SEND_GIFT = "send_gift",
  PROFILE_BOOST = "profile_boost",
}

export enum TokenTransactionType {
  CREDIT = "CREDIT",
  DEBIT = "DEBIT",
}
