@include

if !savestates
	org $0082F6
			jsr nmi_hijack
endif

; smb1 hijacks
org $038269
		jml gameplay_hijack_smb1

org $039131
		jsl og_hud_init
		nop

org $038AC8
		jsl world_win
		nop

org $03D87A
		jsl level_win
		nop

org $03ADE5
		jsr level_tick_hijack_smb1
org $03FFDE
level_tick_hijack_smb1:
		jsl level_tick
		rts

warnpc $03FFFF

org $05DF38
		jsr pause_check_smb1
		nop
org $05EE66
pause_check_smb1:
		lda !menu_closing
		ora !menu_flag
		bne .no_pause
		lda !axlr
		and #%00010000
		bne .no_pause
		lda !byetudlr_1f
		rts

	.no_pause:
		lda #$00
		and #$19
		rts

warnpc $05FFFF

; smb2j hijacks

org $0D8114
		jml gameplay_hijack

org $0D8E0F
		jsl og_hud_init
		nop

org $0D8849
		jsl world_win
		
org $0DD769
		jsl level_win
		nop
		
org $0DAC02
		jsr level_tick_hijack
org $0DFFF4
level_tick_hijack:
		jsl level_tick
		rts

warnpc $0DFFFF

org $0FD99F
		jsr pause_check
org $0FFD01
pause_check:
		lda !menu_closing
		ora !menu_flag
		bne .no_pause
		lda !axlr
		and #%00010000
		bne .no_pause
		lda !byetudlr_1f
		rts

	.no_pause:
		lda #$00
		rts

warnpc $0FFFFF

		