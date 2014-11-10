class XmlDocument

  def initialize(indent = false)
      @indent = indent
      @depth = 0
  end

  def hello(input = {},&prc)
    unless prc.nil?
      if @indent
        local_depth = @depth
        @depth += 1
        space = '  ' * local_depth
        return space + "<hello>\n" + prc.call + space + "</hello>\n"
      else
        return "<hello>" + prc.call + "</hello>"
      end
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
      if @indent
        local_depth = @depth
        @depth += 1
        space = '  ' * local_depth
        return space + "<goodbye>\n" + prc.call + space + "</goodbye>\n"
      else
        return "<goodbye>" + prc.call + "</goodbye>"
      end
    end

    "<goodbye/>"
  end

  def ok_fine(input = {})
    result = "<ok_fine"
    input.each { |key,value| result << " #{key}='#{value}'"}
    result += '/>'
    if @indent
      '  ' * @depth + result + "\n"
    else
      result
    end
  end


  def come_back(&prc)
    unless prc.nil?
      if @indent
        local_depth = @depth
        @depth += 1
        space = '  ' * local_depth
        return space + "<come_back>\n" + prc.call + space + "</come_back>\n"
      else
        return "<come_back>" + prc.call + "</come_back>"
      end
    end
  end

end