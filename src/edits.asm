@include

if !savestates
	; 256kB sram
	org $00FFD8
			db $08
endif

; disable sram size checks
org $008063
		bra $18
org $038015
		bra $18
org $0D800D
		bra $18
org $11803C
		bra $18
org $20A116
		bra $18


; hud tiles
org $0CF800
		incbin "bg3tiles.bin"

; smb1 edits
; move timer 1 tile to the left
org $039C78
	db $79

;infinite lives
org $03A06B
		bra +
org $03A079
	+

; smb2j edits
; move timer 1 tile to the left
org $0D9833
	db $79
	
; infinite lives
org $0D9F89
		bra +
org $0D9F97
	+
	