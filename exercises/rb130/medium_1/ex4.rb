def method(array)
  yield(array)
end

method(%w(raven finch hawk eagle)) { |_, _, *raptors| p raptors }
