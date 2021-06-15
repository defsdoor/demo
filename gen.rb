
colours = ["red", "green", "blue", "orange", "yellow", "purple", "white" ]
sizes = [ "small", "medium", "large", "extra large"]
handed = ["left handed", "right handed", "unidirectional", "slotted", "flat headed"]
thingummies = ["wotsit", "thingummy", "oojiflip", "widget", "whatchamacallit", "doodah"]

(0..10000).each do |i|
  code = "AB%06i" % i
  colour = colours.sample
  size = sizes.sample
  hand = handed.sample
  thing = thingummies.sample

  name = "#{thing.capitalize}, #{hand}, #{size} in #{colour}"
  description = "A #{size} #{thing} in the colour #{colour} with a #{hand} attachment."

  p "#{code}, #{name}, #{description}"
  Product.create code: code, name: name, description: description
end
