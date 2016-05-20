class CreateSliders < ActiveRecord::Migration
  def change
    create_table :sliders do |t|
      t.string :image
      t.string :title

      t.timestamps null: false
    end
  end
end
