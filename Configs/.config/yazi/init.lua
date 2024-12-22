function Linemode:custom()
    local size = self._file:size()
    local owner = self._file:owner()
    return ui.Line(string.format(owner, size and ya.readable_size(size):gsub(" ", "") or "-"))
end

function Status:name()
    local linked = ""
    local h = self._current.hovered
    if h.link_to ~= nil then
        linked = " -> " .. tostring(h.link_to)
    end

    return ui.Line(" " .. h.name .. linked)
end

Header:children_add(function()
    if ya.target_family() ~= "unix" then
        return " "
    end
    return ui.Span(ya.user_name() .. "@" .. ya.host_name() .. ":"):fg("blue")
end, 500, Header.Left)
