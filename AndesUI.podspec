Pod::Spec.new do |s|
  s.name             = 'AndesUI'
  s.version          = '1.0.0'
  s.summary          = 'AndesUI library for ios app.'

  s.description      = 'Andes UI es la librería de UI de Mercado Libre. Provee definiciones básicas, componentes y herramientas para construir experiencias consistentes, con agilidad y calidad visual.'

  s.homepage         = 'https://github.com/mercadolibre/fury_andes-ui-ios'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = 'Mercado Libre'
  s.source           = { :git => 'git@github.com:mercadolibre/fury_andes-ui-ios.git', :tag => s.version.to_s }

  s.platform         = :ios, '10.0'
  s.requires_arc     = true
  s.swift_version = '5.0'
  

  s.source_files = 'LibraryComponents/Classes/**/*.{h,m,swift}'
  s.resources = 'LibraryComponents/Classes/**/*.{xcassets,otf,xib}' 
  
end
