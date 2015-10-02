workers = File.join('**', '*.rb')
Dir.glob("#{$ROOT}/lib/workers/#{workers}").each do |worker|
  require worker
  # something comment
  # yes good
end
