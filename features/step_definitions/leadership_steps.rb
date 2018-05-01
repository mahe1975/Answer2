Given(/^Launch MailChimps web page$/) do
  MailChimps::UI.launch
end

When(/^Navigate to MailChimps about page$/) do
  MailChimps::UI.navigate_about
end

Then(/^Add leadership team members info into a csv file$/) do
  MailChimps::UI.add_members
end

