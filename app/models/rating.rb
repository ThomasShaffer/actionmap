# frozen_string_literal: true

class Rating < ApplicationRecord
    belongs_to :news_item
    belongs_to :user
    @ratings = [1, 2, 3, 4, 5]
    def ratings_list
        @ratings
    end
end
