class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.references :contact, index: true
      t.string :phone_type
      t.string :phone

      t.timestamps
    end
  end
end
