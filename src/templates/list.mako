<html>
<head>
    <title></title>
    <style type="text/css">

    </style>
    <link rel="stylesheet" type="text/css" href="/content/css/style.css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
    <script type="text/javascript" src="/content/js/torrents.js"></script>
</head>
<body>
    <h1>Torrents list</h1>
    <div>
        <b>Finished: </b>${statistics['finished']} / ${statistics['count']}<br/>
        <b>Overal done: </b>${statistics['percent_done']}%<br/>
        <b>D/L rate: </b>${statistics['download']} Kb/s<br/>
        <b>U/L rate: </b>${statistics['upload']} Kb/s<br/>
    </div>
    <table>
    <tr>
        <th></th>
        <th>File</th>
        <th></th>
        <th>%<br/>done</th>
        <th>share<br/>rating</th>
        <th>pid</th>
        <th>last<br/>update</th>
        <th>size</th>
        <th>TTF</th>
        <th>speed</th>
    </tr>
    % for torrent in torrents:
    <tr>
        <td>
        % if torrent.is_running:
        <img src="/content/img/arrow_up.png" />
        % else:
        <img src="/content/img/cross.png" />
        % endif
        </td>
        <td>
        <span style="
        % if torrent.is_running:
        color: green
        % else:
        color: red
        %endif
        ">
        ${torrent.name}</span>
        </td>
        <td>
        <input type="button" id="${torrent.pid}" class="torrent_start" value="Start"/>
        <input type="button" id="${torrent.pid}" class="torrent_stop" value="Stop"/>
        </td>
        <td>${torrent.percent_done}</td>
        <td>${torrent.share_rating}</td>
        <td>${torrent.pid}</td>
        <td>${torrent.last_update}</td>
        <td>${torrent.size}</td>
        <td>${torrent.time_left}</td>
        <td>[D: ${torrent.download_rate} / U: ${torrent.upload_rate}]</td>
    </tr>
    % endfor
    </table>
    <input type="button" value="Reload"  onclick="window.location.reload();"/>
    <input type="button" id="start_all_torrents" value="Start all"/>
    <input type="button" id="stop_all_torrents" value="Stop all"/>
</body>