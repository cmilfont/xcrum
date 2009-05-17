$LOAD_PATH.unshift(RAILS_ROOT + '/vendor/plugins/cucumber/lib') if File.directory?(RAILS_ROOT + '/vendor/plugins/cucumber/lib')

begin
  require 'cucumber/rake/task'

  Cucumber::Rake::Task.new(:features) do |t|
    #t.t.cucumber_opts = %w{$1}--format pretty
    t.cucumber_opts = "--format pretty"
    #t.cucumber_opts = "--format pretty --language pt"
    t.rcov = true
    t.rcov_opts = %w{--rails --exclude osx\/objc,gems\/,spec\/,features\/}
    #t.rcov_opts << %[-o "coverage"]
  end
  task :features => 'db:test:prepare'
rescue LoadError
  desc 'Cucumber rake task not available'
  task :features do
    abort 'Cucumber rake task is not available. Be sure to install cucumber as a gem or plugin'
  end
end

