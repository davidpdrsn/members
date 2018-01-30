class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :first_name, null: false
      t.string :middle_name, null: false
      t.string :last_name, null: false
      t.date :date_of_birth, null: false
      t.integer :membership_type, null: false
      t.timestamps
    end
  end
end
