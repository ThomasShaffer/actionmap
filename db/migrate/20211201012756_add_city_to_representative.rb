# frozen_string_literal: true

class AddCityToRepresentative < ActiveRecord::Migration[5.2]
    def change
        add_column :representatives, :city, :string
    end
end
