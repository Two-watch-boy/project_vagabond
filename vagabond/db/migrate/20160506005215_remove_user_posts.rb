class RemoveUserPosts < ActiveRecord::Migration
  def change
    if ActiveRecord::Base.connection.tables.include?(:user_posts)
      drop_table :user_posts
    end
  end
end
