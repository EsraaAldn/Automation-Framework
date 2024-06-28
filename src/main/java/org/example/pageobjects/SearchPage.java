package org.example.pageobjects;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import java.util.List;
import java.util.stream.Collectors;

public class SearchPage {
    private WebDriver driver;

    public SearchPage() {
        System.setProperty("webdriver.chrome.driver", "/Users/esraa/Desktop/chromedriver");
        driver = new ChromeDriver();
    }

    public void open() {
        driver.get("https://example.com/search");
    }

    public void search(String term) {
        WebElement searchBox = driver.findElement(By.name("q"));
        searchBox.sendKeys(term);
        searchBox.submit();
    }

    public List<String> getResults() {
        List<WebElement> results = driver.findElements(By.cssSelector(".result"));
        return results.stream().map(WebElement::getText).collect(Collectors.toList());
    }

    public String getResultsMessage() {
        WebElement message = driver.findElement(By.id("resultsMessage"));
        return message.getText();
    }

    public List<String> getSuggestions() {
        List<WebElement> suggestions = driver.findElements(By.cssSelector(".suggestion"));
        return suggestions.stream().map(WebElement::getText).collect(Collectors.toList());
    }

    public boolean isPaginationDisplayed() {
        return driver.findElement(By.cssSelector(".pagination")).isDisplayed();
    }

    public void clickNextPage() {
        driver.findElement(By.cssSelector(".pagination .next")).click();
    }

    public void sortByDate() {
        // Find the sort dropdown or button and click to sort by date
        WebElement sortByDateButton = driver.findElement(By.id("sort-by-date"));
        sortByDateButton.click();
    }

    public void filterResultsBy(String filter) {
        // Find the filter dropdown or checkbox and apply the specified filter
        WebElement filterDropdown = driver.findElement(By.id("filter-dropdown"));
        filterDropdown.click();
        WebElement filterOption = driver.findElement(By.xpath("//option[text()='" + filter + "']"));
        filterOption.click();
    }
}
