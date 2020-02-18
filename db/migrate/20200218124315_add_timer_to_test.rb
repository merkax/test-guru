class AddTimerToTest < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :timer, :integer, null: false, default: 20
  end
end
