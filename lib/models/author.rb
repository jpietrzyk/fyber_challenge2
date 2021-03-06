class Author < ActiveRecord::Base
  has_many :packages_authors, class_name: 'PackageAuthor'
  has_many :packages_versions, through: :packages_authors, class_name: 'PackageVersion'
  has_many :maintained_package_versions, class_name: 'PackageVersion', foreign_key: 'maintainer_id'
end
