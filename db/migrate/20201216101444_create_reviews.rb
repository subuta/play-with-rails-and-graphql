class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :stars
      t.text :comment
      t.timestamps
    end

    add_reference :reviews, :reviewer, foreign_key: { to_table: :users }
    add_reference :reviews, :book, foreign_key: true
  end
end
