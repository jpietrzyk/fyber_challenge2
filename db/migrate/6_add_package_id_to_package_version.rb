class AddPackageIdToPackageVersion < ActiveRecord::Migration
  def change
    add_reference :package_versions, :package
  end
end
