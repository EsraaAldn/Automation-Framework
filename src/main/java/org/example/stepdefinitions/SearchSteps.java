package org.example.stepdefinitions;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.example.pageobjects.SearchPage;
import org.junit.jupiter.api.Assertions;

public class SearchSteps {

    private SearchPage searchPage = new SearchPage();

    @Given("I am on the search page")
    public void i_am_on_the_search_page() {
        searchPage.open();
    }

    @When("I search for {string}")
    public void i_search_for(String term) {
        searchPage.search(term);
    }

    @Then("I should see results related to {string}")
    public void i_should_see_results_related_to(String term) {
        Assertions.assertTrue(searchPage.getResults().contains(term));
    }

    @Then("I should see a message {string}")
    public void i_should_see_a_message(String message) {
        Assertions.assertTrue(searchPage.getResultsMessage().contains(message));
    }

    @Then("I should see search suggestions containing {string}")
    public void i_should_see_search_suggestions_containing(String suggestion) {
        Assertions.assertTrue(searchPage.getSuggestions().contains(suggestion));
    }

    @Then("I should see search results")
    public void i_should_see_search_results() {
        Assertions.assertFalse(searchPage.getResults().isEmpty());
    }

    @Then("I should see pagination controls")
    public void i_should_see_pagination_controls() {
        Assertions.assertTrue(searchPage.isPaginationDisplayed());
    }

    @When("I click on the next page")
    public void i_click_on_the_next_page() {
        searchPage.clickNextPage();
    }

    @When("I search for an empty string")
    public void i_search_for_an_empty_string() {
        searchPage.search("");
    }

    @When("I search for a very long string of {int} characters")
    public void i_search_for_a_very_long_string_of_characters(int length) {
        String longString = "a".repeat(length);
        searchPage.search(longString);
    }

    @When("I sort the results by date")
    public void i_sort_the_results_by_date() {
        searchPage.sortByDate();
    }

    @When("I filter the results by {string}")
    public void i_filter_the_results_by(String filter) {
        searchPage.filterResultsBy(filter);
    }
}
