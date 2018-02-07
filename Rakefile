require 'rake'

WORKSPACE_NAME = 'ConfreaksMTV.xcworkspace'
SCHEME_NAME = "ConfreaksMTV"

IPAD_AIR2_OS_11 = 'platform=iOS Simulator,name=iPad 2,OS=11.2'
IPHONE_X_OS_11 = 'platform=iOS Simulator,name=iPhone X,OS=11.2'

def execute(command)
  system(command) or raise "** BUILD FAILED **"
end

def build(scheme)
  execute "xcodebuild -workspace #{WORKSPACE_NAME} -scheme #{scheme} -sdk iphonesimulator ONLY_ACTIVE_ARCH=NO"
end

def test(scheme, device)
  execute "xcodebuild test -workspace #{WORKSPACE_NAME} -scheme #{scheme} -sdk iphonesimulator -destination '#{device}' | xcpretty -tc && exit ${PIPESTATUS[0]}"
end

namespace :test do
  desc 'Run specs on iPad 2, iOS 11'
  task :ipad do
    test(SCHEME_NAME, IPAD_AIR2_OS_11)
  end

  desc 'Run specs on iPhone 6, iOS 11'
  task :iphone do
    test(SCHEME_NAME, IPHONE_X_OS_11)
  end
end

task :build do
  build(SCHEME_NAME)
end

task default: 'test:iphone' #i don't know why i prefer to run tests on iPad
