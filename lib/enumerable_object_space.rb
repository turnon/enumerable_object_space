require "enumerable_object_space/version"

module EnumerableObjectSpace

  OriginMethods = [:private_methods,
                   :protected_methods,
                   :public_methods,
                   :singleton_methods].
                     map{|m| ObjectSpace.send m}.
                     flatten.
                     uniq

  NotSupported = Enumerable.instance_methods & OriginMethods

end

class << ObjectSpace
  def each *arg, &blk
    each_object *arg, &blk
  end

  (Enumerable.instance_methods - EnumerableObjectSpace::NotSupported).each do |m|
    method = Enumerable.instance_method(m).bind(ObjectSpace)
    define_method m, method.to_proc
  end
end
