# frozen_string_literal: true

module Geometry
  module Converter
    def encode_geojson!(coordinates, type)
      geo = {
        "type": type,
        "coordinates": coordinates
      }.to_json

      RGeo::GeoJSON.decode(geo).to_s
    end
  end
end
