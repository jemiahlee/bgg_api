module Bgg
  class Search
    class Item
      include Bgg::Result

      attr_reader :id, :name, :type, :year_published

      def initialize(item, request)
        @xml = item
        @request = request

        @id = xpath_value_int "@id"
        @name = xpath_value "name/@value"
        @type = xpath_value "@type"
        @year_published = xpath_value_int "yearpublished/@value"
      end

      def game
        #TODO refactor once Things have been coverted
        Bgg::Game.find_by_id(self.id)
      end
    end
  end
end
