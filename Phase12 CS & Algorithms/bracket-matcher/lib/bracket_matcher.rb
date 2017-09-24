class BracketMatcher
  def self.match_check?(input)
    brackets =  {'[' => ']', '{' => '}', '(' => ')'}
    lefts = brackets.keys
    rights = brackets.values
    stack = []
    input.each_char do |c|
      if lefts.include?(c)
        stack.push(c)
      elsif rights.include?(c)
        return false if stack.empty?
        return false unless brackets[stack.pop].eql?(c)
      end
    end
    stack.empty?
  end
end
