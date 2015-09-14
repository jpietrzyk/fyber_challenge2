class PackageVersion < ActiveRecord::Base
  belongs_to :package
  belongs_to :maintainer, class_name: 'Author', foreign_key: :maintainer_id
  has_many :packages_authors, class_name: 'PackageAuthor'
  has_many :authors, through: :packages_authors
end
