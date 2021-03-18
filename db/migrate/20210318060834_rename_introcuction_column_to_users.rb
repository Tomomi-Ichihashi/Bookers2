class RenameIntrocuctionColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :introcuction, :introduciton
  end
end
