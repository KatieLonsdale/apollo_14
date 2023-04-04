require 'rails_helper'

RSpec.describe 'astronauts show page' do
  before :each do
    test_data
    visit "/astronauts/#{@astronaut_1.id}"
  end
  describe "As a visitor, when I visit an astronaut's show page (/astronauts/:id)" do
    it 'shows me the name of that astronaut' do
      within '#astronaut-details' do
        expect(page).to have_content(@astronaut_1.name)
      end
    end

    it 'shows me a list of missions the astronaut has been on' do
      within '#astronaut-details' do
      expect(page).to have_content('Capricorn 4')
      expect(page).to have_content('Apollo 13')
      expect(page).to have_content('Gemini 7')
      end
    end
  end
end