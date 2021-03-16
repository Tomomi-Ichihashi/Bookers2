class AddIntroductionToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :introcuction, :text
  end
end
