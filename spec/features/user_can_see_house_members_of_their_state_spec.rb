require 'rails_helper'

RSpec.describe "a user can see members of the house for their state" do
  it "when they select their state from the dropdown menu" do
#     As a user
    # When I visit "/"
    visit '/'
    # And I select "Colorado" from the dropdown
    select "Colorado", from: "search"
    # And I click on "Locate Members from the House"
    click_on "Locate Members from the House"
    # Then my path should be "/search" with "state=CO" in the parameters
    expect(current_path).to eq "/search"
    # And I should see a message "7 Results"
    expect(page).to have_content "7 Results"
    # And I should see a list of 7 the members of the house for Colorado
    # And they should be ordered by seniority from most to least
    # And I should see a name, role, party, and district for each member
    within ".members" do
      expect(page).to have_selector ".name"
      expect(page).to have_selector ".role"
      expect(page).to have_selector ".party"
      expect(page).to have_selector ".district"
    end
  end
end
