M = {}
function M.outbound_INVITE(msg)
    local sdp = msg:getSdp()
    if sdp
    then
        local connection = sdp:getLine("a=","inactive")
        if connection
        then
            --Replace inactive with sendrecv via gsub.
            connection = connection:gsub("inactive", "sendrecv")
            sdp = sdp:modifyLine("a=", "inactive", connection)
            msg:setSdp(sdp)
        end
    end
end

return M
