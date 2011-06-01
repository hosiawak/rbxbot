class SourceBrowser

  def self.find(name)
    if name =~ /(\S+)\#(\S+)\Z/
        # instance method
        meth = eval("#{$1}.instance_method(:#{$2})")
    elsif name =~ /(\S+)\.(\S+)\Z/
      # class method
      meth = eval("#{$1}.method(:#{$2})")
    else
      meth = Kernel.method(name)
    end
    return meth.source_location if meth
    rescue Exception
    nil
  end
end
