class PackageAuthor < ActiveRecord::Base
  self.table_name = :packages_authors

  belongs_to :author
  belongs_to :package_version
end
