class Package < ActiveRecord::Base
  has_many :package_versions, class_name: 'PackageVersion'
end
