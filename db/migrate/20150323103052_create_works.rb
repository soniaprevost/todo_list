class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :description
      t.boolean :state
      t.string :project
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :works, :users
  end
end
