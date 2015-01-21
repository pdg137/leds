  ((0..31).to_a+(0..30).to_a.reverse).each do |i|
    5.times do
      rgb(i,i,i)
      rgb(i,0,0)
      rgb(i,i,0)
      rgb(0,i,0)
      rgb(0,i,i)
      rgb(0,0,i)
      rgb(i,0,i)
    end
    rgb(i,i,i)
    rgb(i,0,0)
    rgb(i,i,0)
    rgb(0,i,0)
    rgb(0,i,i)
  end

  ((0..31).to_a+(0..30).to_a.reverse).each do |i|
    5.times do
      rgb(i,i,i)
      rgb(i,0,0)
      rgb(i,i,0)
      rgb(0,i,0)
      rgb(0,i,i)
      rgb(0,0,i)
      rgb(i,0,i)
      rgb(i,i,i)
    end
  end

  ((0..31).to_a+(0..30).to_a.reverse).each do |i|
    8.times { rgb(i,0,0) }
    8.times { rgb(i,i,0) }
    8.times { rgb(0,i,0) }
    8.times { rgb(0,i,i) }
    8.times { rgb(0,0,i) }
  end

