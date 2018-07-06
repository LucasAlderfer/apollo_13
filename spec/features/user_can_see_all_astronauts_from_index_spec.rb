require 'rails_helper'

describe 'visiting /astronauts' do
  context 'as a visitor' do
    it 'should show all astronauts with information' do
      astronaut_1 = Astronaut.create!(name: 'Louis', age: 27, job: 'astronaut, of course')
      astronaut_2 = Astronaut.create!(name: 'Ben', age: 28, job: 'starflight commander')
      astronaut_3 = Astronaut.create!(name: 'Mark', age: 29, job: 'space rookie')

      visit '/astronauts'

      expect(page).to have_content(astronaut_1.name)
      expect(page).to have_content(astronaut_1.age)
      expect(page).to have_content(astronaut_1.job)
      expect(page).to have_content(astronaut_2.name)
      expect(page).to have_content(astronaut_2.age)
      expect(page).to have_content(astronaut_2.job)
      expect(page).to have_content(astronaut_3.name)
      expect(page).to have_content(astronaut_3.age)
      expect(page).to have_content(astronaut_3.job)
    end
    it 'should show the average age of all astronauts.' do
      Astronaut.destroy_all
      astronaut_1 = Astronaut.create!(name: 'Louis', age: 30, job: 'astronaut, of course')
      astronaut_2 = Astronaut.create!(name: 'Ben', age: 90, job: 'starflight commander')
      astronaut_3 = Astronaut.create!(name: 'Mark', age: 60, job: 'space rookie')
      expected = 60
      visit '/astronauts'

      expect(page).to have_content("Average Age: #{expected}")
    end
  end
end
