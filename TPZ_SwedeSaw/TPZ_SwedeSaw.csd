;Swedesaw
;try to imitate Boss HM2 distortion pedal
;developed by Triceratupuz Lab
;http://triceratupuz.altervista.org/
;REV 20210727

<Cabbage>
form caption("SwedeSaw") size(250, 120), colour(0, 0, 0), pluginId("tpss")
rslider bounds(5, 10, 60, 60), channel("gain"), range(0, 1, 0, 1, .01), text("Gain"), trackerColour("orange"), outlineColour(0, 0, 0, 50), textColour("orange")
rslider bounds(65, 10, 60, 60), channel("bass"), range(0, 1, 0, 1, .01), text("Bass"), trackerColour("orange"), outlineColour(0, 0, 0, 50), textColour("orange")
rslider bounds(125, 10, 60, 60), channel("high"), range(0, 1, 0, 1, .01), text("High"), trackerColour("orange"), outlineColour(0, 0, 0, 50), textColour("orange")
rslider bounds(185, 10, 60, 60), channel("volume"), range(0, 4, 1, 0.5, .01), text("Volume"), trackerColour("orange"), outlineColour(0, 0, 0, 50), textColour("orange")
;preset
filebutton bounds(0, 80, 250, 20), channel("butsave"), text("Save"), mode("snapshot"), colour:0("orange"), colour:1("orange")
combobox bounds(0, 100, 250, 20), channel("combobox"), populate("*.snaps")



</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d -+rtmidi=NULL -M0 -m0d 
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
ksmps = 32
nchnls = 2
0dbfs = 1



opcode AtanLimit, a, a
ain xin
aout = 2 * taninv(ain) / 3.1415927
xout aout
endop



opcode TransferFun, a, ai
ain, ifn xin
ifnlhalf = int(ftlen(ifn) * 0.5)
aout table3 ifnlhalf + ain * ifnlhalf, ifn
xout aout
endop



instr 1
kGain chnget "gain"

ga1 inch 1
ga2 inch 2

endin


instr 10
kpar1_ chnget "gain"
kpar1 port kpar1_, 0.01
kpar2_ chnget "bass"
kpar2 port kpar2_, 0.01
kpar3_ chnget "high"
kpar3 port kpar3_, 0.01
kpar4_ chnget "volume"
kpar4 port kpar4_, 0.01

kb_amp = ampdbfs( -20 + 40 * kpar2)
kmh_amp = ampdbfs(  -20 + 40 * kpar3)

iftlen = 1024 * 4
ivc ftgentmp 0, 123, iftlen, 7, -1, iftlen * 0.5, 0, iftlen * 0.5, 1
inegslope = iftlen * 0.5 * 0.2
iposslope = iftlen * 0.5 * 0.1
ivd ftgentmp 0, 123, iftlen, 7, -0.5, iftlen * 0.5 - inegslope, -0.4, inegslope, 0, iposslope, 0.8, 512 - iposslope, 1
iftfn ftgentmp 0, 123, 2, -2, ivc, ivd
ire ftgentmp 0, 123, iftlen, 10, 1
ftmorf kpar1, iftfn, ire
iinamp = 10

aampedL AtanLimit ga1 * (1 + iinamp * kpar1)
aampedR AtanLimit ga2 * (1 + iinamp * kpar1)


adistL TransferFun aampedL, ire
adistR TransferFun aampedR, ire

aeqinL butlp adistL, 4000
aeqinR butlp adistR, 4000

abassL pareq aeqinL, 87, kb_amp, 3.7
abassR pareq aeqinR, 87, kb_amp, 3.7

amidL pareq abassL, 958, kmh_amp, 3.4
amidR pareq abassR, 958, kmh_amp, 3.4

ahighL pareq amidL, 1278, kmh_amp, 3.7
ahighR pareq amidR, 1278, kmh_amp, 3.7

aoutL_ AtanLimit ahighL
aoutR_ AtanLimit ahighR

aoutL dcblock2 aoutL_
aoutR dcblock2 aoutR_

outs aoutL * kpar4, aoutR * kpar4

endin



</CsInstruments>
<CsScore>
f0 z
i1 0 -1
i10 0 -1
</CsScore>
</CsoundSynthesizer>
