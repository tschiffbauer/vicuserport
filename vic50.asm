; An extremely shoddy 60kHz sound player for the Commodore VIC-20.
; Converted from the Commodore PET version by David Given (original is CC0 licensed).
; Assemble with beebasm. zap60000.a2stream should be a 1-bit bitstream, MSB first.

	org &fff		; VIC-20 program start at $1000 (vs $03ff for PET) for 8k+ expanded: org $1201 8k+
	equw &1001, _entry_string_end, 1
	equb &9e, "4109", 0
._entry_string_end
	equw 0

; VIC-20 VIA addresses (different from PET)
VIA_T1C_L = &9114	; Timer 1 counter low (was $e844 on PET)
VIA_T1C_H = &9115	; Timer 1 counter high (was $e845)
VIA_T1L_L = &9124	; Timer 1 latch low (was $e846)
VIA_T1L_H = &9125	; Timer 1 latch high (was $e847)
VIA_T2C_L = &9128	; Timer 2 counter low (was $e848)
VIA_T2C_H = &9129	; Timer 2 counter high (was $e849)
VIA_SR    = &912A	; Shift register (was $e84a)
VIA_ACR   = &912b	; Auxiliary control register (was $e84b)
VIA_PCR   = &912c	; Peripheral control register (was $e84c)
VIA_IFR   = &912d	; Interrupt flag register (was $e84d)

CLOCK_RATE = 1000000
SAMPLE_RATE = 60000
TICKS = (CLOCK_RATE / SAMPLE_RATE) / 2

	org 0
.sample_ptr equw 0
.current_sample equb 0
.bit_counter equb 0

	org &4109		; Entry point in VIC-20 memory
._entry
	sei

	lda #&14
	sta VIA_ACR
	lda #&ac
	sta VIA_PCR

	lda #lo(TICKS)
	sta VIA_T2C_L

	lda #lo(binary_data)
	sta sample_ptr+0
	lda #hi(binary_data)
	sta sample_ptr+1

	jmp loopentry

.loop
	ldy #0
	lda (sample_ptr), y
	tax

.wait
	lda #&04
	bit VIA_IFR				; 4
	beq wait				; 2

	sta VIA_IFR				; 4

.loopentry
	stx VIA_SR				; 4; total = 14

	inc sample_ptr+0
	bne loop
	inc sample_ptr+1
	jmp loop

.binary_data:
	incbin "zap60000.a2stream"

._end

SAVE "vic20prog.prg", &fff, _end
