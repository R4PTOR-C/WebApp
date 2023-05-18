class User < ApplicationRecord
  before_create :initialize_wallet_balance
  has_and_belongs_to_many :produtos
  def add_to_wallet(amount)
    self.wallet_balance += amount
    save
  end

  def deduct_from_wallet(amount)
    if self.wallet_balance >= amount
      self.wallet_balance -= amount
      save
    else
      errors.add(:wallet_balance, 'Insufficient balance')
      false
    end
  end

  private

  def initialize_wallet_balance
    self.wallet_balance ||= 0.0
  end

end
