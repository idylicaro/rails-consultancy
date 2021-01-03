# frozen_string_literal: true

class AddCategoryIdToClient < ActiveRecord::Migration[6.1]
  def change
    add_column :clients, :category_id, :integer
  end
end
