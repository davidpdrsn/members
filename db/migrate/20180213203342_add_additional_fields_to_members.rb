class AddAdditionalFieldsToMembers < ActiveRecord::Migration[5.1]
  def change
    [
      :nationality,
      :address,
      :zip,
      :city,
      :phone,
      :mom_phone,
      :dad_phone,
      :mom_email,
      :dad_email,
    ].each do |field|
      add_column :members, field, :string
    end

    add_column :members, :email, :string, null: false
    add_index :members, :email, unique: true
    add_column :members, :cpr, :integer
    add_column :members, :admission_date, :date, null: false
  end
end
