require 'rails_helper'

RSpec.describe 'astronauts index page' do
  before :each do
    test_data
    visit '/astronauts'
  end
  describe "As a visitor, when I visit the Astronauts index page ('/astronauts')" do
    it 'shows me a list of astronauts and their attributes' do
      expect(page).to have_content("Name: #{@astronaut_1.name}")
      expect(page).to have_content("Age: #{@astronaut_1.age}")
      expect(page).to have_content("Job: #{@astronaut_1.job}")
      expect(page).to have_content("Name: #{@astronaut_2.name}")
      expect(page).to have_content("Age: #{@astronaut_2.age}")
      expect(page).to have_content("Job: #{@astronaut_2.job}")
      expect(page).to have_content("Name: #{@astronaut_3.name}")
      expect(page).to have_content("Age: #{@astronaut_3.age}")
      expect(page).to have_content("Job: #{@astronaut_3.job}")
    end
    it 'shows me the average age of all astronauts' do
      expect(page).to have_content("Average Age: 28")
    end
    it 'shows me the missions for each astronaut in alphabetical order' do
      within "#astronaut-#{@astronaut_1.id}" do
        expect(page).to have_content("#{@mission_1.title}")
        expect(page).to have_content("#{@mission_2.title}")
        expect(page).to have_content("#{@mission_3.title}")

        expect("#{@mission_2.title}").to appear_before("#{@mission_1.title}")
        expect("#{@mission_1.title}").to appear_before("#{@mission_3.title}")
      end

      within "#astronaut-#{@astronaut_2.id}" do
        expect(page).to have_content("#{@mission_2.title}")
        expect(page).to have_content("#{@mission_3.title}")

        expect("#{@mission_2.title}").to appear_before("#{@mission_3.title}")
      end
      within "#astronaut-#{@astronaut_3.id}" do
        expect(page).to have_content("#{@mission_2.title}")
      end
    end
    it 'shows me the total time spent in space for each astronaut' do
      within "#astronaut-#{@astronaut_1.id}" do
        expect(page).to have_content("Total Time in Space: 14 months")
      end

      within "#astronaut-#{@astronaut_2.id}" do
        expect(page).to have_content("Total Time in Space: 9 months")
      end
      within "#astronaut-#{@astronaut_3.id}" do
        expect(page).to have_content("Total Time in Space: 6 months")
      end
    end
  end
end