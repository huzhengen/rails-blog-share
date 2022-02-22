class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :description
      t.text :content
      t.boolean :at_index

      t.timestamps
    end

    add_index :blogs, [:title]
  end
end
