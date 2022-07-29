require 'rails_helper'

RSpec.describe 'RecipeService' do
  it "can retrieve data and parses response for ingredients connection", :vcr do
    parsed_json = RecipeService.get_recipes('milk,+eggs')

    expect(parsed_json).to be_a Array
    recipe = parsed_json.first

    expect(recipe).to include("id", "title", "image", "imageType", "usedIngredientCount", "missedIngredientCount", "missedIngredients")
    expect(recipe).to be_a Hash
  end

  it "can retrieve data and parses response for searching recipe by id", :vcr do
    parsed_json = RecipeService.get_recipe_url(991625)

    expect(parsed_json).to be_a Hash
    expect(parsed_json).to include("id", "title", "sourceUrl")
    expect(parsed_json).to be_a Hash
  end
end
