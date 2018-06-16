namespace :utix do
    
    task seed: :environment do
        
        puts "Gerando os contatos..."
            100.times do |i|
                Contato.create!(nome: Faker::Name.name, email: Faker::Internet.email, tipo: Tipo.all.sample, obs: LeroleroGenerator.sentence([1, 2, 3].sample))
            end
        puts "Contatos gerados com sucesso!" 
        
        puts "Gerando os endereços..."
            Contato.all.each do |x|
                Endereco.create!(
                    rua: Faker::Address.street_address, 
                    cidade: Faker::Address.city,
                    estado: Faker::Address.state_abbr, 
                    contato: x)
            end
        puts "Endereços gerados com sucesso!"
        
        puts "Gerando os telefones..."
            Contato.all.each do |t|
                Random.rand(1..4).times do |i|
                Telefone.create!(
                    tel: Faker::PhoneNumber.phone_number, 
                    contato: t)
                end
            end
        puts "Telefone gerados com sucesso!"
        
    end
    
end
