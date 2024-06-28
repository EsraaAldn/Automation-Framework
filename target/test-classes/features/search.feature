Feature: Search functionality

  Scenario: Search with a valid term
    Given I am on the search page
    When I search for "selenium webdriver"
    Then I should see results related to "selenium webdriver"

  Scenario: Search with an invalid term
    Given I am on the search page
    When I search for "aslkdjaslkdjasd"
    Then I should see a message "No results found"

  Scenario: Search with special characters
    Given I am on the search page
    When I search for "@#%&*!"
    Then I should see a message "No results found"

  Scenario: Search with suggestions
    Given I am on the search page
    When I type "selen"
    Then I should see search suggestions containing "selen"

  Scenario: Search results pagination
    Given I am on the search page
    When I search for "java programming"
    Then I should see search results
    And I should see pagination controls
    When I click on the next page
    Then I should see the next set of search results
    And I should see pagination controls

  Scenario: Search with empty input
    Given I am on the search page
    When I search for an empty string
    Then I should see a message "Please enter a search term"

  Scenario: Search with SQL injection attempt
    Given I am on the search page
    When I search for "'; DROP TABLE users;--"
    Then I should see a message "No results found" or "Invalid search term"

  Scenario: Search with a very long string
    Given I am on the search page
    When I search for a very long string of 256 characters
    Then I should see a message "Search term too long"

  Scenario: Search results sorted by relevance
    Given I am on the search page
    When I search for "selenium webdriver"
    Then I should see results related to "selenium webdriver"
    And the results should be sorted by relevance

  Scenario: Search results sorted by date
    Given I am on the search page
    When I search for "latest news"
    And I sort the results by date
    Then I should see the most recent results first

  Scenario: Search results with filters
    Given I am on the search page
    When I search for "selenium webdriver"
    And I filter the results by "Articles"
    Then I should see only articles related to "selenium webdriver"
