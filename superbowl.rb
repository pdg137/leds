OUTPUT = File.open('/dev/ttyACM3','w')

require 'rmagick'

seahawks = Magick::ImageList.new('seahawks.png')
patriots = Magick::ImageList.new('patriots.png')

def rgb(r,g,b)
  OUTPUT.write([b + (g << 5),(g >> 3) + (r << 2)].pack("CC"))
end

def sync
  OUTPUT.write([0xff,0xff].pack("CC"))
end

def scroll(image)
  sync
  (image.columns-4).times do |i|
    view = image.view(image.columns-5-i,0,5,8)
    5.times do |y|
      8.times do |x|
        pixel = view[x][4-y]
        rgb(pixel.red/8/256, pixel.green/8/256, pixel.blue/8/256)
      end
    end
    sleep(0.05)
  end
end

while true
  scroll(seahawks)
  scroll(patriots)
end
sleep(0.25)

output.close
