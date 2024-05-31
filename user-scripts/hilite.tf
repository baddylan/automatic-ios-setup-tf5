;;;; TinyFugue 5 highlighting definitions

;; If you have watchfor (wf and/or wft) connect/disconnect notifications enabled, they will be highlighted bold yellow. (with time in HH:mm:ss added. Commented out by default.)
;/def -Fp1 -aBCrgb540 -mregexp -t'^Somewhere.*muck,\\s[\\w.\'-]+\\shas\\s(dis|re)?connected\\sat\\s[0-9]+\\:[0-9]+\\:[0-9]+\\.\\s?$'

;; If you have watchfor (wf and/or wft) connect/disconnect notifications enabled, they will be highlighted bold yellow.
/def -Fp1 -aBCrgb540 -mregexp -t'^Somewhere.*muck,\\s[\\w.\'-]+\\shas\\s(dis|re)?connected\\.\\s?$'

;; Incoming pages with 'page #prepend <page %w>' setup on it. Highlights bold blue.
;/def -Fp1 -aBCrgb035 -mregexp -t'^<page\\s[0-9]+\\:[0-9]+(am|pm)?>\\s(.+).$'

;; Handles outgoing pages, highlights bold blue.
/def -Fp1 -aBCrgb035 -mregexp -t'^(You page,|You page-pose,)' 

;; Handles outgoing whispers, highlights bold blue.
/def -Fp1 -aBCrgb035 -mregexp -t'^You whisper,(.+)$' 

;; Incoming whispers with 'whisper #prepend <whisp at: %W>' setup on it. Highlights bold blue.
;/def -Fp1 -aBCrgb035 -mregexp -t'^<whisp\\sat\\:\\s[0-9]+\\:[0-9]+(am|pm)?>\\s(.+)\\.$' 

;/def -Fp1 -aBCrgb035 -mregexp -t'^\\[(.+)\\sjust\\slooked\\sin\\syour\\sdirection!\\s\\((.+)\\s(.+)\\)\\]$' 

;/def -Fp1 -aBCrgb035 -mregexp -t'^\\[(.+)\\slooked\\sat\\syour\\sCharacter\\sInfo.\\s' 

;/def -Fp1 -aBCrgb035 -mglob -t'>> * just checked if you\'re interested in them!' 

;/def -Fp1 -aBCrgb035 -mglob -t'\\[* just checked to see what messengers you have!\\]' 

;; Shows when someone has disconnected, or left the area in bold red.
/def -Fp1 -aBCrgb500 -mregexp -t'swept\saway\.($|[^a-zA-Z0-9]+)|.fades\sfrom\ssight\.$|\shome\.\s?(?![^(]|[^a-zA-Z])| disconnected\.$|\(idle-sweep\)$|\(sleep-sweep\)$|space\/time\srift\.$' 

;; Shows when someone has connected, or left the area in bold green.
/def -Fp1 -aBCrgb050 -mregexp -t's\\sconnected\\.(?![a-zA-Z0-9]+)|Taxi\\sservice\\.$|\\steleport\\sbooth\\.\\s?($|[^a-zA-Z0-9]+)' 

;; Bold orange, OOC highlighted.
/def -Fp1 -aBCrgb530 -mregexp -t'\\s\\(OOC\\)\\ssays,\\s|\\s\\(OOC\\)\\s|\[OOC\]\s' 

;; I'm not entirely sure, but it's bold purple.
/def -Fp1 -aBCrgb314 -mregexp -t'(^\+\+|^<.*u>$|^\[.*y*\!\]$)' 


