source 'https://github.com/CocoaPods/Specs.git'

plugin 'cocoapods-whitelist'

workspace 'AndesUI'
project 'Example/AndesUI.xcodeproj'

platform :ios, '10.0'
use_frameworks!

target 'AndesUI-demoapp' do
    pod 'AndesUI', :path => './'
    pod 'IQKeyboardManagerSwift', '6.3.0'

    target 'AndesUI_Tests' do
        inherit! :search_paths

        pod 'Quick', '~> 1.2.0'
        pod 'Nimble', '~> 7.3.0'        
    end
end

pre_install do |installer|
	`./scripts/install_git_hooks.sh`
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES'] = 'YES'
        end
    end
end
