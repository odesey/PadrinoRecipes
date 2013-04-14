require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

class RecipeTest < Test::Unit::TestCase
  context "Recipe Model" do
    should 'construct new instance' do
      @recipe = Recipe.new
      assert_not_nil @recipe
    end
  end
end
