class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.boolean :is_up
      t.references :idea, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
