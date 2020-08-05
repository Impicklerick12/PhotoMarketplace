class CreateReview < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :review
      t.references :user, null: false, foreign_key: true
    end
  end
end
