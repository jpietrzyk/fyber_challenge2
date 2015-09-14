module Tools
	
	def get_info_from_package(name, version, package)
		pkg_url = "#{settings.srv_url}#{name}_#{version}.tar.gz"
		desc_path = "#{name}/DESCRIPTION"
		begin
			open(pkg_url) do |remote|
				tar = Gem::Package::TarReader.new(Zlib::GzipReader.open(remote))
				tar.rewind
				tar.each do |entry|
					# looking for description
					if entry.full_name == desc_path
						desc_content = entry.read.encode("UTF-8", "binary", invalid: :replace, undef: :replace, replace: '')
						pkg_info = Dcf.parse(desc_content)[0]
						package.create_version(pkg_info)
					end
					tar.close
					remote.close
				end
			end
		rescue Timeout::Error => err
			p "#{err.class}: #{err.message} with package: #{name}"
			return
		end
	end

	def packages_hash(settings)

	end

end
