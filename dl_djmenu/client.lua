-----------------------------------------------------------------------------------
local LastZone, CurrentAction, hasAlreadyEnteredMarker, job = nil, nil, false, nil
local xSound = exports.xsound
local ox_target = exports.ox_target
-----------------------------------------------------------------------------------

RegisterNetEvent('dl_djmenu:createMusicMenu', function()
    lib.registerContext({
        id = 'music_menu',
        title = Config.Language['titleMenu'],
        options = {
            {
                title = Config.Language['playSong'],
                description = Config.Language['playSongDesc'],
                arrow = false,
                event = 'dl_djmenu:playMusicMenu',
            },
                                {
                title = Config.Language['playlistMenu'],
                description = Config.Language['playlistDesc'],
                arrow = true,
                menu = 'playlist_menu',
            },
            {
                title = Config.Language['pauseMusic'],
                description = Config.Language['pauseMusicDesc'],
                arrow = false,
                serverEvent = 'dl_djmenu:pauseMusic',
            },
            {
                title = Config.Language['resumeMusic'],
                description = Config.Language['resumeMusicDesc'],
                arrow = false,
                serverEvent = 'dl_djmenu:resumeMusic',
            },
            {
                title = Config.Language['changeVolume'],
                description = Config.Language['changeVolumeDesc'],
                arrow = false,
                event = 'dl_djmenu:changeVolumeMenu',
            },
            {
                title = Config.Language['stopMusic'],
                description = Config.Language['stopMusicDesc'],
                arrow = false,
                serverEvent = 'dl_djmenu:stopMusic',
            },
        },
        {
            id = 'playlist_menu',
            title = Config.Language['playlistMenuTitle'],
            options = {
                {
                    title = Config.Playlist['first'],
                    description = Config.Playlist['desc_first'],
                    args = {music = Config.Playlist['music_first_id']},
                    event = 'dl_djmenu:playMusicFromPlaylist'
                },
                {
                    title = Config.Playlist['second'],
                    description = Config.Playlist['desc_second'],
                    args = {music = Config.Playlist['music_second_id']},
                    event = 'dl_djmenu:playMusicFromPlaylist'
                },
                {
                    title = Config.Playlist['third'],
                    description = Config.Playlist['desc_third'],
                    args = {music = Config.Playlist['music_third_id']},
                    event = 'dl_djmenu:playMusicFromPlaylist'
                },
                {
                    title = Config.Playlist['fourth'],
                    description = Config.Playlist['desc_fourth'],
                    args = {music = Config.Playlist['music_fourth_id']},
                    event = 'dl_djmenu:playMusicFromPlaylist'
                },
                {
                    title = Config.Playlist['fifth'],
                    description = Config.Playlist['desc_fifth'],
                    args = {music = Config.Playlist['music_fifth_id']},
                    event = 'dl_djmenu:playMusicFromPlaylist'
                }
            }
        }
    })
    lib.showContext('music_menu')
end)

RegisterNetEvent('dl_djmenu:playMusicFromPlaylist', function (data)
    local input = data.music
    if input then
        TriggerServerEvent('dl_djmenu:playMusic', input)
    end
end)

RegisterNetEvent('dl_djmenu:playMusicMenu', function (YoutubeURL)
    local input = lib.inputDialog(Config.Language['songSel'], {Config.Language['url']})
    if input then
        local YoutubeURL = input[1]
        TriggerServerEvent('dl_djmenu:playMusic', YoutubeURL)
    end
end)

RegisterNetEvent('dl_djmenu:changeVolumeMenu', function ()
    local input = lib.inputDialog(Config.Language['musicVolume'], {Config.Language['musicVolumeNm']})
    if input then
        local volume = input[1]
        TriggerServerEvent('dl_djmenu:changeVolume', volume)
    end
end)

CreateThread(function()
    if not Config.ox_target then
        while true do
            local sleep = 1500
            local playerCoords, inLocation, currentZone = GetEntityCoords(PlayerPedId()), false, false

            for i=1, #Config.Locations do
                local dist = #(playerCoords - Config.Locations[i].coords)
                if dist <= Config.Distance then
                    sleep = 0
                    if dist <= Config.Locations[i].distance and Config.Locations[i].onlyJob then
                        inLocation, currentZone, job = true, i, Config.Locations[i].job
                    elseif dist <= Config.Locations[i].distance and not Config.Locations[i].onlyJob then
                        inLocation, currentZone, job = true, i, nil
                    end
                end
            end

            if (inLocation and not hasAlreadyEnteredMarker and ESX.PlayerData.job.name == job) or (inLocation and LastZone ~= currentZone and ESX.PlayerData.job.name == job) then
                hasAlreadyEnteredMarker, LastZone = true, currentZone
                CurrentAction = 'musicMenu'
                lib.showTextUI(Config.Language['openMenu'])
            elseif (inLocation and not hasAlreadyEnteredMarker and job == nil) or (inLocation and LastZone ~= currentZone and job == nil) then
                hasAlreadyEnteredMarker, LastZone = true, currentZone
                CurrentAction = 'musicMenu'
                lib.showTextUI(Config.Language['openMenu'])
            end

            if not inLocation and hasAlreadyEnteredMarker then
                hasAlreadyEnteredMarker = false
                sleep = 1000
                CurrentAction = nil
                lib.hideTextUI()
            end
            Wait(sleep)
        end
    else
        for k, v in pairs(Config.Locations) do
            if v.onlyJob then
                ox_target:addSphereZone({
                    coords = v.coords,
                    radius = 1,
                    debug = drawZones,
                    options = {
                        {
                            name = 'sphere:dj',
                            event = 'dl_djmenu:createMusicMenu',
                            icon = 'fa fa-music',
                            label = 'DJ Pult',
                            canInteract = function(entity, distance, coords, name)
                                if v.onlyJob and ESX.PlayerData.job.name == v.job then
                                    return true
                                end
                            end
                        }
                    }
                })
            elseif not v.onlyJob then
                ox_target:addSphereZone({
                    coords = v.coords,
                    radius = 1,
                    debug = drawZones,
                    options = {
                        {
                            name = 'sphere:dj',
                            event = 'dl_djmenu:createMusicMenu',
                            icon = 'fa fa-music',
                            label = 'DJ Pult',
                            canInteract = function(entity, distance, coords, name)
                                return true
                            end
                        }
                    }
                })
            end
        end
    end
end)

if not Config.ox_target then
    CreateThread(function ()
        while true do
            local sleep = 1500
            if CurrentAction ~= nil then
                sleep = 0
                if IsControlPressed(1, 38) then
                    Wait(500)
                    if CurrentAction == 'musicMenu' then
                        TriggerEvent('dl_djmenu:createMusicMenu')
                    end
                end
            end
            Wait(sleep)
        end
    end)
end
