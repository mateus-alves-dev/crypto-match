export enum SwipeAction {
  LIKE = "like",
  DISLIKE = "dislike",
  SUPER_LIKE = "superLike",
}

/** Cost in CMT tokens for each spending swipe action. */
export const SWIPE_COSTS: Partial<Record<SwipeAction, number>> = {
  [SwipeAction.SUPER_LIKE]: 10,
};
