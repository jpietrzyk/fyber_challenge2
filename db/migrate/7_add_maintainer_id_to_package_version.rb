class AddMaintainerIdToPackageVersion < ActiveRecord::Migration
  def change
    add_reference :package_versions, :maintainer
  end
end
