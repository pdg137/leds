OUTPUT = File.open('/dev/ttyACM3','w')

require 'rmagick'

letters = Magick::ImageList.new('letters.png')

def rgb(r,g,b)
  OUTPUT.write([b + (g << 5) + (r << 10)].pack("S<"))
end

def sync
  OUTPUT.write([0xff,0xff].pack("CC"))
end

def scroll(image)
  sync
  puts "I (heart) LVRUG"
  (image.columns-7).times do |i|
    view = image.view(i,0,8,5)
    5.times do |y|
      8.times do |x|
        pixel = view[y][x]
        rgb(pixel.red/8/256, pixel.green/8/256, pixel.blue/8/256)
      end
    end
    sleep(0.05)
  end
end

while true
  scroll(letters)
end
sleep(0.25)

output.close
