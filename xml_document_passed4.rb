class XmlDocument

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







end