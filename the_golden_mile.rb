class TheGoldenMile

  def initialize(bares)
    @bares = bares
    @path =[]
    @distancias =[]
    inicio
  end

  def euclidean_distance(p1,p2)
    sum_of_squares = 0
    p1.each_with_index do |p1_coord,index|
      sum_of_squares += (p1_coord - p2[index]) ** 2
    end
    Math.sqrt( sum_of_squares )
  end

  def mostrar_path
    @path.each do |b|
      puts "#{b[:name]} \n"
    end
  end

  def calcular_duracion_recorrido
    (calcular_tiempo(60, @distancias.inject {|sum, n| sum + n}) * 1000).duracion
  end

  def inicio
    #calculo la distancia de todos los bares desde la coordenada 1:1 para elgir el primero
    @bares.each do |b|
      b[:dist] = euclidean_distance([1,b[:coord_a]], [1,b[:coord_b]])
    end
    ordenar
  end

  def ordenar
    @bares.each do
      ## Los ordeno por menor distancia y tomo el primero
      @bares.sort_by! { |h| h[:dist] }
      @path << @bares[0]
      @distancias << @bares[0][:dist]
      @bares.shift
      calcular_distancia if @bares.size > 0
    end
  end

  def calcular_distancia
    #calculo la distancia desde el ultimo bar recorrido y la distancia hacia los restantes
    ultimo = @path.last
    @bares.each do |b|
      b[:dist] = euclidean_distance([ultimo[:coord_a],b[:coord_a]], [ultimo[:coord_b],b[:coord_b]])
    end
    ordenar #mientras tenga bares en el listado retorno al metodo ordenar, para seguir tomando el mas cercano
  end

  def calcular_tiempo(kmts_x_hora, distancia_en_kmts=1)
    velocidad_en_seg = kmts_x_hora / 3.6
    dist_mts = distancia_en_kmts * 1000
    duracion_en_seg = dist_mts / velocidad_en_seg
    return duracion_en_seg / 3600
  end

end
