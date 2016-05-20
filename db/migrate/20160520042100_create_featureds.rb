class CreateFeatureds < ActiveRecord::Migration
  def change
    create_table :featureds do |t|
      t.string :image
      t.string :title
      t.text :description
      t.string :link

      t.timestamps null: false
    end
  end
end
