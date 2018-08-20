#!/usr/bin/env ruby
require './the_golden_mile.rb'
require './numeric.rb'

listado = {
  "type": "FeatureCollection",
  "features": [{
      "type": "Feature",
      "geometry": {
        "type": "Point",
        "coordinates": [-58.396770, -34.610722]
      },
      "properties": {
        "name": "Mundo 2150"
      }
    },
    {
      "type": "Feature",
      "geometry": {
        "type": "Point",
        "coordinates": [-58.414188, -34.591318]
      },
      "properties": {
        "name": "Estación MaB"
      }
    },
    {
      "type": "Feature",
      "geometry": {
        "type": "Point",
        "coordinates": [-58.382537, -34.608599]
      },
      "properties": {
        "name": "Unplug bar"
      }
    },
    {
      "type": "Feature",
      "geometry": {
        "type": "Point",
        "coordinates": [-58.437668, -34.583112]
      },
      "properties": {
        "name": "Baum Palermo"
      }
    },
    {
      "type": "Feature",
      "geometry": {
        "type": "Point",
        "coordinates": [-58.373368, -34.613602]
      },
      "properties": {
        "name": "Antares San Telmo"
      }
    },
    {
      "type": "Feature",
      "geometry": {
        "type": "Point",
        "coordinates": [-58.458071, -34.551604]
      },
      "properties": {
        "name": "Francis Platz"
      }
    },
    {
      "type": "Feature",
      "geometry": {
        "type": "Point",
        "coordinates": [-58.375986, -34.616646]
      },
      "properties": {
        "name": "La Puerta Roja"
      }
    },
    {
      "type": "Feature",
      "geometry": {
        "type": "Point",
        "coordinates": [-58.376931, -34.608806]
      },
      "properties": {
        "name": "Cerveza Patagonia"
      }
    },
    {
      "type": "Feature",
      "geometry": {
        "type": "Point",
        "coordinates": [-58.471894, -34.560517]
      },
      "properties": {
        "name": "PARDO Home Brew Beer"
      }
    },
    {
      "type": "Feature",
      "geometry": {
        "type": "Point",
        "coordinates": [-58.434873, -34.581288]
      },
      "properties": {
        "name": "Jerome Palermo Hollywood"
      }
    },
    {
      "type": "Feature",
      "geometry": {
        "type": "Point",
        "coordinates": [-58.455466, -34.623525]
      },
      "properties": {
        "name": "Samhain Pub"
      }
    },
    {
      "type": "Feature",
      "geometry": {
        "type": "Point",
        "coordinates": [-58.501654, -34.595239]
      },
      "properties": {
        "name": "Taberna Odín"
      }
    },
    {
      "type": "Feature",
      "geometry": {
        "type": "Point",
        "coordinates": [-58.449367, -34.576670]
      },
      "properties": {
        "name": "Cervecería Charlone"
      }
    },
    {
      "type": "Feature",
      "geometry": {
        "type": "Point",
        "coordinates": [-58.456845, -34.563234]
      },
      "properties": {
        "name": "Maldita Malta Belgrano"
      }
    },
    {
      "type": "Feature",
      "geometry": {
        "type": "Point",
        "coordinates": [-58.427997, -34.583530]
      },
      "properties": {
        "name": "Cervecería El Textil"
      }
    },
    {
      "type": "Feature",
      "geometry": {
        "type": "Point",
        "coordinates": [-58.378953, -34.596405]
      },
      "properties": {
        "name": "On Tap Retiro"
      }
    },
    {
      "type": "Feature",
      "geometry": {
        "type": "Point",
        "coordinates": [-58.367134, -34.600056]
      },
      "properties": {
        "name": "La Birreria Puerto Madero"
      }
    },
    {
      "type": "Feature",
      "geometry": {
        "type": "Point",
        "coordinates": [-58.399449, -34.593899]
      },
      "properties": {
        "name": "Bombar"
      }
    },
    {
      "type": "Feature",
      "geometry": {
        "type": "Point",
        "coordinates": [-58.392367, -34.591684]
      },
      "properties": {
        "name": "Temple Craft Recoleta"
      }
    },
    {
      "type": "Feature",
      "geometry": {
        "type": "Point",
        "coordinates": [-58.400752, -34.620906]
      },
      "properties": {
        "name": "Marea Cervecería Bar"
      }
    }
  ]
}

## Reordeno todos los bares en un array de hashes
bares = []
count = 0
listado[:features].each do |bar|
  bares <<  {
    name:bar[:properties][:name],
    coord_a:bar[:geometry][:coordinates][0],
    coord_b:bar[:geometry][:coordinates][1],
    dist:count}
  count += 1
end

recorrido = TheGoldenMile.new(bares)
recorrido.mostrar_path
puts "Tiempo total del recorrido: #{recorrido.calcular_duracion_recorrido}"
