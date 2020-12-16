class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title

      t.timestamps
    end

    add_reference :posts, :author, foreign_key: { to_table: :users }
  end
end
