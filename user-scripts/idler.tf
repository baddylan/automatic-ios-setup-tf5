; TinyFugue no-idle script.
;
; Runs a command every 5 to 15 minutes.  (The time is random.)
;
;; This script is copyrighted July 12, 1999 by Christian J.  Robinson
;; <heptite@gmail.com>.  It is protected and distributed under the
;; terms of the GNU General Public License, version 2 or later.
;
; Set the variable 'Idler_Exclude_Worlds' with a | between each world name to
; exclude worlds from the idle trigger /send command.  Eg:
; /set Idler_Exclude_Worlds=foo|bar|baz
;
; -----------------------------------------------------------------------------
; I'll be trying to keep this up to date to attempt keeping from violating any
; part of the GNU General Publix License version 2 or later, and to keep track
; of changes in general that don't rely on checking git/mercurial commit
; history logs.
;
; Changelog for baddylan/Kobalt:
; Revision 1.7  2024/06/01 15:44:09 CDT  Kobalt
; Ensured it works with TinyFugue 5 beta 7.
; 
; Also changed the command it sends to 'ni', a null-action on the MUCK I'm
; using it on so it's not causing spam in the current world's buffer on my end.
; 
; Another change is to make it so that it runs a command every 1 minute instead
; of randomly sending it between 5 to 15 minutes like it originally did.
; 
; The /echo command now shows color when it starts and stops the No-Idle loop 
; and changed the wording slightly to be slightly less confusing than 
; it was when you'd start the idler.
;
; I also added an extra message when the file loads, to ensure that people
; know how to exclude certain worlds from the No-Idle loop.
;
; The commands it defines are no longer set as invisible so they display when
; the user checks with the /list command. (Personal preference. Feel free to
; change them back to being /def -i instead if you prefer.)
; -----------------------------------------------------------------------------
; Original RCS/CVS (VCS from a couple decades ago, not widely used anymore) log 
; starts below.
; -----------------------------------------------------------------------------
; RCS:
; $Id: idler.tf,v 1.6 2009/06/23 14:08:38 infynity Exp $
; $Log: idler.tf,v $
; Revision 1.6  2009/06/23 14:08:38  infynity
; Update email address
;
; Revision 1.5  2003/05/27 13:30:37  infynity
; Tweaks for TF5.0 alpha 10.
;
; Revision 1.4  2002/06/01 08:05:21  infynity
; Copyright notice added.
;
; Revision 1.3  2002/01/20 22:53:59  infynity
; Idler_Exclude_Worlds feature added.
; Don't set idlerpid if it's already set.
;
; Revision 1.2  2000/09/10 21:48:33  infynity
; Removed extra junk that I'd commented out.
;
; Revision 1.1  1999/07/12 08:25:55  infynity
; Initial revision
;

/loaded __OWNLILB__/idler.tf

/require lisp.tf

/eval /set idlerpid $[idlerpid ? : -1]

/echo -aBCrgb540 -p %% Please make sure to use /set Idler_Exclude_Worlds=world1|world2 to exclude certain worlds from having the command sent to them.@{x}

/def idler = \
	/if ({idlerpid} == -1) \
		/_idler %; \
		/echo -aBCrgb540 -p %% The No-Idle loop has started.@{x} %; \
	/else \
		/echo %% No-Idle loop already running. %; \
	/endif

/def _idler = \
	/let _worlds= %;\
	/let i=1 %;\
	/let _sockets=$(/listsockets -s) %;\
	/let _line=$(/nth %{i} %{_sockets}) %;\
	/while (_line !~ "") \
		/if /eval /test '%_line' !/ '{%Idler_Exclude_Worlds}' %;\
		/then \
			/let _worlds=%_worlds %_line %;\
		/endif %; \
		/test ++i %; \
		/let _line=$(/nth %{i} %{_sockets}) %;\
	/done %;\
	/for i 1 $(/length %{_worlds}) \
		/send -w\$(/nth \%{i} \%{_worlds}) ni %;\
	/repeat -0:1 1 /_idler %;\
	/set idlerpid %?

; These two lines are the original code for lines 80-81 of this file, saved as a comment for reference
; and reverting to it if the user desires.
;		/send -w\$(/nth \%{i} \%{_worlds}} \\\\ %;\
;	/repeat -0:$[rand(5,15)]:$[rand(60] 1 /_idler %;\

;/def -i _idler = \
;	/send -W \\ %;\
;	/repeat -0:$[rand(5,15)]:$[rand(60)] 1 /_idler %;\
;	/set idlerpid %?

/def killidler = \
	/if ({idlerpid} != -1) \
		/kill %idlerpid %; \
		/set idlerpid -1 %; \
		/echo -aBCrgb540 -p %% No-Idle loop killed.@{x} %; \
	/else \
		/echo %% No-Idle loop not running. %; \
	/endif

/def ki = /killidler
