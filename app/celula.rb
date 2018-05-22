class Celula
  attr_reader :grilla, :x, :y
  def initialize(grilla, x, y) #inicializador de celula
    @grilla, @x, @y = grilla, x, y
    @vivo = false
  end
  # Funciones de estado
  def muerto!
    @vivo = false
  end
  def vivo!
    @vivo = true
  end
  def vivo?
    @vivo
  end
  def muerto?
    !@vivo
  end
  # Funcion de muerte o nacimiento
  def cambio!
    @vivo = !@vivo
  end
  # Cajas cercanas
  def cercanos
    cercanos = []
    cercanos.push(@grilla.celula_en(self.x - 1, self.y - 1)) #primera columna
    cercanos.push(@grilla.celula_en(self.x - 1, self.y))
    cercanos.push(@grilla.celula_en(self.x - 1, self.y + 1))
    cercanos.push(@grilla.celula_en(self.x, self.y - 1))  #segunda columna
    cercanos.push(@grilla.celula_en(self.x, self.y + 1))
    cercanos.push(@grilla.celula_en(self.x + 1, self.y - 1)) #tercera columna
    cercanos.push(@grilla.celula_en(self.x + 1, self.y))
    cercanos.push(@grilla.celula_en(self.x + 1, self.y + 1))
    cercanos
  end
  # Busca Vivos en Cajas cercanas
  def vivos_cercanos
    self.cercanos.select do |k|
        k && k.vivo?
    end
  end
end
