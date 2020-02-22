class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :image, default: "https://image.flaticon.com/icons/png/128/1579/1579489.png"
      t.string :rule
      t.string :value

      t.timestamps
    end
  end
end
