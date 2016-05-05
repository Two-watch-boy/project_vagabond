class ChangeColumnNames < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.rename :photos, :photo
    end

    change_table :users do |t|
      t.rename :picture, :photo
    end
  end
end
