# Uncomment this line to define a global platform for your project
 platform :ios, '9.0'
# Uncomment this line if you're using Swift
 use_frameworks!

target 'ActivehealthCommunity' do

	pod 'Eureka',
		:git => 'https://github.com/xmartlabs/Eureka.git',
		:branch => 'Swift3'

	pod 'SwiftyJSON', 
	:git => 'https://github.com/BaiduHiDeviOS/SwiftyJSON.git',
	:branch => 'swift3'

	pod 'SideMenuController', '~> 0.2.0'

end

 post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
  end