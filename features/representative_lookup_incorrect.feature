Feature: Look up representatives using the misspelled address "9887 Longfeloh St San Diego, CA 92154"

  As a poor speller and progressive voter living in San Diego
  So that I can learn my political options
  I want to attempt to look up my representatives

Scenario: Look up representative using a valid address

  Given I am currently on the ActiveMap home page

  When I follow "Representatives"

  Then I should be currently on the "search" page

  When I fill in "address" with "9887 Longfeloh St San Diego, CA 92154"

  And I press "Search"

  Then I should be currently on the "Representative" page

  When I follow "Scott H. Peters"
  
  Then I should be currently on the "Scott H. Peters" page