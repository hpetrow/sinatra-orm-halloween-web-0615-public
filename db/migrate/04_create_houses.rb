class CreateHouses < ActiveRecord::Migration
  def change
    # create table here
    create_table :houses do |t|
      t.string :address
    end
  end
end
