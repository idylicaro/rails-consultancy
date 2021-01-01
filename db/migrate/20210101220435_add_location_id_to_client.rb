class AddLocationIdToClient < ActiveRecord::Migration[6.1]
  def change
    add_column :clients, :location_id, :integer
  end
end
