require './app/celula'
class Grilla
  # Inicializa la grilla con tamaño definido
  def initialize(ancho, alto)
    @celulas = []
    alto.times do |x|
      @celulas.push([])
      ancho.times do |y|
        @celulas[x].push(Celula.new(self, x, y))
      end
    end
  end
  def celulas
    @celulas.flatten
  end
  def celula_en(x, y)
    if @celulas[x]
      @celulas[x][y]
    end
  end
  def siguiente_generacion!
    afectado = []
    celulas.each do |celula|
      (celula.vivo? && celula.vivos_cercanos.length < 2) ? afectado.push(celula) : next
    end
    afectado.each(&:cambio!)
    return
  end
end
