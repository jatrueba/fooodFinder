class RemoveIpAddressFromLocations < ActiveRecord::Migration[5.0]
  def change
    #Examples:
    # remove_column(table_name, column_name, type, options):
    # Removes the column named column_name from the table called table_name.
    # remove_column :posts, :slug, :string
    remove_column  :locations, :ip_address, :string
  end
end
