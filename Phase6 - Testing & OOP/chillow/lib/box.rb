require_relative "../spec/spec_helper.rb"

class Box 
  attr_reader :owner_name, :contents

  def initialize(owner_name, contents = nil)
    @owner_name = owner_name
    @contents = contents
  end
end
