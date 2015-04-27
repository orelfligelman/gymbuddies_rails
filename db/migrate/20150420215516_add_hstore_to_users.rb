class AddHstoreToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
    t.hstore :properties
    end
  end
end
