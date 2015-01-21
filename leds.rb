OUTPUT = File.open('/dev/ttyACM3','w')

def rgb(r,g,b)
#  OUTPUT.write([b + (g << 5),(g >> 3) + (r << 2)].pack("CC"))
  OUTPUT.write([b + (g << 5) + (r << 10)].pack("s<"))
end

40.times do
  rgb(0,0,10)
end

sleep 0.25
