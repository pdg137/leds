output = File.open('/dev/ttyACM0','w')

40.times do
  output.write('\x00\x00')
end
