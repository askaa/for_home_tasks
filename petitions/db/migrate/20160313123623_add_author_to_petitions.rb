class AddAuthorToPetitions < ActiveRecord::Migration
  def change
    add_column :petitions, :author, :string
  end
end
