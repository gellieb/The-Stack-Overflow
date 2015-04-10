class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.references :user
      t.references :answer
      t.references :question

      t.timestamps null: false
    end
  end
end
