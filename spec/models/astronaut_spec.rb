require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe '::class methods' do
    before :each do
      @astronaut_1 = Astronaut.create!(name: 'Buzz', age: 32, job: 'pilot')
      @astronaut_2 = Astronaut.create!(name: 'Hank', age: 24, job: 'engineer')
      @astronaut_3 = Astronaut.create!(name: 'Steve', age: 29, job: 'chef')
    end
    describe '::average_age' do
      it 'returns average age of all astronauts as integer' do
        expect(Astronaut.average_age).to eq(28)
      end
    end
  end
end
