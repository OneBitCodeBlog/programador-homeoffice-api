class ChangeDefaultForJobContract < ActiveRecord::Migration[6.0]
  def change
    change_column :jobs, :contract, :integer, default: 0
  end
end
