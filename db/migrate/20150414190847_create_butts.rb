class CreateButts < ActiveRecord::Migration
  def change
    create_table :butts do |t|
      t.string :name
      t.string :location
      t.boolean :fart
      t.string :shape
      t.float :percentbodysize

      t.timestamps
    end
  end
end
