# encoding: UTF-8

Given /^the following rooms:$/ do |rooms|
  Room.create!(rooms.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) room$/ do |pos|
  visit rooms_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Löschen"
  end
end

Then /^I should see the following rooms:$/ do |expected_rooms_table|
  expected_rooms_table.diff!(tableish('table tr', 'td,th'))
end
