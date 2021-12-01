# frozen_string_literal: true

class AddStateToRepresentative < ActiveRecord::Migration[5.2]
    def change
        add_column :representatives, :state, :string
    end
end
