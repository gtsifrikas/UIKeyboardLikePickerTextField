#
# Be sure to run `pod lib lint UIKeyboardLikePickerTextField.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "UIKeyboardLikePickerTextField"
  s.version          = "0.1.0"
  s.summary          = "UITextField with UIPicker instead of keyboard as input view. Same as the Picker when you tap to a dropdown in Safari iOS."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = "UITextField subclass that it uses a UIPickerView as input source instead of a keyboard. To use it just subclass from Interface Builder or programatically as UITextField to UIKeyboardLikePickerTextField and set the pickerDataSource property to an array containing strings to show them as options. The delegate receives all the methods an UITextField should receive and also the keyboard related notifications are posted so you do not have to do anything extra."

  s.homepage         = "https://github.com/gtsif21/UIKeyboardLikePickerTextField"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "George Tsifrikas" => "gtsifrikas@gmail.com" }
  s.source           = { :git => "https://github.com/gtsif21/UIKeyboardLikePickerTextField.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'UIKeyboardLikePickerTextField' => ['Pod/Assets/*.png']
  }
end
