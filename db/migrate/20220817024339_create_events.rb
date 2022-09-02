class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :status_a
      t.string :status_b
      t.string :status_c
      t.string :status_d
     
      t.string :date

      t.string :time

      t.timestamps
    end
  end
end
