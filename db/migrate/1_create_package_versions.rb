class CreatePackageVersions < ActiveRecord::Migration
  def change
    create_table :package_versions do |t|
      t.string :version
      t.datetime :publication_name
      t.string :title
      t.string :authors
      t.string :dependencies
      t.text :description
      t.string :maintainers
      t.string :repository
      t.string :license
    end
  end
end
