class AddTotalConsultanciesToConsultant < ActiveRecord::Migration[6.1]
  def change
    add_column :consultants, :total_consultancies, :integer
  end
end
