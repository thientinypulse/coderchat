class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.belongs_to :fromuser
      t.belongs_to :touser

      t.timestamps null: false
    end
  end
end
