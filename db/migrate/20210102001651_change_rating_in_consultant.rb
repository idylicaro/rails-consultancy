class ChangeRatingInConsultant < ActiveRecord::Migration[6.1]
  def change
    change_column :consultants, :rating, :float
  end
end
