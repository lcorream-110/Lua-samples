M = {}
function M.outbound_INVITE(msg)
    local sdp = msg:getSdp()
    if sdp
    then
        local connection = sdp:getLine("a=","inactive")
        local mediaip = sdp:getLine("c=","IN IP4 0.0.0.0")
        if connection
        then
            --Replace inactive with sendrecv via gsub.
            connection = connection:gsub("inactive", "sendrecv")
            --Replace 0.0.0.0 with the actual IP address of the CUCM server (replace X.X.X.X with the CUCM IP address)
            mediaip = mediaip:gsub("0.0.0.0","X.X.X.X")
            sdp = sdp:modifyLine("a=", "inactive", connection)
            sdp = sdp:modifyLine("c=","0.0.0.0",mediaip)
            msg:setSdp(sdp)
        end
    end
end

return M
