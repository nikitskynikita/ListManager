#
# Be sure to run `pod lib lint ListManager.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name                  = 'ListManager'
  s.version               = '0.1.0'
  s.summary               = 'Набор классов для работы с UITableView и UICollectionView' 
  s.homepage              = 'https://github.com/nikitskynikita/ListManager'
  s.license               = { :type => 'MIT', :file => 'LICENSE' }
  s.author                = { 'Nikita Nikitsky' => 'nikitskynikita@gmail.com' }
  s.source                = { :git => 'https://github.com/nikitskynikita/ListManager.git', :tag => s.version.to_s }
  s.swift_version         = '5.0'
  s.ios.deployment_target = '10.0'
  s.source_files          = 'ListManager/Classes/**/*'
  s.frameworks            = 'UIKit'
end
