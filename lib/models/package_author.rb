class PackageAuthor < ActiveRecord::Base
  belongs_to :author
  belongs_to :package_version
end
