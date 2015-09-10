models = File.join('**', '*.rb')
Dir.glob("#{$ROOT}/lib/models/#{models}").each do |model|
  require model
end
