class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :nick_name
      t.string :first_name
      t.string :sur_name
      t.string :hashed_password
      t.string :salt

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
