Feature: Manage rooms
  In order to assign rooms to workshops
  the administrator
  wants to manage the possible rooms for workshops
  
  Scenario: Register new room [German]
    Given I am on the new room page
    When I fill in "Name" with "Seminarraum 11"
    And I fill in "Ort" with "Hauptgebäude, 1.OG links"
    And I fill in "Fassungsvermögen" with "127"
    And I press "Räumlichkeit erstellen"
    Then I should see "Seminarraum 11"
    And I should see "Hauptgebäude, 1.OG links"
    And I should see "127"

  Scenario: Delete room [German]
    Given the following rooms:
      |name|location|capacity|
      |name 1|location 1|101|
      |name 2|location 2|102|
      |name 3|location 3|103|
      |name 4|location 4|104|
    When I delete the 3rd room
    Then I should see the following rooms:
      |Name|Ort|Fassungsvermögen|
      |name 1|location 1|101|
      |name 2|location 2|102|
      |name 4|location 4|104|
