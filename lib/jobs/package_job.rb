require_relative '../helpers/tools'
include Tools
module Jobs
  class PackageJob
    def self.run(settings)
      all_packages(settings) do |packages|
        packages.each do |package|
          name = package['Package']
          version = package['Version']
          import_package(name, version, settings)
        end
      end
    end

    def self.import_package(name, version, settings)
      pkg = Package.where(name: name).first
      if pkg && !pkg.package_versions.where(version: version).any?
        # create version
        get_info_from_package(name, version, pkg, settings)
      elsif !pkg
        # package doesn't exist
        pkg = Package.create(name: name)
        get_info_from_package(name, version, pkg, settings)
      end
    end
  end
end
