class Fight
	def arrayMode(sequence)
		binding.pry
		count = 0
    pos = 0
    for i in 0..sequence.length
        count1 = 0
        for j in 0..sequence.length-1
            if sequence[i] == sequence[j]
                count1++
            end
        end
        if count1 > count
            count = count1
            pos = i
        end
    end
    return sequence[pos]
	end
end