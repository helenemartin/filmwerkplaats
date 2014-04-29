class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text_field :description
      t.text_field :url
      t.text_field :img
      
      t.timestamps
  
  end
end
