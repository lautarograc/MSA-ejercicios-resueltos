#rspec

require_relative "number_converter"
require_relative "yaml_loader"

describe NumberConverter do
  let(:data) { YamlLoader.load("ejercicio2/numbers.yml") }
  let(:number_converter) { NumberConverter.new(data) }

  describe "#to_words" do
    context "zero" do
      it "returns cero" do
        expect(number_converter.to_words(0)).to eq("cero")
      end
    end
    context "one" do
      it "returns uno" do
        expect(number_converter.to_words(1)).to eq("uno")
      end
    end
    context "ones" do
      it "returns the correct word for numbers between 1 and 9" do
        expect(number_converter.to_words(2)).to eq("dos")
        expect(number_converter.to_words(3)).to eq("tres")
        expect(number_converter.to_words(4)).to eq("cuatro")
        expect(number_converter.to_words(5)).to eq("cinco")
        expect(number_converter.to_words(6)).to eq("seis")
        expect(number_converter.to_words(7)).to eq("siete")
        expect(number_converter.to_words(8)).to eq("ocho")
        expect(number_converter.to_words(9)).to eq("nueve")
      end
    end
    context "teens" do
      it "returns the correct word for numbers between 10 and 19" do
        expect(number_converter.to_words(10)).to eq("diez")
        expect(number_converter.to_words(11)).to eq("once")
        expect(number_converter.to_words(12)).to eq("doce")
        expect(number_converter.to_words(13)).to eq("trece")
        expect(number_converter.to_words(14)).to eq("catorce")
        expect(number_converter.to_words(15)).to eq("quince")
        expect(number_converter.to_words(16)).to eq("dieciseis")
        expect(number_converter.to_words(17)).to eq("diecisiete")
        expect(number_converter.to_words(18)).to eq("dieciocho")
        expect(number_converter.to_words(19)).to eq("diecinueve")
      end
    end
    context "twenties" do
      it "returns the correct word for numbers between 20 and 29" do
        expect(number_converter.to_words(20)).to eq("veinte")
        expect(number_converter.to_words(21)).to eq("veintiuno")
        expect(number_converter.to_words(22)).to eq("veintidos")
        expect(number_converter.to_words(23)).to eq("veintitres")
        expect(number_converter.to_words(24)).to eq("veinticuatro")
        expect(number_converter.to_words(25)).to eq("veinticinco")
        expect(number_converter.to_words(26)).to eq("veintiseis")
        expect(number_converter.to_words(27)).to eq("veintisiete")
        expect(number_converter.to_words(28)).to eq("veintiocho")
        expect(number_converter.to_words(29)).to eq("veintinueve")
      end
    end
    context "tens" do
      it "returns the correct word for tens between 30 and 90" do
        expect(number_converter.to_words(30)).to eq("treinta")
        expect(number_converter.to_words(40)).to eq("cuarenta")
        expect(number_converter.to_words(50)).to eq("cincuenta")
        expect(number_converter.to_words(60)).to eq("sesenta")
        expect(number_converter.to_words(70)).to eq("setenta")
        expect(number_converter.to_words(80)).to eq("ochenta")
        expect(number_converter.to_words(90)).to eq("noventa")
      end
      it "returns the correct word for numbers between 31 and 99, one for every tenth" do
        expect(number_converter.to_words(31)).to eq("treinta y uno")
        expect(number_converter.to_words(42)).to eq("cuarenta y dos")
        expect(number_converter.to_words(53)).to eq("cincuenta y tres")
        expect(number_converter.to_words(64)).to eq("sesenta y cuatro")
        expect(number_converter.to_words(75)).to eq("setenta y cinco")
        expect(number_converter.to_words(86)).to eq("ochenta y seis")
        expect(number_converter.to_words(97)).to eq("noventa y siete")
      end
    end
    context "hundreds" do
      it "returns the correct word for hundreds between 100 and 900" do
        expect(number_converter.to_words(100)).to eq("cien")
        expect(number_converter.to_words(200)).to eq("doscientos")
        expect(number_converter.to_words(300)).to eq("trescientos")
        expect(number_converter.to_words(400)).to eq("cuatrocientos")
        expect(number_converter.to_words(500)).to eq("quinientos")
        expect(number_converter.to_words(600)).to eq("seiscientos")
        expect(number_converter.to_words(700)).to eq("setecientos")
        expect(number_converter.to_words(800)).to eq("ochocientos")
        expect(number_converter.to_words(900)).to eq("novecientos")
      end
      it "returns the correct word for numbers between 101 and 999, one for every hundred" do
        expect(number_converter.to_words(101)).to eq("ciento uno")
        expect(number_converter.to_words(212)).to eq("doscientos doce")
        expect(number_converter.to_words(323)).to eq("trescientos veintitres")
        expect(number_converter.to_words(434)).to eq("cuatrocientos treinta y cuatro")
        expect(number_converter.to_words(545)).to eq("quinientos cuarenta y cinco")
        expect(number_converter.to_words(656)).to eq("seiscientos cincuenta y seis")
        expect(number_converter.to_words(767)).to eq("setecientos sesenta y siete")
        expect(number_converter.to_words(878)).to eq("ochocientos setenta y ocho")
        expect(number_converter.to_words(989)).to eq("novecientos ochenta y nueve")
      end
    end
    context "thousands" do
      it "returns the correct word for thousands between 1000 and 9000" do
        expect(number_converter.to_words(1000)).to eq("mil")
        expect(number_converter.to_words(2000)).to eq("dos mil")
        expect(number_converter.to_words(3000)).to eq("tres mil")
        expect(number_converter.to_words(4000)).to eq("cuatro mil")
        expect(number_converter.to_words(5000)).to eq("cinco mil")
        expect(number_converter.to_words(6000)).to eq("seis mil")
        expect(number_converter.to_words(7000)).to eq("siete mil")
        expect(number_converter.to_words(8000)).to eq("ocho mil")
        expect(number_converter.to_words(9000)).to eq("nueve mil")
      end
      it "returns the correct word for numbers between 1001 and 9999, one for every thousand" do
        expect(number_converter.to_words(1001)).to eq("mil uno")
        expect(number_converter.to_words(2123)).to eq("dos mil ciento veintitres")
        expect(number_converter.to_words(3234)).to eq("tres mil doscientos treinta y cuatro")
        expect(number_converter.to_words(4345)).to eq("cuatro mil trescientos cuarenta y cinco")
        expect(number_converter.to_words(5456)).to eq("cinco mil cuatrocientos cincuenta y seis")
        expect(number_converter.to_words(6567)).to eq("seis mil quinientos sesenta y siete")
        expect(number_converter.to_words(7678)).to eq("siete mil seiscientos setenta y ocho")
        expect(number_converter.to_words(8789)).to eq("ocho mil setecientos ochenta y nueve")
        expect(number_converter.to_words(9890)).to eq("nueve mil ochocientos noventa")
      end
      it "returns the correct word for numbers between 10000 and 99999, one for every ten thousand" do
        expect(number_converter.to_words(10000)).to eq("diez mil")
        expect(number_converter.to_words(20000)).to eq("veinte mil")
        expect(number_converter.to_words(30000)).to eq("treinta mil")
        expect(number_converter.to_words(40000)).to eq("cuarenta mil")
        expect(number_converter.to_words(50000)).to eq("cincuenta mil")
        expect(number_converter.to_words(60000)).to eq("sesenta mil")
        expect(number_converter.to_words(70000)).to eq("setenta mil")
        expect(number_converter.to_words(80000)).to eq("ochenta mil")
        expect(number_converter.to_words(90000)).to eq("noventa mil")
      end
      it "returns the correct word for numbers between 10001 and 99999, one for every ten thousand" do
        expect(number_converter.to_words(10001)).to eq("diez mil uno")
        expect(number_converter.to_words(20012)).to eq("veinte mil doce")
        expect(number_converter.to_words(30023)).to eq("treinta mil veintitres")
        expect(number_converter.to_words(40034)).to eq("cuarenta mil treinta y cuatro")
        expect(number_converter.to_words(50045)).to eq("cincuenta mil cuarenta y cinco")
        expect(number_converter.to_words(60056)).to eq("sesenta mil cincuenta y seis")
        expect(number_converter.to_words(70067)).to eq("setenta mil sesenta y siete")
        expect(number_converter.to_words(80078)).to eq("ochenta mil setenta y ocho")
        expect(number_converter.to_words(93089)).to eq("noventa y tres mil ochenta y nueve")
      end
      it "returns the correct word for numbers between 100000 and 999999, one for every hundred thousand" do
        expect(number_converter.to_words(100000)).to eq("cien mil")
        expect(number_converter.to_words(200000)).to eq("doscientos mil")
        expect(number_converter.to_words(300000)).to eq("trescientos mil")
        expect(number_converter.to_words(400000)).to eq("cuatrocientos mil")
        expect(number_converter.to_words(500000)).to eq("quinientos mil")
        expect(number_converter.to_words(600000)).to eq("seiscientos mil")
        expect(number_converter.to_words(700000)).to eq("setecientos mil")
        expect(number_converter.to_words(800000)).to eq("ochocientos mil")
        expect(number_converter.to_words(900000)).to eq("novecientos mil")
      end
      it "returns the correct word for numbers between 100001 and 999999, one for every hundred thousand" do
        expect(number_converter.to_words(100001)).to eq("cien mil uno")
        expect(number_converter.to_words(200112)).to eq("doscientos mil ciento doce")
        expect(number_converter.to_words(300223)).to eq("trescientos mil doscientos veintitres")
        expect(number_converter.to_words(400334)).to eq("cuatrocientos mil trescientos treinta y cuatro")
        expect(number_converter.to_words(500445)).to eq("quinientos mil cuatrocientos cuarenta y cinco")
        expect(number_converter.to_words(600556)).to eq("seiscientos mil quinientos cincuenta y seis")
        expect(number_converter.to_words(700667)).to eq("setecientos mil seiscientos sesenta y siete")
        expect(number_converter.to_words(800778)).to eq("ochocientos mil setecientos setenta y ocho")
        expect(number_converter.to_words(900889)).to eq("novecientos mil ochocientos ochenta y nueve")
      end
    end
    context "millions" do
      it "returns millon for 1000000" do
        expect(number_converter.to_words(1000000)).to eq("un millon")
      end
    end
    context "RAE" do
      it "returns the correct word for selected numbers by RAE" do
        expect(number_converter.to_words(1)).to eq("uno")
        expect(number_converter.to_words(2)).to eq("dos")
        expect(number_converter.to_words(3)).to eq("tres")
        expect(number_converter.to_words(4)).to eq("cuatro")
        expect(number_converter.to_words(5)).to eq("cinco")
        expect(number_converter.to_words(6)).to eq("seis")
        expect(number_converter.to_words(7)).to eq("siete")
        expect(number_converter.to_words(8)).to eq("ocho")
        expect(number_converter.to_words(9)).to eq("nueve")
        expect(number_converter.to_words(10)).to eq("diez")
        expect(number_converter.to_words(11)).to eq("once")
        expect(number_converter.to_words(12)).to eq("doce")
        expect(number_converter.to_words(13)).to eq("trece")
        expect(number_converter.to_words(14)).to eq("catorce")
        expect(number_converter.to_words(15)).to eq("quince")
        expect(number_converter.to_words(16)).to eq("dieciseis")
        expect(number_converter.to_words(17)).to eq("diecisiete")
        expect(number_converter.to_words(18)).to eq("dieciocho")
        expect(number_converter.to_words(19)).to eq("diecinueve")
        expect(number_converter.to_words(20)).to eq("veinte")
        expect(number_converter.to_words(21)).to eq("veintiuno")
        expect(number_converter.to_words(22)).to eq("veintidos")
        expect(number_converter.to_words(23)).to eq("veintitres")
        expect(number_converter.to_words(30)).to eq("treinta")
        expect(number_converter.to_words(31)).to eq("treinta y uno")
        expect(number_converter.to_words(32)).to eq("treinta y dos")
        expect(number_converter.to_words(33)).to eq("treinta y tres")
        expect(number_converter.to_words(40)).to eq("cuarenta")
        expect(number_converter.to_words(41)).to eq("cuarenta y uno")
        expect(number_converter.to_words(42)).to eq("cuarenta y dos")
        expect(number_converter.to_words(43)).to eq("cuarenta y tres")
        expect(number_converter.to_words(50)).to eq("cincuenta")
        expect(number_converter.to_words(60)).to eq("sesenta")
        expect(number_converter.to_words(70)).to eq("setenta")
        expect(number_converter.to_words(80)).to eq("ochenta")
        expect(number_converter.to_words(90)).to eq("noventa")
        expect(number_converter.to_words(100)).to eq("cien")
        expect(number_converter.to_words(101)).to eq("ciento uno")
        expect(number_converter.to_words(102)).to eq("ciento dos")
        expect(number_converter.to_words(103)).to eq("ciento tres")
        expect(number_converter.to_words(110)).to eq("ciento diez")
        expect(number_converter.to_words(111)).to eq("ciento once")
        expect(number_converter.to_words(112)).to eq("ciento doce")
        expect(number_converter.to_words(120)).to eq("ciento veinte")
        expect(number_converter.to_words(121)).to eq("ciento veintiuno")
        expect(number_converter.to_words(122)).to eq("ciento veintidos")
        expect(number_converter.to_words(123)).to eq("ciento veintitres")
        expect(number_converter.to_words(130)).to eq("ciento treinta")
        expect(number_converter.to_words(131)).to eq("ciento treinta y uno")
        expect(number_converter.to_words(132)).to eq("ciento treinta y dos")
        expect(number_converter.to_words(133)).to eq("ciento treinta y tres")
        expect(number_converter.to_words(200)).to eq("doscientos")
        expect(number_converter.to_words(300)).to eq("trescientos")
        expect(number_converter.to_words(400)).to eq("cuatrocientos")
        expect(number_converter.to_words(500)).to eq("quinientos")
        expect(number_converter.to_words(600)).to eq("seiscientos")
        expect(number_converter.to_words(700)).to eq("setecientos")
        expect(number_converter.to_words(800)).to eq("ochocientos")
        expect(number_converter.to_words(900)).to eq("novecientos")
        expect(number_converter.to_words(1000)).to eq("mil")
        expect(number_converter.to_words(1001)).to eq("mil uno")
        expect(number_converter.to_words(1002)).to eq("mil dos")
        expect(number_converter.to_words(1003)).to eq("mil tres")
        expect(number_converter.to_words(1010)).to eq("mil diez")
        expect(number_converter.to_words(1011)).to eq("mil once")
        expect(number_converter.to_words(1020)).to eq("mil veinte")
        expect(number_converter.to_words(1021)).to eq("mil veintiuno")
        expect(number_converter.to_words(1023)).to eq("mil veintitres")
        expect(number_converter.to_words(1030)).to eq("mil treinta")
        expect(number_converter.to_words(1031)).to eq("mil treinta y uno")
        expect(number_converter.to_words(1100)).to eq("mil cien")
        expect(number_converter.to_words(1101)).to eq("mil ciento uno")
        expect(number_converter.to_words(1102)).to eq("mil ciento dos")
        expect(number_converter.to_words(1103)).to eq("mil ciento tres")
        expect(number_converter.to_words(1200)).to eq("mil doscientos")
        expect(number_converter.to_words(1300)).to eq("mil trescientos")
        expect(number_converter.to_words(2000)).to eq("dos mil")
        expect(number_converter.to_words(2001)).to eq("dos mil uno")
        expect(number_converter.to_words(2002)).to eq("dos mil dos")
        expect(number_converter.to_words(2003)).to eq("dos mil tres")
        expect(number_converter.to_words(2010)).to eq("dos mil diez")
        expect(number_converter.to_words(2011)).to eq("dos mil once")
        expect(number_converter.to_words(2020)).to eq("dos mil veinte")
        expect(number_converter.to_words(2021)).to eq("dos mil veintiuno")
        expect(number_converter.to_words(2022)).to eq("dos mil veintidos")
        expect(number_converter.to_words(2023)).to eq("dos mil veintitres")
        expect(number_converter.to_words(2100)).to eq("dos mil cien")
        expect(number_converter.to_words(2101)).to eq("dos mil ciento uno")
        expect(number_converter.to_words(2102)).to eq("dos mil ciento dos")
        expect(number_converter.to_words(2103)).to eq("dos mil ciento tres")
        expect(number_converter.to_words(3000)).to eq("tres mil")
        expect(number_converter.to_words(4000)).to eq("cuatro mil")
        expect(number_converter.to_words(10_000)).to eq("diez mil")
        expect(number_converter.to_words(11_000)).to eq("once mil")
        expect(number_converter.to_words(20_000)).to eq("veinte mil")
        expect(number_converter.to_words(21_000)).to eq("veintiun mil")
        expect(number_converter.to_words(30_000)).to eq("treinta mil")
        expect(number_converter.to_words(31_000)).to eq("treinta y un mil")
        expect(number_converter.to_words(40_000)).to eq("cuarenta mil")
        expect(number_converter.to_words(50_000)).to eq("cincuenta mil")
        expect(number_converter.to_words(100_000)).to eq("cien mil")
        expect(number_converter.to_words(200_000)).to eq("doscientos mil")
        expect(number_converter.to_words(300_000)).to eq("trescientos mil")
        expect(number_converter.to_words(1_000_000)).to eq("un millon")
      end
    end
  end
end
