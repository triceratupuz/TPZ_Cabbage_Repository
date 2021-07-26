;Rotative Delay
;developed by Triceratupuz Lab
;http://triceratupuz.altervista.org/
;REV 20210713

<Cabbage>
form size(670, 100) caption("Rotative Delay") guiMode("queue") pluginId("rdtp") colour(130,130,130)
rslider bounds(5, 5, 60, 60) channel("ingain") range(-150, 18, 0, 6.2, .01) text("In Gain")  outlineColour(0, 0, 0, 50) textBox(1) textColour("black") colour(130, 130, 130)
rslider bounds(65, 5, 60, 60) channel("d_time") text("Time") range(0, 5, 1, 1, 0.001) textBox(1) textColour("black") colour(130,130,130)
combobox bounds(125, 5, 60, 20) items("time", "BpM", "Host") channel("bpmHost") value(1)
label bounds(125, 25, 60, 15) text("BpM") align("centre") fontColour("black")
nslider bounds(125, 40, 60, 20) range(0, 550, 60, 1, 0.001) channel("bpm")

rslider channel("d_feed") bounds(185, 5, 60, 60) text("Feedback") range(0.0000, 1.3000, 0.0000) textBox(1) textColour("black") colour(130,130,130)
rslider channel("d_lf") bounds(245, 5, 60, 60) text("Low Freq") range(0, 22000, 0, 0.5, 1) textBox(1) textColour("black") colour(130,130,130)
rslider channel("d_hf") bounds(305, 5, 60, 60) text("High Freq") range(0, 22000, 22000, 0.5, 1) textBox(1) textColour("black") colour(130,130,130)
rslider channel("d_rotsp") bounds(365, 5, 60, 60) text("Rotor Speed") range(0, 4, 0.1, 1, 0.01) textBox(1) textColour("black") colour(130,130,130)

button bounds(425, 5, 60, 30) text("CW", "CCW") channel("d_rot_dir") value(0) colour("green")
button bounds(425, 40, 60, 30) text("<-", "LTT") channel("d_rot_ltt") value(0) colour("green")
rslider channel("d_elev") bounds(485, 5, 60, 60) text("Elevation") range(-40, 90, 0, 0.6, .01) textBox(1) textColour("black") colour(130,130,130)
rslider channel("d_dlyv") bounds(545, 5, 60, 60) text("Delay V") range(-150, 18, 0, 6.2, .01) textBox(1) textColour("black") colour(130,130,130)
rslider channel("d_dirv") bounds(605, 5, 60, 60) text("Direct V") range(-150, 18, 0, 6.2, .01) textBox(1) textColour("black") colour(130,130,130)

;Input
label bounds(5, 75, 60, 15) text("Input") fontColour("black") align("centre")
combobox bounds(65, 75, 60, 20), channel("in_mode"), value(3), items("left only", "right only", "stereo", "test")
;preset
filebutton bounds(425, 75, 60, 20), channel("butsave"), text("Save"), populate("*.snaps") mode("preset")
combobox bounds(486, 75, 180, 20), channel("combobox"), populate("*.snaps")


</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d
</CsOptions>
<CsInstruments>
ksmps = 64
nchnls = 2
0dbfs=1


gktestactive init 0

;chn_k "d_rotsp", 3

gkbpm init 60

instr 1
kin_mode chnget "in_mode"
a1, a2 ins
;outs a1, a2
kin_modec changed kin_mode
if kin_mode == 1 then; leftonly
	gktestactive = 0
	gao1 = a1
	gao2 = a1
elseif kin_mode == 2 then; rightonly
	gktestactive = 0
	gao1 = a2
	gao2 = a2
elseif kin_mode == 3 then; stereo
	gktestactive = 0
	gao1 = a1
	gao2 = a2 
else;test
	gktestactive = 1
	gao1 = 0
	gao2 = 0
	if kin_modec == 1 then
		event "i", 2, 0, 1
	endif
endif


kBPM chnget "HOST_BPM"
kbpmMode chnget "bpmHost"
ktrigBpm changed kbpmMode
if kbpmMode == 1 then
	gkbpm = 60
	cabbageSet ktrigBpm, "bpm", " colour(\"black\")"
elseif kbpmMode == 2 then
	gkbpm chnget "bpm"
	cabbageSet ktrigBpm, "bpm", " colour(\"green\")"
else
	gkbpm = kBPM
	cabbageSetValue "bpm", kBPM
	cabbageSet ktrigBpm, "bpm", " colour(\"red\")"
endif

endin





instr 2
if i(gktestactive) == 0 then
	turnoff
else
	kenv linseg 0, 0.05, 1, p3- 0.1, 0
	inextp3 unirand 1
	inextp3 = 0.5 + inextp3
	event_i "i", 2, p3, inextp3
	ifrrr unirand 440
	aoscil vco2 0.5 * kenv, ifrrr, 12
	gao1 = aoscil
	gao2 = aoscil
endif
endin





instr 10

kingain_ chnget "ingain"
kingain port kingain_, 0.07

adlyin = (gao1 + gao2) * ampdbfs(kingain)

kdTime_ chnget "d_time"
kdTime port kdTime_ * 60 / gkbpm, 0.07

kdFeed_ chnget "d_feed"
kdFeed port kdFeed_, 0.01

kdlf_ chnget "d_lf"
kdlf port kdlf_, 0.05

kdhf_ chnget "d_hf"
kdhf port kdhf_, 0.05

krotsp_ chnget "d_rotsp"
krotspltt_ chnget "d_rot_ltt"
if krotsp_ < 0.01 then
	krotsp_ = 0.01
	chnset krotsp_, "d_rotsp"
endif
if krotsp_ > 120.0 then
	krotsp_ = 120.0
	chnset krotsp_, "d_rotsp"
endif
if krotspltt_ == 1 then
	krotsp_ = krotsp_ * 1 / kdTime
endif
krotsp port krotsp_, 0.01


kd_rot_dir chnget "d_rot_dir"

kelev_ chnget "d_elev"
kelev port kelev_, 0.01

kdlyv_ chnget "d_dlyv"
kdlyv port ampdbfs(kdlyv_), 0.01

kdirv_ chnget "d_dirv"
kdirv port ampdbfs(kdirv_), 0.01

adTime interp kdTime

adump delayr 15
atap deltapi adTime
ataph buthp atap, kdlf
atapf butlp ataph, kdhf
delayw adlyin + atapf * kdFeed 

kangle phasor krotsp

if kd_rot_dir == 1 then
	kangle = 1 - kangle
endif


ShrtfL sprintf "hrtf-%d-left.dat", sr
ShrtfR sprintf "hrtf-%d-right.dat", sr


alR, arR hrtfmove2 atapf, kangle * 360, kelev, ShrtfL, ShrtfR

aL = alR * kdlyv + gao1 * kdirv
aR = arR * kdlyv + gao2 * kdirv
outs aL, aR

endin

</CsInstruments>  
<CsScore>
f0 z
i 1 0 -1
i 10 0 -1
e
</CsScore>
</CsoundSynthesizer>