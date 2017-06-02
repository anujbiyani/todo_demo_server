class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.boolean :done
      t.integer :list_id

      t.timestamps
    end
  end
end
