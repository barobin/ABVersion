#
# Be sure to run `pod lib lint ABVersion.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ABVersion'
  s.version          = '0.1.0'
  s.summary          = 'Simple class for version comparsion'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Working with application or system version
                       DESC

  s.homepage         = 'https://github.com/barobin/ABVersion'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Alexander Barobin' => 'alexander@barob.in' }
  s.source           = { :git => 'https://github.com/barobin/ABVersion.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'ABVersion/Classes/ABVersion.{h,m}'
end
