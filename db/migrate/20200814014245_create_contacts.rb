# frozen_string_literal: true

# CreateContacts
class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :context, null: false

      t.timestamps
    end
  end
end
