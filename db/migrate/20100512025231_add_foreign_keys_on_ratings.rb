class AddForeignKeysOnRatings < ActiveRecord::Migration
  def self.up
    add_column :ratings, :article_id, :integer
    add_column :ratings, :author_id, :integer
  end

  def self.down
    remove_column :ratings, :article_id
    remove_column :ratings, :author_id
  end
end
