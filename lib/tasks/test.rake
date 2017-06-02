task :insertionSort  do
	array = [ 1, 4, 2, 3, 5,9 ]
  for i in 1..array.length-1
    value = array[i]
    j = i
    while j > 0 && array[j-1] > value
      a = array[j-1]
      array[j-1] =array[j]
      array[j] = a
      j -= 1
    end
    array[j] = value
  end
  puts array
end
task :selectionSort do
  array = [1,4,2,3,5,9]
  for i in 0..array.length-1
    first = i
    for j in i..array.length-1
      if array[j] < array[first]
        first = j
      end
    end

    a = array[i]
    array[i] = array[first]
    array[first] = a
  end 
  puts array
end
task :fib do
  n = 30
  array = []
  output = []
  s = 0,s1=0,s2=1
  for i in 1..n
    s = s1+s2
    s1 = s2
    s2 = s
    print s.to_s + " "
  end

end
task :matix do 
  a = [[1,4,6],[3,8,5]]
  b = []
  for i in 0..a[0].length-1
    sum = 0
    for j in 0..a.length-1
      sum += a[j][i]
    end
    b << sum/a.length.to_f
  end
  puts b
end

task :sss do
  score1 = 3
  score2 = 6
  if score1 < score2
      c = score1
      score1 = score2
      score2 = c
  end
  k = 0
  if ( score1 == 6 & score2 < 5) || (score1 == 7 && score2 >=5 && score1 > score2)
    k =1 
  end
  puts k  
end

