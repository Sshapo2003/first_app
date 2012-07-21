Given /I have deposited \$(\d+) in my (\w+) Account/ do |amount, account_type|
# TODO: code goes here
end
When /^I transfer \$(\d+) from my Savings Account into my (\w+) Account$/ do
|acc, account_type|
puts "acc:#{acc}"
puts "account_type:#{account_type}"
end

