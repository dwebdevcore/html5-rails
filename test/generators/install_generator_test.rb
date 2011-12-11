require "test_helper"
require "generators/html5/install/install_generator"

class InstallGeneratorTest < Rails::Generators::TestCase
  include GeneratorTestHelper
  tests Html5::Generators::InstallGenerator

  test "Compass config file should be generated" do
    run_generator
    assert_file "config/compass.rb"
  end

  test "html5_rails.yml config file should be generated" do
    run_generator
    assert_file "config/html5_rails.yml"
  end
  
  test "application layout should be generated" do
    run_generator
    assert_no_file "app/views/layouts/application.html.erb"
    assert_file "app/views/layouts/application.html.haml"
  end

  test "minimal application partials should be generated" do
    run_generator
    %w(_footer _head _header).each do |file|
      assert_file "app/views/application/#{ file }.html.haml"
    end
    %w(_flashes _javascripts _stylesheets).each do |file|
      assert_no_file "app/views/application/#{ file }.html.haml"
    end
  end

  test "assets should be generated" do
    run_generator
    assert_file "app/assets/stylesheets/_defaults.css.scss"
    assert_file "app/assets/stylesheets/application.css.scss", /@import "application\/document";/
    %w(_defaults document media_queries).each do |file|
      assert_file "app/assets/stylesheets/application/#{ file }.css.scss"
    end
  end
end