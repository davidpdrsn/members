class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.belongs_to :member, null: false, index: true
      t.integer :status, null: false
    end
  end
end
