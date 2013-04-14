class CreateRecipes < ActiveRecord::Migration
  def self.up
    create_table :recipes do |t|
      t.text :name
      t.integer :cook_time
      t.text :instruction
      t.integer :ingredient_id
      t.integer :category_id
      t.integer :comment_id
      t.timestamps
    end
  end

  def self.down
    drop_table :recipes
  end
end
