class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.text :description
      t.string :instagram
      t.string :website

      t.timestamps
    end
  end
end
