#---
# Excerpted from "The Cucumber Book",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/hwcuc for more book information.
#---
class Account
  def deposit(amount)
    @balance = amount
  end
  
  def balance
    @balance
  end
end

class ATM
  def initialize(cash_slot)
    @cash_slot = cash_slot
  end
  
  def withdraw_from(account, amount)
    account.debit(amount)
    @cash_slot.dispense(amount)
  end
end

class CashSlot
  def contents
    @contents or raise("I'm empty!")
  end
  
  def dispense(amount)
    @contents = amount
  end
end

require 'sinatra'

set :raise_errors, :true

get '/' do
  %{ 
  <html>
    <body>
      <form action="/" method="post">
      <label for="amount">Amount</label>
      <input type="text" id="amount" name="amount">
      <button type="submit">Withdraw</button>
    </body>
  </html>
  }
end

set :cash_slot, CashSlot.new

post '/' do
  atm = ATM.new(settings.cash_slot)
  atm.withdraw_from(nil, params[:amount].to_i)
  "Please take your card and wait for your cash"
end
