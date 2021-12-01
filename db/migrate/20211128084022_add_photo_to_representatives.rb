# frozen_string_literal: true

class AddPhotoToRepresentatives < ActiveRecord::Migration[5.2]
    def change
        add_column :representatives, :photo, :string
    end
end
