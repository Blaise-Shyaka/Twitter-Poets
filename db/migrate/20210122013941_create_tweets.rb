class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.references :author, index: true, class_name: :User
      t.text :text

      t.timestamps
    end
    add_foreign_key :tweets, :users, column: :author_id
  end
end
