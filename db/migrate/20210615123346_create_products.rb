class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :code, limit: 32
      t.string :name, limit: 64, null: false, default: ''
      t.string :description
      t.timestamps
    end
  end
end
