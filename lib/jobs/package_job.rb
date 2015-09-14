require_relative '../helpers/tools'
include Tools
module Jobs
	class PackageJob
		def self.run
			all_packages do |packages|
				packages.each do |package|
					name = package['Package']
					version = package['Version']

					pkg = Package.where(name: name).first
					if pkg && pkg.package_versions.where(version: version).empty?
						# package version doesn't exist - so should create
						get_info_from_package(name, version, pkg)
					else
						# package doesn't exist
						pkg = Package.create(name: name)
						get_info_from_package(name, version, pkg)
					end
				end
			end
		end
	end
end
