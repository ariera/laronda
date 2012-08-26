class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.datetime :t_created_at
      t.string :from_user
      t.string :from_user_id_str
      t.string :from_user_name
      t.string :geo
      t.string :id_str
      t.string :iso_language_code
      t.string :metadata
      t.string :profile_image_url
      t.string :profile_image_url_https
      t.string :source
      t.string :text
      t.string :to_user
      t.string :to_user_id_str
      t.string :to_user_name
      t.string :query
      t.boolean :deleted, default:false
      t.timestamps
    end
  end
end
