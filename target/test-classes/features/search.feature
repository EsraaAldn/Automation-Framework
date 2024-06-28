Feature: Search functionality

  Scenario: Search with a valid term
    Given I am on the search page
    When I search for "selenium webdriver"
    Then I should see results related to "selenium webdriver"

  Scenario: Search with an invalid term
    Given I am on the search page
    When I search for "dfdf"
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

  Scenario: Search results with category filters
    Given I am on the search page
    When I search for "selenium webdriver"
    And I filter the results by category "Books"
    Then I should see only books related to "selenium webdriver"

  Scenario: Search results with date range filter
    Given I am on the search page
    When I search for "selenium webdriver"
    And I filter the results by date range from "2023-01-01" to "2023-12-31"
    Then I should see only results related to "selenium webdriver" within the specified date range

  Scenario: Search with exact phrase
    Given I am on the search page
    When I search for the exact phrase "selenium automation"
    Then I should see results containing the exact phrase "selenium automation"

  Scenario: Search with multiple words
    Given I am on the search page
    When I search for "selenium java"
    Then I should see results containing both "selenium" and "java"
    And I should see results containing either "selenium" or "java"

  Scenario: Search with multiple filters
    Given I am on the search page
    When I search for "selenium webdriver"
    And I filter the results by "Articles" and by date range from "2023-01-01" to "2023-12-31"
    Then I should see only articles related to "selenium webdriver" within the specified date range

  Scenario: Verify search results count
    Given I am on the search page
    When I search for "selenium webdriver"
    Then I should see a count of the search results displayed

  Scenario: Verify search result titles
    Given I am on the search page
    When I search for "selenium webdriver"
    Then each search result title should contain the term "selenium" or "webdriver"

  Scenario: Verify search result descriptions
    Given I am on the search page
    When I search for "selenium webdriver"
    Then each search result description should contain the term "selenium" or "webdriver"

  Scenario: Verify search result links
    Given I am on the search page
    When I search for "selenium webdriver"
    Then each search result should have a clickable link

  Scenario: Verify search result images
    Given I am on the search page
    When I search for "selenium webdriver"
    Then each search result should have an associated image

  Scenario: Verify search result authors
    Given I am on the search page
    When I search for "selenium webdriver"
    Then each search result should display the author's name

  Scenario: Verify search result publication dates
    Given I am on the search page
    When I search for "selenium webdriver"
    Then each search result should display the publication date

  Scenario: Verify search with exact match
    Given I am on the search page
    When I search for the exact match "selenium"
    Then I should see results that exactly match the term "selenium"
