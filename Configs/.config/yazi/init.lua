function Linemode:custom()
    local size = self._file:size()
    local owner = self._file:owner()
    return ui.Line(string.format(owner, size and ya.readable_size(size):gsub(" ", "") or "-"))
end

