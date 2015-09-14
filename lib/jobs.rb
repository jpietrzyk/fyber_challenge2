jobs = File.join('**', '*.rb')
Dir.glob("#{$ROOT}/lib/jobs/#{jobs}").each do |job|
  require job
end
