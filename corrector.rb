class Corrector
  def correct_name(name)
    name = name.capitalize
    name[0, 10] if name.length > 10
  end
end
