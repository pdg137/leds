OUTPUT = File.open('/dev/ttyACM3','w')

def rgb(r,g,b)
  OUTPUT.write([b + (g << 5) + (r << 10)].pack("S<"))
end

10.times do
  rgb(0,0,31)
  rgb(0,31,0)
  rgb(31,0,0)
  rgb(31,31,31)
end
