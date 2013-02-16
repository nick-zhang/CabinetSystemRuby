module Reporter
  def indent? level
    indent = ""
    level.times do 
      indent << "  "
    end
    indent
  end
end
