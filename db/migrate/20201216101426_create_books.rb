class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.timestamps
    end

    add_reference :books, :author, foreign_key: { to_table: :users }
  end
end
