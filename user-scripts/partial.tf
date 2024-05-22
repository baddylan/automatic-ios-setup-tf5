;; Partial Hilite file for TinyFugue. Goes in the $HOME/tf-dir folder of the user.

;;; Explanation of -P0BCrgb###/-P0BCgray##.
;; 'P0' indicating that it's a partial hilite rather than a regular hilite for TinyFugue.
;; 'B' 'C' stands for Bold and Color, respectively. 'rgb' followed by three numbers indicates you're
;; using 256-color mode with rgb (red green blue) support enabled. 035 would be red set to 0,
;; green set to 3, and blue set to 5, which is the maximum amount of blue it can apply. r g and b
;; each accept a number ranging from 0 (none) to 5 (maximum). Having it set to use 'gray'
;; followed by two numbers uses greyscale mode instead of RGB. It ranges from 0-2 for the first 
;; number and 0-9 for the second number.

;;; Partial hilites start here.
;; Certain (important) people get their own color.
;; Left one of my existing entries in there to provide an example for others in the future.

;; Custom color for Arkanis. Somewhat bold, bright cyan looking. (Defined as: BCrgb145 )
/def -Fp1 -P0BCrgb145 -t'(\bArkanis\b)' 

;; Everyone else gets the standard BCrgb035 (indicated by the h in -P0h) instead.
; Example for hiliting partial names.
; /def -Fp1 -P0h -t'(\bName\b|\bName 1\b|\bName 2\b|\Name 3\b)'
; and so on... 
