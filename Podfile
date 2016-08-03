# Uncomment this line to define a global platform for your project
platform :ios, ‘8.0’
# Uncomment this line if you're using Swift
use_frameworks!

target 'HairCare' do

pod ‘Firebase’
pod ‘Firebase/Auth’
pod ‘Firebase/Database’
pod ‘Firebase/Storage’
pod 'SwiftKeychainWrapper'
post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES'] = 'NO'
        end
    end
end

end


