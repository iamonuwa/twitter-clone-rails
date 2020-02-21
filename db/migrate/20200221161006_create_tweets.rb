class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :username
      t.string :tweet

      t.timestamps
    end
  end
end
