# frozen_string_literal: true

class CreateConsultancies < ActiveRecord::Migration[6.1]
  def change
    create_table :consultancies do |t|
      t.integer :client_id
      t.integer :consultant_id
      t.datetime :end_date
      t.integer :rating
      t.boolean :closed

      t.timestamps
    end
  end
end
