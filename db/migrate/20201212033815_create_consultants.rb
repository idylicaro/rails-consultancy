# frozen_string_literal: true

class CreateConsultants < ActiveRecord::Migration[6.1]
  def change
    create_table :consultants do |t|
      t.string :name
      t.integer :rating

      t.timestamps
    end
  end
end
