class CreateContactShare < ActiveRecord::Migration
  def change
    create_table :contact_shares do |t|
      t.integer :contact_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end

    add_index :contact_shares, [:user_id, :contact_id], unique: true


    add_column(:contacts, :created_at, :datetime)
    add_column(:contacts, :updated_at, :datetime)

  end
end
