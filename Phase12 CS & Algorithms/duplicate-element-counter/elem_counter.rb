class ElementCounter

  def self.duplicates(array = [])
    if array.empty?
      return 0
    else
      dup_count = 0
      dup_array = []
      array.each do |i|
        if dup_array.include?(i)
          dup_count += 1
        else
          dup_array.push(i)
        end
      end
      return dup_count
    end
  end

end
