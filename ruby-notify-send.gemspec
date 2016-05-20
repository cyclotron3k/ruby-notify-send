Gem::Specification.new do |s|
	s.name         = "ruby-notify-send"
	s.version      = "0.0.1"
	s.date         = "2016-05-19"
	s.summary      = "Send notify-send notifications from your Ruby application"
	s.description  = "This replicates the functionality of notify-send, by talking directy to dbus"
	s.authors      = "cyclotron3k"
	s.files        = ["lib/notify-send.rb", "test/test_notify_send.rb", "Rakefile", "ruby-notify-send.gemspec", "README.md"]
	s.test_files   = ["test/test_notify_send.rb"]
	s.homepage     = "https://github.com/cyclotron3k/ruby-notify-send"
	s.license      = "MIT"
	s.add_runtime_dependency "ruby-dbus"
	s.required_ruby_version = ">= 1.9.0" # we rely on guaranteed hash key ordering
end
