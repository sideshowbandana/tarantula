class Relevance::Tarantula::BasicAttack
  ATTRS = [:name, :output, :description]

  attr_reader *ATTRS

  def initialize
    @name = "Tarantula Basic Fuzzer"
    @output = ''
    @description = "Supplies purely random but simplistically generated form input."
  end

  def ==(other)
    Relevance::Tarantula::BasicAttack === other && ATTRS.all? { |attr| send(attr) == other.send(attr)}
  end

  def input(input_field)
    case input_field['name']
      when /amount/         : random_int
      when /_id$/           : random_whole_number
      when /uploaded_data/  : nil
      when nil              : input['value']
      else                    random_int
    end
  end

  def big_number
    10000   # arbitrary
  end
  
  def random_int
    rand(big_number) - (big_number/2)
  end
  
  def random_whole_number
    rand(big_number)
  end
end


