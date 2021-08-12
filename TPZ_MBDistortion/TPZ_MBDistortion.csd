;Multiband Distortion
;developed by Triceratupuz Lab
;http://triceratupuz.altervista.org/
;REV 20210727


<Cabbage>

#define BA trackerColour(180,160,160)
#define MI trackerColour(160,180,160)
#define HI trackerColour(160,160,180)

form caption("MBDistortion") size(240, 595), colour(48, 50, 62), pluginId("mbtp")
rslider bounds(36, 0, 80, 80), channel("FLOW"), range(20, 12000, 500, 0.5), text("Low F"), trackerColour("white")
rslider bounds(120, 0, 80, 80), channel("FHIGH"), range(20, 12000, 3000, 0.5), text("High F"), trackerColour("white") 

rslider bounds(10, 80, 65, 65), channel("GB"), range(-100, 100, 0), $BA
rslider bounds(90, 80, 65, 65), channel("GM"), range(-100, 100, 0), $MI
rslider bounds(170, 80, 65, 65), channel("GH"), range(-100, 100, 0), $HI
label bounds(0, 140, 240, 15), text("Pre Gain"), align("centre")

rslider bounds(10, 160, 65, 65), channel("DIB"), range(0, 1, 0), $BA
rslider bounds(90, 160, 65, 65), channel("DIM"), range(0, 1, 0), $MI
rslider bounds(170, 160, 65, 65), channel("DIH"), range(0, 1, 0), $HI
label bounds(0, 220, 240, 15), text("Distortion"), align("centre")

rslider bounds(10, 240, 65, 65), channel("DWB"), range(0, 1, 1), $BA
rslider bounds(90, 240, 65, 65), channel("DWM"), range(0, 1, 1), $MI
rslider bounds(170, 240, 65, 65), channel("DWH"), range(0, 1, 1), $HI
label bounds(0, 300, 240, 15), text("Dry - Wet"), align("centre")

rslider bounds(10, 320, 65, 65), channel("PGB"), range(-100, 100, 0), $BA
rslider bounds(90, 320, 65, 65), channel("PGM"), range(-100, 100, 0), $MI
rslider bounds(170, 320, 65, 65), channel("PGH"), range(-100, 100, 0), $HI
label bounds(0, 380, 240, 15), text("Post Gain"), align("centre")

vslider bounds(0, 400, 20, 80), channel("EQ1"), range(-24, 24, 0), textBox("0")
label bounds(20, 480, 50, 15), text("25"), colour(255,255,255,0), align("left"), rotate(1.57, 0, 0)
vslider bounds(20, 400, 20, 80), channel("EQ2"), range(-24, 24, 0), textBox("0")
label bounds(40, 480, 50, 15), text("48"), colour(255,255,255,0), align("left"), rotate(1.57, 0, 0)
vslider bounds(40, 400, 20, 80), channel("EQ3"), range(-24, 24, 0), textBox("0")
label bounds(60, 480, 50, 15), text("92"), colour(255,255,255,0), align("left"), rotate(1.57, 0, 0)
vslider bounds(60, 400, 20, 80), channel("EQ4"), range(-24, 24, 0), textBox("0")
label bounds(80, 480, 50, 15), text("178"), colour(255,255,255,0), align("left"), rotate(1.57, 0, 0)
vslider bounds(80, 400, 20, 80), channel("EQ5"), range(-24, 24, 0), textBox("0")
label bounds(100, 480, 50, 15), text("343"), colour(255,255,255,0), align("left"), rotate(1.57, 0, 0)
vslider bounds(100, 400, 20, 80), channel("EQ6"), range(-24, 24, 0), textBox("0")
label bounds(120, 480, 50, 15), text("660"), colour(255,255,255,0), align("left"), rotate(1.57, 0, 0)
vslider bounds(120, 400, 20, 80), channel("EQ7"), range(-24, 24, 0), textBox("0")
label bounds(140, 480, 50, 15), text("1.3k"), colour(255,255,255,0), align("left"), rotate(1.57, 0, 0)
vslider bounds(140, 400, 20, 80), channel("EQ8"), range(-24, 24, 0), textBox("0")
label bounds(160, 480, 50, 15), text("2.2k"), colour(255,255,255,0), align("left"), rotate(1.57, 0, 0)
vslider bounds(160, 400, 20, 80), channel("EQ9"), range(-24, 24, 0), textBox("0")
label bounds(180, 480, 50, 15), text("4.7k"), colour(255,255,255,0), align("left"), rotate(1.57, 0, 0)
vslider bounds(180, 400, 20, 80), channel("EQ10"), range(-24, 24, 0), textBox("0")
label bounds(200, 480, 50, 15), text("9.1k"), colour(255,255,255,0), align("left"), rotate(1.57, 0, 0)
vslider bounds(200, 400, 20, 80), channel("OUT"), range(-24, 24, 0), textBox("0")
label bounds(220, 480, 50, 15), text("Out"), colour(255,255,255,0), align("left"), rotate(1.57, 0, 0)

;Vumeter
checkbox bounds(220, 460, 20, 10), channel("Peak5"), value(1), colour:0("black"), colour:1("green"), textBox(1)
checkbox bounds(220, 450, 20, 10), channel("Peak4"), value(1), colour:0("black"), colour:1("green"), textBox(1)
checkbox bounds(220, 440, 20, 10), channel("Peak3"), value(1), colour:0("black"), colour:1("green"), textBox(1)
checkbox bounds(220, 430, 20, 10), channel("Peak2"), value(1), colour:0("black"), colour:1("green"), textBox(1)
checkbox bounds(220, 420, 20, 10), channel("Peak1"), value(1), colour:0("black"), colour:1("yellow"), textBox(1)
checkbox bounds(220, 410, 20, 10), channel("Peak0"), value(1), colour:0("black"), colour:1("red"), textBox(1)





;Input
label bounds(0, 515, 115, 15), text("Input")
combobox bounds(0, 530, 115, 20), channel("in_mode"), value(3), items("left only", "right only", "stereo")
;Output
label bounds(125, 515, 115, 15), text("Output")
combobox bounds(125, 530, 115, 20), channel("out_mode"), value(2), items("mono", "stereo")
;preset
filebutton bounds(0, 550, 240, 20), channel("butsave"), text("Save"), mode("snapshot")
combobox bounds(0, 570, 240, 20), channel("combobox"), populate("*.snaps")

</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 64
nchnls = 2
0dbfs=1



opcode AtanLimit, a, a
ain xin
aout = 2 * taninv(ain) / 3.1415927
xout aout
endop


gidistfunction	ftgen	0,0, 257, 9, .5,1,270


instr 1
kin_mode chnget "in_mode"
a1,a2 ins
gao1 init 0
gao2 init 0

kin_modec changed kin_mode
if kin_mode == 1 then; leftonly
	gao1 = a1
	gao2 = a1
elseif kin_mode == 2 then; rightonly
	gao1 = a2
	gao2 = a2
elseif kin_mode == 3 then; stereo
	gao1 = a1
	gao2 = a2 
endif

endin




instr 10
kInlf_ chnget "FLOW"
kInlf port kInlf_, 0.01
kInhf_ chnget "FHIGH"
kInhf port kInhf_, 0.01
kinGb_ chnget "GB"
kinGb port kinGb_, 0.01
kinGm_ chnget "GM"
kinGm port kinGm_, 0.01
kinGh_ chnget "GH"
kinGh port kinGh_, 0.01
kdistb_ chnget "DIB"
kdistb port kdistb_, 0.01
kdistm_ chnget "DIM"
kdistm port kdistm_, 0.01
kdisth_ chnget "DIH"
kdisth port kdisth_, 0.01
kdwb_ chnget "DWB"
kdwb port kdwb_, 0.01
kdwm_ chnget "DWM"
kdwm port kdwm_, 0.01
kdwh_ chnget "DWH"
kdwh port kdwh_, 0.01
kPostGb_ chnget "PGB"
kPostGb port kPostGb_, 0.01
kPostGm_ chnget "PGM"
kPostGm port kPostGm_, 0.01
kPostGh_ chnget "PGH"
kPostGh port kPostGh_, 0.01
keqb1_ chnget "EQ1"
keqb1 port keqb1_, 0.01
keqb2_ chnget "EQ2"
keqb2 port keqb2_, 0.01
keqb3_ chnget "EQ3"
keqb3 port keqb3_, 0.01
keqb4_ chnget "EQ4"
keqb4 port keqb4_, 0.01
keqb5_ chnget "EQ5"
keqb5 port keqb5_, 0.01
keqb6_ chnget "EQ6"
keqb6 port keqb6_, 0.01
keqb7_ chnget "EQ7"
keqb7 port keqb7_, 0.01
keqb8_ chnget "EQ8"
keqb8 port keqb8_, 0.01
keqb9_ chnget "EQ9"
keqb9 port keqb9_, 0.01
keqb10_ chnget "EQ10"
keqb10 port keqb10_, 0.01
kgainOut_ chnget "OUT"
kgainOut port kgainOut_, 0.01



abL butlp gao1, kInlf
am0L buthp gao1, kInlf
amL butlp am0L, kInhf
ahL buthp gao1, kInhf
;distortion
abdistbL_ distort abL * ampdb(kinGb), kdistb, gidistfunction
abdistbL AtanLimit abdistbL_
abdistmL_ distort amL * ampdb(kinGm), kdistm, gidistfunction
abdistmL AtanLimit abdistmL_
abdisthL_ distort ahL * ampdb(kinGh), kdisth, gidistfunction
abdisthL AtanLimit abdisthL_
;drywet
abcL = abL * cos(kdwb * $M_PI_2)
abdL = abdistbL * sin(kdwb * $M_PI_2)
amcL = amL * cos(kdwm * $M_PI_2)
amdL = abdistmL * sin(kdwm * $M_PI_2)
ahcL = ahL * cos(kdwh * $M_PI_2)
ahdL = abdisthL * sin(kdwh * $M_PI_2)
;Limiting
adistotalL AtanLimit ((abcL + abdL) * ampdb(kPostGb) +
								(amcL + amdL) * ampdb(kPostGm) +
								(ahcL + ahdL) * ampdb(kPostGh)) / 
								6


;EQ
;Boss GEB 50 120 400 500 800 4.5k 10K
a1L butlp adistotalL, 25
a2L butbp adistotalL, 48.12, 32.08
a3L butbp adistotalL, 92,64, 61.76
a4L butbp adistotalL, 178.32, 118.88
a5L butbp adistotalL, 343.26, 228.84
a6L butbp adistotalL, 660.75, 440.5
a7L butbp adistotalL, 1271.91, 847.94
a8L butbp adistotalL, 2248.37, 1632.25
a9L butbp adistotalL, 4712.99, 3141.99
a10L buthp adistotalL, 9072.28
gaeqedL = (a1L * ampdb(keqb1) + 
			a2L * ampdb(keqb2) +
			a3L * ampdb(keqb3) +
			a4L * ampdb(keqb4) +
			a5L * ampdb(keqb5) +
			a6L * ampdb(keqb6) +
			a7L * ampdb(keqb7) +
			a8L * ampdb(keqb8) +
			a9L * ampdb(keqb9) +
			a10L * ampdb(keqb10)) * ampdb(kgainOut)



abR butlp gao2, kInlf
am0R buthp gao2, kInlf
amR butlp am0R, kInhf
ahR buthp gao2, kInhf
;distortion
abdistbR_ distort abR * ampdb(kinGb), kdistb, gidistfunction
abdistbR AtanLimit abdistbR_
abdistmR_ distort amR * ampdb(kinGm), kdistm, gidistfunction
abdistmR AtanLimit abdistmR_
abdisthR_ distort ahR * ampdb(kinGh), kdisth, gidistfunction
abdisthR AtanLimit abdisthR_
;drywet
abcR = abR * cos(kdwb * $M_PI_2)
abdR = abdistbR * sin(kdwb * $M_PI_2)
amcR = amR * cos(kdwm * $M_PI_2)
amdR = abdistmR * sin(kdwm * $M_PI_2)
ahcR = ahR * cos(kdwh * $M_PI_2)
ahdR = abdisthR * sin(kdwh * $M_PI_2)
;Limiting
adistotalR AtanLimit ((abcR + abdR) * ampdb(kPostGb) +
								(amcR + amdR) * ampdb(kPostGm) +
								(ahcR + ahdR) * ampdb(kPostGh)) / 
								6
;EQ
;Boss GEB 50 120 400 500 800 4.5k 10K
a1R butlp adistotalR, 25
a2R butbp adistotalR, 48.12, 32.08
a3R butbp adistotalR, 92,64, 61.76
a4R butbp adistotalR, 178.32, 118.88
a5R butbp adistotalR, 343.26, 228.84
a6R butbp adistotalR, 660.75, 440.5
a7R butbp adistotalR, 1271.91, 847.94
a8R butbp adistotalR, 2248.37, 1632.25
a9R butbp adistotalR, 4712.99, 3141.99
a10R buthp adistotalR, 9072.28
gaeqedR = (a1R * ampdb(keqb1) + 
			a2R * ampdb(keqb2) +
			a3R * ampdb(keqb3) +
			a4R * ampdb(keqb4) +
			a5R * ampdb(keqb5) +
			a6R * ampdb(keqb6) +
			a7R * ampdb(keqb7) +
			a8R * ampdb(keqb8) +
			a9R * ampdb(keqb9) +
			a10R * ampdb(keqb10)) * ampdb(kgainOut)

endin





instr 100

kout_mode chnget "out_mode"

aoutLo init 0
aoutRo init 0

if kout_mode == 1 then
	aoutLo = (gaeqedL + gaeqedR) * 0.5
	aoutRo = 0
else
	aoutLo = gaeqedL
	aoutRo = gaeqedR
endif



kupdtrig metro 3
kmaxL max_k aoutLo, 1, 1
kmaxR max_k aoutRo, 1, 1
if kupdtrig == 1 then
    kmax max kmaxL, kmaxR
    kdb = dbamp(kmax)
    if kdb <= -24 then
        kp0 = 0
        kp1 = 0
        kp2 = 0
        kp3 = 0
        kp4 = 0
        kp5 = 0
    elseif kdb < -12 then
        kp0 = 0
        kp1 = 0
        kp2 = 0
        kp3 = 0
        kp4 = 0
        kp5 = 1
    elseif kdb < -6 then
        kp0 = 0
        kp1 = 0
        kp2 = 0
        kp3 = 0
        kp4 = 1
        kp5 = 1
    elseif kdb < -3 then
        kp0 = 0
        kp1 = 0
        kp2 = 0
        kp3 = 1
        kp4 = 1
        kp5 = 1
    elseif kdb < 0 then
        kp0 = 0
        kp1 = 0
        kp2 = 1
        kp3 = 1
        kp4 = 1
        kp5 = 1
    elseif kdb < 1 then
        kp0 = 0
        kp1 = 1
        kp2 = 1
        kp3 = 1
        kp4 = 1
        kp5 = 1
    elseif kdb >= 1 then
        kp0 = 1
        kp1 = 1
        kp2 = 1
        kp3 = 1
        kp4 = 1
        kp5 = 1
    endif
    ;update gui
    chnset	kp0,"Peak0"
    chnset	kp1,"Peak1"
    chnset	kp2,"Peak2"
    chnset	kp3,"Peak3"
    chnset	kp4,"Peak4"
    chnset	kp5,"Peak5"
endif


outs aoutLo, aoutRo
endin




</CsInstruments>  
<CsScore>
f0 z
i 1 0 -1
i 10 0 -1
i 100 0 -1
e
</CsScore>
</CsoundSynthesizer>