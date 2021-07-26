;RmSynth
;developed by Triceratupuz Lab
;http://triceratupuz.altervista.org/
;REV 20210615

<Cabbage>
form caption("RmSynth") size(375, 225), colour(190, 215, 190), pluginId("tprs")
rslider bounds(5, 5, 60, 60), text("Attack"), range(0, 0.9, 0.1, 1, 0.001), channel("att"), trackerColour(200, 200, 200), textColour("black")
rslider bounds(65, 5, 60, 60), text("Decay"), range(0, 1, 0.9, 1, 0.001), channel("dec"), trackerColour(200, 200, 200), textColour("black")
rslider bounds(125, 5, 60, 60), text("Sustain"), range(0, 1, 0.8, 1, 0.001), channel("sus"), trackerColour(200, 200, 200), textColour("black")
rslider bounds(185, 5, 60, 60), text("Release"), range(0, 1, 0.1, 1, 0.001), channel("rel"), trackerColour(200, 200, 200), textColour("black")
rslider bounds(245, 5, 60, 60), text("pan"), range(0, 1, 0.5, 1, 0.001), channel("pan"), trackerColour(200, 200, 200), textColour("black")
rslider bounds(305, 5, 60, 60), text("volume"), range(0, 16, 1, 0.25, 0.001), channel("vol"), trackerColour(200, 200, 200), textColour("black")



rslider bounds(5, 65, 60, 60), text("wav A"), range(1, 5, 1, 1, 1), channel("wavA"), trackerColour(200, 200, 200), textColour("black")
rslider bounds(65, 65, 60, 60), text("wav B"), range(1, 5, 1, 1, 1), channel("wavB"), trackerColour(200, 200, 200), textColour("black")
rslider bounds(125, 65, 60, 60), text("Bratio Beg"), range(0, 10, 1, 0.3, 0.001), channel("fratioB"), trackerColour(200, 200, 200), textColour("black")
rslider bounds(185, 65, 60, 60), text("Bratio End"), range(0, 10, 1, 0.3, 0.001), channel("fratioE"), trackerColour(200, 200, 200), textColour("black")
rslider bounds(245, 65, 60, 60), text("Bratio Dur"), range(0, 10, 1, 1, 0.001), channel("fratioD"), trackerColour(200, 200, 200), textColour("black")


keyboard bounds(5, 130, 365, 65)
combobox bounds(5, 200, 305, 20), populate("*.snaps")
filebutton bounds(315, 200, 55, 20), text("Save"), mode("preset")

</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d -+rtmidi=NULL -M0 -m0d
; --midi-key-cps=4 --midi-velocity-amp=5
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
ksmps = 32
nchnls = 2
0dbfs = 1



instr 1
kstatus, kchan, kdata1, kdata2 midiin
katt chnget "att"
kdec chnget "dec"
ksus chnget "sus"
krel chnget "rel"
ksus init 0.8

kpan chnget "pan"
kmint chnget "minT"
kmaxt chnget "maxT"


kwavA chnget "wavA"
kwavB chnget "wavB"
kfratioB chnget "fratioB"
kfratioE chnget "fratioE"
kfratioD chnget "fratioD"

if kstatus == 144 then
    event "i", 10 + 0.0001 * kdata1, 0, - 1, kdata2/127, kdata1, kpan, kwavA, kwavB, kfratioB, kfratioE, kfratioD, katt, kdec, ksus, krel
elseif kstatus == 128 then
     event "i", -10 - 0.0001 * kdata1, 0, - 1, kdata2/127, kdata1
endif


gaoutL = 0
gaoutR = 0

endin




instr 10;rmSy

kenvA linsegr 0.001, p12, p4 + 0.001, p13, p14 * p4 + 0.001, p15 + 0.02, 0.001

kenvrat linseg p9, p11, p10
if p7 == 5 then
    aosc0 noise kenvA - 0.001, 0.1
    aosc0 butlp aosc0, cpsmidinn(p5)
    aosc0 buthp aosc0, cpsmidinn(p5)
else
    aosc0 oscil kenvA - 0.001, cpsmidinn(p5), p7
endif
if p8 == 5 then
    aosc1 noise kenvA - 0.001, 0.1
    aosc1 butlp aosc1, cpsmidinn(p5) * kenvrat
    aosc1 buthp aosc1, cpsmidinn(p5) * kenvrat
else
    aosc1 oscil kenvA - 0.001, cpsmidinn(p5) * kenvrat, p8
endif


asig = aosc0 * aosc1 * kenvA

asigL, asigR pan2 asig, p6

gaoutL = gaoutL + asigL
gaoutR = gaoutR + asigR
endin




instr 100;out
kvol_ chnget "vol"
kvol port kvol_, 0.05
outs gaoutL * kvol, gaoutR * kvol
endin


</CsInstruments>
<CsScore>
f0 z

f 1 0 [1024 * 8] 10 1;sine
f 2 0 [1024 * 8] 10 1 0 -0.11 0 0.04 0 -0.0204;triangle
f 3 0 [1024 * 8] 10 1 0 0.3 0 0.2 0 0.16;square
f 4 0 [1024 * 8] 10 1 0.5 0.3 0.25 0.2;saw

i 1 0 -1
i 100 0 -1
</CsScore>
</CsoundSynthesizer>
