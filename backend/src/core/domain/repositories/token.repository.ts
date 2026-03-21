import { TokenTransactionType } from "../value-objects/token-reason.enum";

export interface TokenBalance {
  userId: string;
  balance: number;
  updatedAt: Date;
}

export interface TokenTransaction {
  id: string;
  userId: string;
  type: TokenTransactionType;
  amount: number;
  reason: string;
  metadata?: Record<string, unknown>;
  createdAt: Date;
}

export interface CreditInput {
  userId: string;
  amount: number;
  reason: string;
  metadata?: Record<string, unknown>;
}

export interface DebitInput {
  userId: string;
  amount: number;
  reason: string;
  metadata?: Record<string, unknown>;
}

export abstract class TokenRepository {
  abstract getBalance(userId: string): Promise<TokenBalance>;
  abstract getHistory(userId: string): Promise<TokenTransaction[]>;
  /**
   * Credits the user's balance and records the transaction atomically.
   * Creates the balance row if it doesn't exist.
   */
  abstract credit(input: CreditInput): Promise<TokenBalance>;
  /**
   * Debits the user's balance atomically.
   * Throws BusinessRuleError if the resulting balance would be negative.
   */
  abstract debit(input: DebitInput): Promise<TokenBalance>;
  abstract hasClaimedAction(
    userId: string,
    actionKey: string,
  ): Promise<boolean>;
  abstract markActionClaimed(userId: string, actionKey: string): Promise<void>;
}
