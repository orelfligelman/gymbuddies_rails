class AddUserRefToGym < ActiveRecord::Migration
  def change
    add_reference :gyms, :user, index: true
  end
end
