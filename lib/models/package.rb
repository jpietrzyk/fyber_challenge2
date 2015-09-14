class Package < ActiveRecord::Base
  has_many :package_versions

  # creates package version
  def create_version(package_details)
    version = package_versions.new
    version.version = package_details['Version']
    version.publication_date = package_details['Date/Publication']
    version.title = package_details['Title']
    # maybe for future we need another join table for dependencies (so we can make a link in view)
    version.dependencies = package_details['Depends']
    version.description = package_details['Description']
    version.repository = package_details['Repository']
    version.license = package_details['License']
    authors = get_authors(package_details['Author'])
    version.authors << authors
    version.maintainer = get_maintainer(package_details['Maintainer'])
    version.save!
  end

  private

  def get_authors(authors_string)
    author_names = authors_string.split(/, | and /)
    authors = []
    author_names.each do |author_name|
      author = Author.find_or_create_by(name: author_name)
      authors << author
    end
    authors
  end

  def get_maintainer(maintainer_string)
    maintainer_name, maintainer_email = maintainer_string.match(/(?:"?([^"]*)"?\s)?(?:<?(.+@[^>]+)>?)/i).captures
    Author.find_or_create_by(name: maintainer_name, email: maintainer_email)
  end
end
