class PackageVersion < ActiveRecord::Base
  belongs_to :package
  has_many :packages_authors, class_name: 'PackageAuthor'
  has_many :authors, through: :packages_authors
end
