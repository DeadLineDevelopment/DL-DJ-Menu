Config = {}

--- Common settings ---
Config.Debug = true -- If you want debug in console
Config.DefaultVolume = 0.1 -- Accepted values are 0.01 - 1
Config.Distance = 5.0 -- Dont touch this

--- Target system ---
Config.ox_target = true -- Set true if youe want to use ox_target, if set false you will use ox_lib TextUI

--- Locations ---
Config.Locations = {
    {
        onlyJob = false, -- Set true if you want to be whitelist job, set false if you want everyone to have access to DJ Menu
        job = 'bahama', -- Job for DJ Menu
        name = 'Bahama', -- Name that will be displayed 
        coords = vec3(-1378.53, -628.955, 30.628), -- Coordinates where DJ Menu can be accessed
        radius = 30, -- Radius of song
        distance = 2.5, -- Daccess distance for DJ Menu
        isPlaying = false -- Keep it false, to avoid any bugs
    }
}

---#Tamplate---

--- {
    --onlyJob = false,
    --job = 'bahama',
    --name = 'Bahama',
    --coords = vec3(-1378.53, -628.955, 30.628),
    --radius = 30,
    --distance = 2.5,
    --isPlaying = false
--}

--# Note this is tamplate for configuration more jobs, when you want to use it please remove dashes in frot of tamplate and than use it.

Config.Language = {
    ['openMenu'] = '[E] - Open a DJ Menu',
    ['titleMenu'] = '💿 | DJ Menu',
    ['playSong'] = '🎶 | Play Song',
    ['playSongDesc'] = 'Insert YT URL',
    ['pauseMusic'] = '⏸️ | Pause Song',
    ['pauseMusicDesc'] = 'Pause the current song',
    ['resumeMusic'] = '▶️ | Continue the Song',
    ['resumeMusicDesc'] = 'Resume playing the song you paused.',
    ['changeVolume'] = '🔈 | Change Volume',
    ['changeVolumeDesc'] = 'Change the sound of the song',
    ['stopMusic'] = '❌ | Stop Song',
    ['stopMusicDesc'] = 'Turn off the song and select a new song',
    ['songSel'] = 'Song Selection',
    ['url'] = 'Youtube URL',
    ['musicVolume'] = 'Song Volume',
    ['musicVolumeNm'] = 'Min: 0.01 - Max: 1', -- Pls dont change numbers (0.01 - 1)

    --- Playlist ---
    ['playlistMenu'] = '🎶 | DJ Meni Playlist',
    ['playlistDesc'] = 'Pusti pjesmu sa playliste',
    ['playlistMenuTitle'] = '🎶 | Pusti Pjesmu'
}

Config.Playlist = {
    --- First Song
    ['first'] = '💿 | Mess', -- Name of first song
    ['desc_first'] = 'Description of the song', -- Description of the song
    ['music_first_id'] = 'https://www.youtube.com/watch?v=-Kjrf-pxQc4', -- Url from YT

    --- Second Song ---
    ['second'] = '💿 | Shiver', -- Name of second song
    ['desc_second'] = 'Description of the song',
    ['music_second_id'] = 'https://www.youtube.com/watch?v=NdUNtHqY5r8',

    --- Third Song ---
    ['third'] = '💿 | Good With It', -- Name of third song
    ['desc_third'] = 'Description of the song',
    ['music_third_id'] = 'https://www.youtube.com/watch?v=RInypZYiiDM',

    --- Fourth Song ---
    ['fourth'] = '💿 | Back To You',
    ['desc_fourth'] = 'Description of the song',
    ['music_fourth_id'] = 'https://www.youtube.com/watch?v=rrzHAoA-oRI',

    --- Fifth Song ---
    ['fifth'] = '💿 | Curse',
    ['desc_fifth'] = 'Description of the song',
    ['music_fifth_id'] = 'https://www.youtube.com/watch?v=XsmuiDRKbDk'
}

--- Sixth Song ---
--['sixth'] = '💿 | Name of song', 
--['desc_fifth'] = 'Description of the song',
--['music_fifth_id'] = 'Replace with YT URL of song'