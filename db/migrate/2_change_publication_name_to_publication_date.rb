class ChangePublicationNameToPublicationDate < ActiveRecord::Migration
  def change
    rename_column :package_versions, :publication_name, :publication_date
  end
end
