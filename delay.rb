def delay_1s
  1000.times do
    sleep 0.001
  end
end

while true
  puts "tick"
  delay_1s
  puts "tock"
  delay_1s
end
