M = {}
function M.outbound_INVITE(msg)
    local pai = msg:getHeader("P-Asserted-Identity")
    local from = msg:getHeader("From")
    local contact = msg:getHeader("Contact")
    local newpai = string.gsub(pai, "++" ,"+")
    local newfrom = string.gsub(from, "++" ,"+")
    local newcontact = string.gsub(contact, "++" ,"+")
    msg:modifyHeader("P-Asserted-Identity", newpai)
    msg:modifyHeader("From", newfrom)
    msg:modifyHeader("Contact", newcontact)
end
return M
