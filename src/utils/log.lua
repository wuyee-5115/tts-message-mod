local log = {}
function log.dev(message)
    if dev then
        print('dev: ', message)
    end
end
return log