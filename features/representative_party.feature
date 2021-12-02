Feature: Look up San Diego's local representative's political party

  As progressive voter living in San Diego
  So that I can learn about the political views of my local representative
  I want to look up my representative's political party
 
Scenario: Look up a representative's political party
  Given I am currently on the ActiveMap home page

  When I follow "Representatives"

  Then I should be currently on the "search" page

  When I fill in "address" with "9887 Longfellow St San Diego, CA 92154"

  And I press "Search"

  Then I should be currently on the "Representative" page

  When I follow "Scott H. Peters"
  
  Then I should be currently on the "Scott H. Peters" page
  
  Then I should see "Political Party:"