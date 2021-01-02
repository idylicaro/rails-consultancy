class ChangeRatingToFloatOnConsultancy < ActiveRecord::Migration[6.1]
  def change
    change_column :consultancies, :rating, :float
  end
end
