class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username, limit: 32, null: false, default: ""
      t.string :password_digest
      t.timestamps
    end
  end
end
