class RemoveAuthorsFromPackageVersion < ActiveRecord::Migration
  def up
    remove_column :package_versions, :authors
    remove_column :package_versions, :maintainers
  end

  def down
    add_column :package_versions, :authors, :string
    add_column :package_versions, :maintainers, :string
  end
end
