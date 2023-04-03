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
      test_data
    end
    describe '::average_age' do
      it 'returns average age of all astronauts as integer' do
        expect(Astronaut.average_age).to eq(28)
      end
    end
  end

  describe '#instance methods' do
    before :each do
      test_data
    end
    describe '#missions' do
      it 'returns an alphabetized list of missions for an astronaut' do
        expect(@astronaut_1.missions).to eq ([@mission_2, @mission_1, @mission_3])
        expect(@astronaut_2.missions).to eq ([@mission_2, @mission_3])
      end
    end
  end
end
