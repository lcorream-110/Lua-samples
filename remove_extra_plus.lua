M = {}
function M.outbound_INVITE(msg)
    local from = msg:getHeader("P-Asserted-Identity")
    local newfrom = string.gsub(from, "++" ,"+")
    msg:modifyHeader("P-Asserted-Identity", newfrom)
end
return M
