@agenda = [
  {nome: "Igor", telefone: "922334455"},
  {nome: "Claudio", telefone: "933225544"}
]

def all_contacts
  @agenda.each do |contatos|
    puts "\n#{contatos[:nome]} - #{contatos[:telefone]}"
  end
  puts "\n"
end

def add_contacts
  puts "Insira o nome do novo contato: "
  nome = gets.chomp.to_s
  puts "Insira o número do telefone:"
  telefone = gets.chomp.to_s

  @agenda << {nome: nome, telefone: telefone}
end

def see_contacts
  print "Qual contato deseja ver: "
  nome = gets.chomp

  @agenda.each do |contatos|
    if contatos[:nome].downcase.include?(nome.downcase)
    puts "#{contatos[:nome]} - #{contatos[:telefone]}"
    end
    puts "\n"
  end
end

def edit_contacts
  print "Qual nome gostaria de editar: "
  nome = gets.chomp

  @agenda.each do |contatos|
    if contatos[:nome].downcase == (nome.downcase)
    print "Qual será o novo nome (Se não quiser editar, só pressionar o enter): "
    nome_salvo = contatos[:nome]

    contatos[:nome] = gets.chomp
    contatos[:nome] = contatos[:nome].empty? ? nome_salvo : contatos[:nome]

    print "Qual será o novo telefone (Se não quiser editar, só pressionar o enter): "
    telefone_salvo = contatos[:telefone]

    contatos[:telefone] = gets.chomp
    contatos[:telefone] = contatos[:telefone].empty? ? telefone_salvo : contatos[:telefone]
    end
  end
end

def remove_contacts
  print "Qual contato deseja remover: "
  nome = gets.chomp

  @agenda.each do |contatos|
    if contatos[:nome].downcase == (nome.downcase)
    indice = @agenda.index(contatos)
    @agenda.delete_at(indice)
    break
    end
  end
end

loop do
  puts "1 - Contatos\n2 - Adicionar Contatos\n3 - Ver Contatos\n4 - Editar Contato\n5 - Remover Contato\n0 - Sair"

  options = gets.chomp.to_i

  case 
  when options == 1
    all_contacts
  when options == 2
    add_contacts
  when options == 3
    see_contacts
  when options == 4
    edit_contacts
  when options == 5
    remove_contacts
  when options == 0
    puts "\nVolte logo! Estaremos te esperando"
    break
  end
end
