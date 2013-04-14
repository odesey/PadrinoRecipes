require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

class RecipeCategoryTest < Test::Unit::TestCase
  context "RecipeCategory Model" do
    should 'construct new instance' do
      @recipe_category = RecipeCategory.new
      assert_not_nil @recipe_category
    end
  end
end
