class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.text :url
      t.text :medium
    

      t.timestamps
    end
  
  end
end
