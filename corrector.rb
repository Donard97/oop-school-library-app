class Corrector
  def correct_name(name)
    given_name = name.strip.capitalize
    if given_name.length > 10
      given_name[0, 10]
    else
      given_name
    end
  end
end
