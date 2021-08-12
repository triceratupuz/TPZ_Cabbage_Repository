;Beller
;developed by Triceratupuz Lab
;http://triceratupuz.altervista.org/
;REV 20210527

<Cabbage>
form caption("Beller") size(245, 225), colour(160, 210, 160), pluginId("tpbl")
rslider bounds(5, 5, 60, 60), text("Attack"), range(0, 0.1, 0.02, 1, 0.001), channel("att"), trackerColour(0, 200, 0), textColour("black")
rslider bounds(65, 5, 60, 60), text("Decay"), range(0, 1, 0.9, 1, 0.001), channel("dec"), trackerColour(0, 200, 0), textColour("black")
rslider bounds(125, 5, 60, 60), text("AmpDur"), range(0, 4, 2, 1, 0.001), channel("maxT"), trackerColour(0, 200, 0), textColour("black")
rslider bounds(185, 5, 60, 60), text("minTime"), range(0, 1, 0.7, 1, 0.001), channel("minT"), trackerColour(0, 200, 0), textColour("black")
rslider bounds(5, 65, 60, 60), text("inharmoA"), range(0, 1, 0.1, 1, 0.001), channel("inhA"), trackerColour(0, 200, 0), textColour("black")
rslider bounds(65, 65, 60, 60), text("inharmoD"), range(0, 1, 0.001, 1, 0.001), channel("inhD"), trackerColour(0, 200, 0), textColour("black")
rslider bounds(125, 65, 60, 60), text("pan"), range(0, 1, 0.5, 1, 0.001), channel("pan"), trackerColour(0, 200, 0), textColour("black")
rslider bounds(185, 65, 60, 60), text("volume"), range(0, 2, 1, 1, 0.001), channel("vol"), trackerColour(0, 200, 0), textColour("black")

keyboard bounds(5, 130, 235, 65)
combobox bounds(5, 200, 175, 20), populate("*.snaps")
filebutton bounds(185, 200, 55, 20), text("Save"), mode("preset")

</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d -+rtmidi=NULL -M0 -m0d --midi-key-cps=4 --midi-velocity-amp=5
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
ksmps = 32
nchnls = 2
0dbfs = 1



instr 1
kstatus, kchan, kdata1, kdata2 midiin

kpan chnget "pan"
kmint chnget "minT"
kmaxt chnget "maxT"
kinhA chnget "inhA"
kinhD chnget "inhD"
katt chnget "att"
kdec chnget "dec"

if kstatus == 144 then
    event "i", 10 + 0.0001 * kdata1, 0, - 1, kdata2/127, kdata1, kpan, kmint, kmaxt * kmaxt, kinhA, kinhD, katt, kdec
elseif kstatus == 128 then
     event "i", -10 - 0.0001 * kdata1, 0, - 1, kdata2/127, kdata1
endif


gabellL = 0
gabellR = 0

endin




instr 10;bell
aosc0 oscil p4, cpsmidinn(p5), 1
kpit1 linseg semitone(p9), p11 * 2, 1 / semitone(p10)
aosc1 oscil p4, cpsmidinn(p5) * kpit1, 1
kpit2 linseg 1 - p9, p11 * 2.5, 1 + p10
aosc2 oscil 1 / semitone(p9), cpsmidinn(p5) * kpit2, semitone(p10)


kenvA expseg 0.001, p11, 1, p11, p12, p8 * p4 + p7, 0.001
kenvR linsegr 1, 0.03, 0

abell = (aosc0 + aosc1 + aosc2) * (kenvA - 0.001) * kenvR * 0.3

abellL, abellR pan2 abell, p6
gabellL = gabellL + abellL
gabellR = gabellR + abellR
endin




instr 100;out
kvol_ chnget "vol"
kvol port kvol_, 0.05
outs gabellL * kvol, gabellR * kvol
endin


</CsInstruments>
<CsScore>
f0 z

f 1 0 [1024 * 16] 10 1 

i 1 0 -1
i 100 0 -1
</CsScore>
</CsoundSynthesizer>
