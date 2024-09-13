M = {}
function M.outbound_INVITE(msg)
    local sdp = msg:getSdp()
    if sdp
    then
        local connection = sdp:getLine("a=","inactive")
        if connection
        then
            --Replace G.722 with G722. The dot is special and must be escaped using % when using gsub.
            connection = connection:gsub("inactive", "sendrecv")
            sdp = sdp:modifyLine("a=", "inactive", connection)
            msg:setSdp(sdp)
        end
    end
end

return M