# frozen_string_literal: true

Given(/I am currently on the ActiveMap home page/) do
    visit '/'
end

Given(/I should be currently on the (.+) page/) do |page_name|
    case page_name
    when 'search'
        visit '/search'
    when 'Representative'
        visit '/representatives'
    when 'Scott H. Peters'
        t_id = Representative.where(name: 'Scott H. Peters')
        visit "/representatives/#{t_id}"
    end
end
