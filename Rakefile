require 'rake'

WORKSPACE_NAME = 'ConfreaksMTV.xcworkspace'
MOBILE_APP_SCHEME_NAME = "ConfreaksMTV"
API_FRAMEWORK_SCHEME_NAME = "ConfreaksAPI"

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
  namespace :mobile do
    desc 'Run specs on iPad 2, iOS 11.2'
    task :ipad do
      test(MOBILE_APP_SCHEME_NAME, IPAD_AIR2_OS_11)
    end

    desc 'Run specs on iPhone X, iOS 11.2'
    task :iphone do
      test(MOBILE_APP_SCHEME_NAME, IPHONE_X_OS_11)
    end
  end

  namespace :api do
    desc 'Run API specs on iPhone X, iOS 11.2'
    task :ios do
      test(API_FRAMEWORK_SCHEME_NAME, IPHONE_X_OS_11)
    end
  end
end

task :test do
  Rake::Task['test:mobile:iphone'].invoke
  Rake::Task['test:api:ios'].invoke
end

task :build do
  build(MOBILE_APP_SCHEME_NAME)
end
