require File.expand_path(File.dirname(__FILE__) + '/../test_config.rb')

class IngredientTest < Test::Unit::TestCase
  context "Ingredient Model" do
    should 'construct new instance' do
      @ingredient = Ingredient.new
      assert_not_nil @ingredient
    end
  end
end
