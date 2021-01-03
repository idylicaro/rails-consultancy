# frozen_string_literal: true

class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :cep

      t.timestamps
    end
  end
end
