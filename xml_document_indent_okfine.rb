class XmlDocument

  def initialize(indent = false)
      @indent = indent
      @depth = 0
  end

  def hello(input = {},&prc)
    unless prc.nil?
      return "<hello>" + prc.call + "</hello>"
    end

    result = "<hello"
    input.each { |key,value| result << " #{key}='#{value}'"}
    result + '/>'
  end

  def send(tag_name)
    "<#{tag_name}/>"
  end

  def goodbye(&prc)
    unless prc.nil?
      return "<goodbye>" + prc.call + "</goodbye>"
    end
    "<goodbye/>"
  end

  def ok_fine(input = {})
    result = "<ok_fine"
    input.each { |key,value| result << " #{key}='#{value}'"}
    result + '/>'
    if @indent
      '  ' * @depth + result + '\n'
    else
      result
    end
  end

  def come_back(&prc)
    unless prc.nil?
      return "<come_back>" + prc.call + "</come_back>"
    end
  end

end