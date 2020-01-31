Pod::Spec.new do |s|
  s.name             = 'AndesUI'
  s.version          = '1.2.0'
  s.summary          = 'AndesUI library for ios app.'

  s.description      = 'AndesUI is the UI library of Mercado Libre. It provides the definitions, components and tools to build consistent experiences, with agility and visual quality.'

  s.homepage         = 'https://github.com/mercadolibre/fury_andesui-ios'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = 'Mercado Libre'
  s.source           = { :git => 'https://github.com/mercadolibre/fury_andesui-ios.git', :tag => s.version.to_s }

  s.platform         = :ios, '10.0'
  s.requires_arc     = true
  s.swift_version = '5.0'
  

  s.source_files = 'LibraryComponents/Classes/**/*.{h,m,swift}'
  s.resources = 'LibraryComponents/Classes/**/*.{xcassets,otf,xib}' 
  
end
