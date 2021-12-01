# frozen_string_literal: true

class AddZipToRepresentative < ActiveRecord::Migration[5.2]
    def change
        add_column :representatives, :zip, :string
    end
end
