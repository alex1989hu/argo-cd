hs = {}
if obj.status ~= nil then
  if obj.status.status == "Accepted" then
    hs.status = "Healthy"
    return hs
  end
  if obj.status.status == "Rejected" then
    hs.status = "Degraded"
    hs.message = obj.status.error
    return hs
  end
end
hs.status = "Progressing"
hs.message = "Waiting for HTTPRule creation"
return hs
