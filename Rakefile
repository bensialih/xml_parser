require "bundler/gem_tasks"
require "rake/testtask"
require "xml_parser"


task default:%w[xml_parser]

desc "Run and display xml_parser"
task :xml_parser do
    Xml_parser.new
end

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList['test/**/*_test.rb']
end
