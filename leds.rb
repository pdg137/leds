OUTPUT = File.open('/dev/ttyACM3','w')

def rgb(r,g,b)
  OUTPUT.write([b + (g << 5) + (r << 10)].pack("S<"))
end

40.times do
  rgb(31,0,0)
  rgb(0,31,0)
  rgb(0,0,31)
  rgb(31,31,31)
end

sleep 0.25
