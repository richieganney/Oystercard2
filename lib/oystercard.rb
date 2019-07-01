class Oystercard

attr_accessor :balance

  def initialize(balance=0)
    @balance = balance
  end

  def top_up(amount)
    self.balance += 20.00
  end

end
