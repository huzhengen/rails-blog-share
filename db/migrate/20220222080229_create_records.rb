class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.integer :amount, null: false
      t.integer :category, null: false, limit: 1
      t.string :notes

      t.timestamps
    end
  end
end
