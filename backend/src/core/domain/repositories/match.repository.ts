import { SwipeAction } from "../value-objects/swipe-action.enum";

export interface MatchSuggestion {
  userId: string;
  name: string;
  avatarUrl?: string;
  bio?: string;
  age?: number;
  cryptoInterests: string[];
}

export interface Match {
  id: string;
  userId: string;
  matchedUserId: string;
  matchedUserName: string;
  matchedUserAvatarUrl?: string;
  matchedUserBio?: string;
  matchedAt: Date;
}

export interface FeedFilters {
  excludeUserIds: string[];
  maxDistanceKm: number;
  minAge?: number;
  maxAge?: number;
  filterByCryptoInterests?: boolean;
  currentUserInterests?: string[];
  profileVisible?: boolean;
}

export abstract class MatchRepository {
  abstract getFeed(
    userId: string,
    filters: FeedFilters,
  ): Promise<MatchSuggestion[]>;
  /**
   * Records the swipe. Returns the resulting Match if a like pair is completed.
   * Throws ConflictError if the same pair already swiped.
   */
  abstract swipe(
    actorUserId: string,
    targetUserId: string,
    action: SwipeAction,
  ): Promise<Match | null>;
  abstract getMatchesByUserId(userId: string): Promise<Match[]>;
  abstract findExistingSwipe(
    actorUserId: string,
    targetUserId: string,
  ): Promise<SwipeAction | null>;
  abstract matchExists(userAId: string, userBId: string): Promise<boolean>;
}
