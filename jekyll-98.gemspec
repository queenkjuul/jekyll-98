# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "jekyll-98"
  spec.version       = "0.3.0"
  spec.authors       = ["queenkjuul"]
  spec.email         = ["queenkjuul69+junkmail@gmail.com"]

  spec.summary       = "Windows 98 theme based on 98.css for Queen K Juul's website"
  spec.homepage      = "https://github.com/queenkjuul"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README|_config\.yml)!i) }

  spec.add_runtime_dependency "jekyll", "~> 4.2"
  spec.add_runtime_dependency "jekyll-paginate", "~> 1.1"
  spec.add_runtime_dependency "jekyll-feed", "~> 0.17.0"
  spec.add_runtime_dependency "jekyll-category-pages", "~> 1.1"
end
