require "test_helper"

class LayoutGeneratorTest < GeneratorTest
  tests Html5::Generators::LayoutGenerator

  test "with no argument" do
    run_generator
    assert_no_file "app/views/layouts/application.html.erb"
    assert_file "app/views/layouts/application.html.haml"
  end

  test "with layout named application" do
    run_generator %w(application)
    assert_no_file "app/views/layouts/application.html.erb"
    assert_file "app/views/layouts/application.html.haml"
  end

  test "with layout named pancakes" do
    run_generator %w(pancakes)
    assert_file "app/views/layouts/pancakes.html.haml"
  end

  test "with layout named admin/pancakes" do
    run_generator %w(admin/pancakes)
    assert_file "app/views/layouts/admin/pancakes.html.haml"
  end

  test "with layout named Admin::Pancakes" do
    run_generator %w(Admin::Pancakes)
    assert_file "app/views/layouts/admin/pancakes.html.haml"
  end

  test "without --all-partials flag" do
    run_generator
    assert_no_directory "app/views/application"
  end

  test "with --all-partials flag" do
    run_generator ["--all-partials"]
    assert_file "app/views/layouts/application.html.haml"
    assert_file "app/views/application/_flashes.html.haml"
    assert_file "app/views/application/_footer.html.haml"
    assert_file "app/views/application/_head.html.haml"
    assert_file "app/views/application/_header.html.haml"
    assert_file "app/views/application/_javascripts.html.haml"
    assert_file "app/views/application/_stylesheets.html.haml"
  end

  test "with layout named pancakes and --all-partials flag" do
    run_generator ["pancakes", "--all-partials"]
    assert_file "app/views/layouts/pancakes.html.haml"
    assert_file "app/views/pancakes/_flashes.html.haml"
    assert_file "app/views/pancakes/_footer.html.haml"
    assert_file "app/views/pancakes/_head.html.haml"
    assert_file "app/views/pancakes/_header.html.haml"
    assert_file "app/views/pancakes/_javascripts.html.haml"
    assert_file "app/views/pancakes/_stylesheets.html.haml"
  end

  test "with layout named admin/pancakes all --all-partials flag" do
    run_generator ["admin/pancakes", "--all-partials"]
    assert_file "app/views/layouts/admin/pancakes.html.haml"
    assert_file "app/views/admin/pancakes/_flashes.html.haml"
    assert_file "app/views/admin/pancakes/_footer.html.haml"
    assert_file "app/views/admin/pancakes/_head.html.haml"
    assert_file "app/views/admin/pancakes/_header.html.haml"
    assert_file "app/views/admin/pancakes/_javascripts.html.haml"
    assert_file "app/views/admin/pancakes/_stylesheets.html.haml"
  end
end