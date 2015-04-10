class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :body, null: false
      t.boolean :best, default: false
      t.references :user
      t.references :question

      t.timestamps null: false
    end
  end
end
