#---
# Excerpted from "The Cucumber Book",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/hwcuc for more book information.
#---
Given /^the input "([^"]*)"$/ do |input|
  steps %{
    Given a file named "input.txt" with:
       """
       #{input}
       """
  }
end

When /^the calculator is run$/ do
  steps %{
    When I run `calculator input.txt`
  }
end

When /^the calculator is run with no input$/ do
  steps %{
    When I run `calculator` interactively
  }
end
When /^I enter the calculation "([^"]*)"$/ do |calculation|
  steps %{
    When I type "#{calculation}"
  }
end

Then /^the output should be "([^"]*)"$/ do |output|
  steps %{
    Then it should pass with:
      """
      #{output}
      """
  }
end
