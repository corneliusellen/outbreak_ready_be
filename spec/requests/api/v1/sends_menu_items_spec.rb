require 'rails_helper'

describe 'MenuItems API' do
  it 'Sends foods for questionnaire' do
    payload = "[[\"Item: Pork Belly\",\"Ingredients: Grilled Pineapple Jam, Sambal, Plum Sauce &amp; Scallions\"],[\"Item: Mongolian Bbq Duck**\",\"Ingredients: Scallions &amp; Miso Pickled Cucumbers\"],[\"Item: Hot Chicken**\",\"Ingredients: Fried Chicken, Pickle, Snow Pea Slaw, Nashville Hot Sauce &amp; Buttermilk Vinaigrette\"]]"

    headers = { 'CONTENT-TYPE' => 'application/json', 'HTTP_FOODS' => payload}
    post "/api/v1/questionnaires/1/foods", headers: headers

    expect(response).to be_success
    expect(MenuItem.count).to eq(3)
  end
end
