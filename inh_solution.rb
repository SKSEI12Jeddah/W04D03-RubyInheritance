# Labs

# Lab: 2. Model Shapes Using Classes
class Shape
    attr_reader :num_sides 
    attr_accessor :side_length , :color

    def initialize (num_sides , side_length)
        @num_sides = num_sides
        @side_length = side_length
    end

    def calculate_area 
        area = (@num_sides * @side_length * @side_length) / (4 * Math.tan(Math::PI/@num_sides))
    end
end

class Rectangle < Shape
    def initialize(height, width)
      @height = height
      @width = width
      @num_sides = 4
      @side_length = [height, width]
    end
  
    def calculate_area
      @height * @width
    end
end

class Square < Rectangle
    def initialize(side_length)
      super(side_length, side_length)
    end
end

puts Rectangle.new(3, 4).calculate_area
puts Square.new(4).calculate_area



# Lab: 3. More on Inheritance

class Dessert 
    attr_accessor :name , :sugar_content

    def initialize(name , sugar_content)
        @name = name
        @sugar_content = sugar_content
    end

    def eat
        puts "Yum! This #{@name} is sooooo delicious!"
    end

end

class Pie < Dessert

end

class DeepFriedDessert < Dessert

    def eat
        puts "Yum! This #{@name} is sooo...ack! ugh! *heart-attack*"
    end
end


class IceCream < Dessert
    attr_accessor :toppings
    def initialize(name, sugar_content , toppings)
        super(name, sugar_content)
        @toppings = toppings
    end
end

ice = IceCream.new("cream",122,"vanilla")


# Lab 4. The Universe // Mohammed Almahdawi solution 
class Universe
    attr_reader :conservation
    def initialize(item1, item2, item3)
      @items = [item1, item2, item3]
      @expanding = true
      @conservation = true
      @crunched = false
    end
    def see_all_things
      puts @items
    end 
    def create new_item
      @items[rand(@items.length)] = new_item if @conservation == true
      @items.push new_item if @conservation == false
    end
    def check_density
      @expanding = false if @items.length > 10
    end
    def energy_conservation
      @conservation = false if @items.uniq.length == 1
    end
    def crunch?
      if @expanding == false
        @items.map do |item| 
          puts "#{item} has been crunched due to gravity"
        end
        @items = nil
        puts "The Universe has ended."
        @crunched = true
      end
    end
  end
