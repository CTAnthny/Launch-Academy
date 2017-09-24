class Circle
  def initialize(options)
    if options.kind_of?(Hash)
      if options[:radius].nil?
        @radius = options[:diameter] / 2
      else
        @radius = options[:radius]
      end
    else
      @radius = options
    end
  end
end
