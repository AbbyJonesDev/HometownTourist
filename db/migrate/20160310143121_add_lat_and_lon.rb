class AddLatAndLon < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.float :lat, null: false
      t.float :lon, null: false
    end

    change_table :stops do |t|
      t.float :lat, null: false
      t.float :lon, null: false
    end
  end
end
