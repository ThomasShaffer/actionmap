Feature: Accessibility Testing
    The page should pass all accessibility tests
    so that all users have the best experience possible.

Scenario: Home Page
    Given I am on the root page
    Then the page should be axe clean according to: 'wcag2aa'

# TODO: Add other pages here.
