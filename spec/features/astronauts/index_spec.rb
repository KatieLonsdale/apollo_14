require 'rails_helper'

RSpec.describe 'astronauts index page' do
  before :each do
    @astronaut_1 = Astronaut.create!(name: 'Buzz', age: 32, job: 'pilot')
    @astronaut_2 = Astronaut.create!(name: 'Hank', age: 24, job: 'engineer')
    @astronaut_3 = Astronaut.create!(name: 'Steve', age: 29, job: 'chef')
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
  end
end