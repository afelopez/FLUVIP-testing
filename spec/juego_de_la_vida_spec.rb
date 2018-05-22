require './app/celula'
require './app/grilla'

describe "Testeo del juego de la vida" do
  let(:grilla) { Grilla.new(3, 3) } # inicia el test con una grid de 5x5
  context "escenario 1" do
    it "sin vecino" do
      celula = grilla.celula_en(1, 1)
      celula.vivo!
      grilla.siguiente_generacion!
      celula.should be_muerto
    end
  end
  context "escenario 2" do
    it "un vecino" do
      celula = grilla.celula_en(1, 1)
      celula.vivo!
      celula_1 = grilla.celula_en(2, 1)
      celula_1.vivo!
      grilla.siguiente_generacion!
      celula.should be_muerto
      celula_1.should be_muerto
    end
  end
  context "escenario 3" do
    it 'generacion 1' do
      celula = grilla.celula_en(0, 0)
      celula.vivo!
      celula_1 = grilla.celula_en(1, 0)
      celula_1.vivo!
      celula_2 = grilla.celula_en(0, 1)
      celula_2.vivo!
      celula_3 = grilla.celula_en(1, 1)
      celula_3.vivo!
      grilla.siguiente_generacion!
      celula.should be_vivo
      celula_1.should be_vivo
      celula_2.should be_vivo
      celula_3.should be_vivo
    end
  end
  context "escenario 4" do
    it 'generacion 1' do
      celula = grilla.celula_en(1, 0)
      celula.vivo!
      celula_1 = grilla.celula_en(1, 1)
      celula_1.vivo!
      celula_2 = grilla.celula_en(1, 2)
      celula_2.vivo!
      grilla.siguiente_generacion!
      celula.should be_muerto
      celula_1.should be_vivo
      celula_2.should be_muerto
    end
  end

end
