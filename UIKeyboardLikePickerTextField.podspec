Pod::Spec.new do |s|
  s.name             = "UIKeyboardLikePickerTextField"
  s.version          = "0.1.0"
  s.summary          = "UITextField with UIPicker instead of keyboard as input view. Same as the Picker when you tap to a dropdown in Safari iOS."

  s.description      = "UITextField subclass that it uses a UIPickerView as input source instead of a keyboard. To use it just subclass from Interface Builder or programatically as UITextField to UIKeyboardLikePickerTextField and set the pickerDataSource property to an array containing strings to show them as options. The delegate receives all the methods an UITextField should receive and also the keyboard related notifications are posted so you do not have to do anything extra."

  s.homepage         = "https://github.com/gtsif21/UIKeyboardLikePickerTextField"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "George Tsifrikas" => "gtsifrikas@gmail.com" }
  s.source           = { :git => "https://github.com/gtsif21/UIKeyboardLikePickerTextField.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/gtsifrikas'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
end
