class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.text :text

      t.timestamps
    end
  end
end
