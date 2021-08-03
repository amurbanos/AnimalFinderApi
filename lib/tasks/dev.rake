namespace :dev do

  desc "Preparando ambiente"

  task setup: :environment do
    puts "Criando banco de dados..."

    #%x(rails db:drop db:create db:migrate)

    puts "Cadastrando os donos..."
    10.times do |i|
      @user = User.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        phone: Faker::PhoneNumber.cell_phone_in_e164,
        password: "12345678",
      )
      puts "Cadastrando os animais..." 
      @pet = Pet.create!(
        name: Faker::Creature::Dog.name, 
        age: rand(1...14),
        state: "SP",
        city: "Santos",
        status: rand(1...3),
        user_id: @user.id,
      )
      puts "Carregando foto de " + @pet.name
      @pet.image.attach(
        io: File.open('/home/animal-finder/animal_finder_api/dev/pet1.jpg'), 
        filename: 'pet1.jpg',
        content_type: 'image/jpeg'
      )
    end

  end
end
