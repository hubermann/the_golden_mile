class Numeric
  def duracion
    segundos  = self.to_int
    mins  = segundos / 60
    horas = mins / 60
    dias  = horas / 24

    if dias > 0
      "#{dias} dias con #{horas % 24} horas"
    elsif horas > 0
      "#{horas} horas con #{mins % 60} minutos"
    elsif mins > 0
      "#{mins} minutos con #{segundos % 60} segundos"
    elsif segundos >= 0
      "#{segundos} segundos"
    end
  end
end
