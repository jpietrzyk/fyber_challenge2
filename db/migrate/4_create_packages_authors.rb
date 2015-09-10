class CreatePackagesAuthors < ActiveRecord::Migration
  def change
    create_table :packages_authors do |t|
      t.integer :package_version_id
      t.integer :author_id
    end
  end
end
