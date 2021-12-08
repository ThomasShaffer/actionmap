# frozen_string_literal: true

class NewsItem < ApplicationRecord
    belongs_to :representative
    has_many :ratings, dependent: :delete_all

    def self.find_for(representative_id)
        NewsItem.find_by(
            representative_id: representative_id
        )
    end

    def self.find_rating(article_id)
        NewsItem.Item.find_by(article_id: article_id)
    end
end
