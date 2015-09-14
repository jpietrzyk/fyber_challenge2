class Package < ActiveRecord::Base
  has_many :package_versions

  # creates package version 
  def create_version package_details
  	version = package_versions.new
  	version.version = package_details['Version']
  	version.publication_date = package_info['Date/Publication']
  	version.title = pakacge_info['Title']
  	# maby for future we need another join table for dependencies (so we can make a link in view)
  	version.dependencies = package_info['Dependencies']
  	version.description = package_info['Description']
  	version.repository = package_info['Repository']
  	version.license = package_info['License']
  	version.authors << get_authors(package_info['Authors'])
  end

  private
  	def get_authors(authors_string)
  		[]
  	end
end
