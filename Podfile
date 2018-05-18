platform :ios, '8.0'
workspace 'ConfreaksMTV'

def testing_pods
  pod 'Specta', '~> 1.0'
  pod 'Expecta', '~> 1.0.0'
  pod 'OCMockito', '~> 5.0'
  pod 'OHHTTPStubs'
end

target 'ConfreaksAPI' do
  project 'ConfreaksAPI/ConfreaksAPI.xcodeproj'
  pod 'PromisesObjC', '~> 1.2'
end

target 'ConfreaksAPITests' do
  project 'ConfreaksAPI/ConfreaksAPI.xcodeproj'
  testing_pods
end

target 'ConfreaksMTVTests' do
  project 'ConfreaksMTV/ConfreaksMTV.xcodeproj'
  testing_pods 
end

target 'ConfreaksMTVUITests' do
  project 'ConfreaksMTV/ConfreaksMTV.xcodeproj'
end

