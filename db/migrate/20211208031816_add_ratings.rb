class AddRatings < ActiveRecord::Migration[5.2]
  def up 
    create_table :ratings do |t|
        t.integer :rating
        t.belongs_to :news_item, :index_news_items_to_representative_id
        t.belongs_to :user, :uid
    end
  end
end
