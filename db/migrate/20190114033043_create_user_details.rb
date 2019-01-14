class CreateUserDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :user_details do |t|
      t.references :user
      t.string :address_line_1
      t.string :address_line_2
      t.string :address_line_3

      t.timestamps
    end
  end
end
