class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.boolean :status
      t.belongs_to :sender
      t.belongs_to :recipient
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
