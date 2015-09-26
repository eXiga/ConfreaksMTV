require 'rake'

WORKSPACE_NAME = 'ConfreaksMTV.xcworkspace'
SCHEME_NAME = "ConfreaksMTV"

def execute(command)
  system(command) or raise "** BUILD FAILED **"
end

def test(scheme)
  execute "xcodebuild test -workspace #{WORKSPACE_NAME} -scheme #{scheme} -sdk iphonesimulator -destination \'platform=iOS Simulator,name=iPad Air 2,OS=9.0\' | xcpretty -tc"
end

task :default => :test

desc "Run specs"
task :test do
  test(SCHEME_NAME)
end
