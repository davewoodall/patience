
5.times do
  FactoryBot.create(:user, :all_data)
end

puts 'Seeded'