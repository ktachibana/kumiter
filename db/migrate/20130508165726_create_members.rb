class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.references :event, index: true, null: false
      t.string :name

      t.timestamps
    end
  end
end
