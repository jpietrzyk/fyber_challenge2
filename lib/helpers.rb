helpers = File.join('**', '*.rb')
Dir.glob("#{$ROOT}/lib/helpers/#{helpers}").each do |helper|
  require helper
end
