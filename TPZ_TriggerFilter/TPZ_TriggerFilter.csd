;Trigger Filter
;developed by Triceratupuz Lab
;http://triceratupuz.altervista.org/
;REV 20210714

<Cabbage>
form caption("TriggerFilter") size(850, 200), guiMode("queue") pluginId("tztf") colour(150, 200, 150)

label bounds(5, 5, 60, 12) text("in Gain") fontColour("black")
label bounds(65, 5, 60, 12) text("Threshold") fontColour("black")
label bounds(125, 5, 60, 12) text("Hp F") fontColour("black")
label bounds(185, 5, 60, 12) text("Lp F") fontColour("black")
label bounds(245, 5, 60, 12) text("Reso") fontColour("black")
label bounds(305, 5, 60, 12) text("Overlap") fontColour("black")
label bounds(365, 5, 60, 12) text("A") fontColour("black")
label bounds(425, 5, 60, 12) text("D") fontColour("black")
label bounds(485, 5, 60, 12) text("S") fontColour("black")
label bounds(545, 5, 60, 12) text("Duration") fontColour("black")
label bounds(605, 5, 60, 12) text("R") fontColour("black")
label bounds(665, 5, 60, 12) text("Out Gain") fontColour("black")


rslider bounds(5, 25, 60, 50), channel("ing1"), range(-160, 64, -18, 2.1, .01) trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")
vmeter bounds(60, 25, 10, 48) channel("vuin1") value(0) outlineColour(0, 0, 0), overlayColour(0, 0, 0) meterColour:0(255, 0, 0) meterColour:1(255, 255, 0) meterColour:2(0, 255, 0) outlineThickness(1) 
rslider bounds(65, 25, 60, 50), channel("thr1"), range(-160, 0, 0, 1, .01) trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")
rslider bounds(125, 25, 60, 50), channel("hpf1"), range(25, 20000, 50, 0.5, .01) trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")
rslider bounds(185, 25, 60, 50), channel("lpf1"), range(25, 20000, 10000, 0.5, .01) trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")
rslider bounds(245, 25, 60, 50), channel("res1"), range(0, 1.5, 0, 1, 0.01) trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")
rslider bounds(305, 25, 60, 50), channel("over1"), range(0, 1, 1, 1, 0.1) trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")
rslider bounds(365, 25, 60, 50), channel("A1"), range(0.001, 2, 0.001, 1, 0.001) trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")
rslider bounds(425, 25, 60, 50), channel("D1"), range(0.001, 2, 0.001, 1, 0.001) trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")
rslider bounds(485, 25, 60, 50), channel("S1"), range(0, 1, 0.9, 1, .01) trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")
rslider bounds(545, 25, 60, 50), channel("Dur1"), range(0.1, 5, 0.1, 1, 0.01) trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")
rslider bounds(605, 25, 60, 50), channel("R1"), range(0.001, 2, 0.001, 1, 0.001) trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")
rslider bounds(665, 25, 60, 50), channel("oug1"), range(-160, 18, 0, 6.2, .01) trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")
vmeter bounds(725, 25, 10, 48) channel("vuL1") value(0) outlineColour(0, 0, 0), overlayColour(0, 0, 0) meterColour:0(255, 0, 0) meterColour:1(255, 255, 0) meterColour:2(0, 255, 0) outlineThickness(1) 
vmeter bounds(736, 25, 10, 48) channel("vuR1") value(0) outlineColour(0, 0, 0), overlayColour(0, 0, 0) meterColour:0(255, 0, 0) meterColour:1(255, 255, 0) meterColour:2(0, 255, 0) outlineThickness(1) 


rslider bounds(5, 75, 60, 50), channel("ing2"), range(-160, 64, -18, 2.1, .01) trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")
vmeter bounds(60, 75, 10, 48) channel("vuin2") value(0) outlineColour(0, 0, 0), overlayColour(0, 0, 0) meterColour:0(255, 0, 0) meterColour:1(255, 255, 0) meterColour:2(0, 255, 0) outlineThickness(1) 
rslider bounds(65, 75, 60, 50), channel("thr2"), range(-160, 0, 0, 1, .01) trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")
rslider bounds(125, 75, 60, 50), channel("hpf2"), range(25, 20000, 50, 0.5, .01) trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")
rslider bounds(185, 75, 60, 50), channel("lpf2"), range(25, 20000, 10000, 0.5, .01) trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")
rslider bounds(245, 75, 60, 50), channel("res2"), range(0, 1.5, 0, 1, 0.01) trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")
rslider bounds(305, 75, 60, 50), channel("over2"), range(0, 1, 1, 1, 0.1) trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")
rslider bounds(365, 75, 60, 50), channel("A2"), range(0.001, 2, 0.001, 1, 0.001) trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")
rslider bounds(425, 75, 60, 50), channel("D2"), range(0.001, 2, 0.001, 1, 0.001) trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")
rslider bounds(485, 75, 60, 50), channel("S2"), range(0, 1, 0.9, 1, .01) trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")
rslider bounds(545, 75, 60, 50), channel("Dur2"), range(0.1, 5, 0.1, 1, 0.01) trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")
rslider bounds(605, 75, 60, 50), channel("R2"), range(0.001, 2, 0.001, 1, 0.001) trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")
rslider bounds(665, 75, 60, 50), channel("oug2"), range(-160, 18, 0, 6.2, .01) trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")
vmeter bounds(725, 75, 10, 48) channel("vuL2") value(0) outlineColour(0, 0, 0), overlayColour(0, 0, 0) meterColour:0(255, 0, 0) meterColour:1(255, 255, 0) meterColour:2(0, 255, 0) outlineThickness(1) 
vmeter bounds(736, 75, 10, 48) channel("vuR2") value(0) outlineColour(0, 0, 0), overlayColour(0, 0, 0) meterColour:0(255, 0, 0) meterColour:1(255, 255, 0) meterColour:2(0, 255, 0) outlineThickness(1) 


rslider bounds(5, 125, 60, 50), channel("ing3"), range(-160, 64, -18, 2.1, .01) trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")
vmeter bounds(60, 125, 10, 48) channel("vuin3") value(0) outlineColour(0, 0, 0), overlayColour(0, 0, 0) meterColour:0(255, 0, 0) meterColour:1(255, 255, 0) meterColour:2(0, 255, 0) outlineThickness(1) 
rslider bounds(65, 125, 60, 50), channel("thr3"), range(-160, 0, 0, 1, .01) trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")
rslider bounds(125, 125, 60, 50), channel("hpf3"), range(25, 20000, 50, 0.5, .01) trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")
rslider bounds(185, 125, 60, 50), channel("lpf3"), range(25, 20000, 10000, 0.5, .01) trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")
rslider bounds(245, 125, 60, 50), channel("res3"), range(0, 1.5, 0, 1, 0.01) trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")
rslider bounds(305, 125, 60, 50), channel("over3"), range(0, 1, 1, 1, 0.1) trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")
rslider bounds(365, 125, 60, 50), channel("A3"), range(0.001, 2, 0.001, 1, 0.001) trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")
rslider bounds(425, 125, 60, 50), channel("D3"), range(0.001, 2, 0.001, 1, 0.001) trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")
rslider bounds(485, 125, 60, 50), channel("S3"), range(0, 1, 0.9, 1, .01) trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")
rslider bounds(545, 125, 60, 50), channel("Dur3"), range(0.1, 5, 0.1, 1, 0.01) trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")
rslider bounds(605, 125, 60, 50), channel("R3"), range(0.001, 2, 0.001, 1, 0.001) trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")
rslider bounds(665, 125, 60, 50), channel("oug3"), range(-160, 18, 0, 6.2, .01) trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")
vmeter bounds(725, 125, 10, 48) channel("vuL3") value(0) outlineColour(0, 0, 0), overlayColour(0, 0, 0) meterColour:0(255, 0, 0) meterColour:1(255, 255, 0) meterColour:2(0, 255, 0) outlineThickness(1) 
vmeter bounds(736, 125, 10, 48) channel("vuR3") value(0) outlineColour(0, 0, 0), overlayColour(0, 0, 0) meterColour:0(255, 0, 0) meterColour:1(255, 255, 0) meterColour:2(0, 255, 0) outlineThickness(1) 




rslider bounds(750, 95, 70, 70), channel("direct"), range(-160, 18, -160, 6.2, .01) trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black") text("Direct")
rslider bounds(750, 25, 70, 70), channel("effect"), range(-160, 18, 0, 6.2, .01) trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black") text("Effect")
vmeter bounds(820, 25, 10, 150) channel("vuLM") value(0) outlineColour(0, 0, 0), overlayColour(0, 0, 0) meterColour:0(255, 0, 0) meterColour:1(255, 255, 0) meterColour:2(0, 255, 0) outlineThickness(1) 
vmeter bounds(831, 25, 10, 150) channel("vuRM") value(0) outlineColour(0, 0, 0), overlayColour(0, 0, 0) meterColour:0(255, 0, 0) meterColour:1(255, 255, 0) meterColour:2(0, 255, 0) outlineThickness(1) 

filebutton bounds(605, 177, 58, 20), channel("butsave"), text("Save"), populate("*.snaps") mode("preset")
combobox bounds(665, 177, 180, 20), channel("combobox"), populate("*.snaps")


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



gklastact[] init 3
gachannels[] init 6
gachannelsO[] init 6


#define INFILTER(NUM'CH)#
k_hpf$NUM cabbageGetValue "hpf$NUM"
khpf$NUM port k_hpf$NUM, 0.02
k_lpf$NUM cabbageGetValue "lpf$NUM"
klpf$NUM port k_lpf$NUM, 0.02
k_res$NUM cabbageGetValue "res$NUM"
kres$NUM port k_res$NUM, 0.02
k_ing$NUM cabbageGetValue "ing$NUM"
king$NUM port ampdbfs(k_ing$NUM), 0.02

aL$NUM buthp ainL, khpf$NUM
aR$NUM buthp ainR, khpf$NUM

alpL$NUM lowpass2 aL$NUM, klpf$NUM, kres$NUM
alpR$NUM lowpass2 aR$NUM, klpf$NUM, kres$NUM

gachannels[$CH] = alpL$NUM * king$NUM
gachannels[$CH+1] = alpR$NUM * king$NUM

kresL$NUM rms gachannels[$CH]
kresR$NUM rms gachannels[$CH + 1]
 
kthr$NUM cabbageGetValue "thr$NUM"
kdur$NUM cabbageGetValue "Dur$NUM"
kA$NUM cabbageGetValue "A$NUM"
kD$NUM cabbageGetValue "D$NUM"
kS$NUM cabbageGetValue "S$NUM"
kR$NUM cabbageGetValue "R$NUM"
kO$NUM cabbageGetValue "oug$NUM"

;printk 0.5, kresL$NUM + kresR$NUM
kmode init 0
ktri$NUM trigger kresL$NUM + kresR$NUM, ampdbfs(kthr$NUM), kmode


kover$NUM cabbageGetValue "over$NUM"
kready$NUM init 0
kaddress$NUM init $NUM - 1
if (ktime - gklastact[kaddress$NUM]) >= ((kA$NUM + kD$NUM + kdur$NUM + kR$NUM) * kover$NUM) then  
    kready$NUM = 1
else
    kready$NUM = 0
endif

if ktri$NUM == 1 && kready$NUM == 1 then
    event "i", 10 + (ktriggeredN + 1) * 0.01, 0, kA$NUM + kD$NUM + kdur$NUM,$CH, kA$NUM, kD$NUM, kS$NUM, kR$NUM, ampdbfs(kO$NUM)
    ktriggeredN = (ktriggeredN + 1) % 97
    gklastact[kaddress$NUM] = ktime
endif  

;printk2 gklastact[kaddress$NUM]

#


instr 1

ainL inch 1
ainR inch 2

ktriggeredN init 0

;timer for overlap
ktime times
gklastact[0] init 0
gklastact[1] init 0
gklastact[2] init 0


$INFILTER(1'0)
$INFILTER(2'2)
$INFILTER(3'4)

endin


instr 10;envelope
aL = gachannels[p4]
aR = gachannels[p4 + 1]

kenv linsegr 0, p5, 1, p6, p7, p8, 0

gachannelsO[p4] = gachannelsO[p4] + gachannels[p4] * kenv * p9
gachannelsO[p4 + 1] = gachannelsO[p4 + 1] + gachannels[p4 + 1] * kenv * p9
endin



instr 20;output
k_direct cabbageGetValue "direct"
kdirect port k_direct, 0.02
k_effect cabbageGetValue "effect"
keffect port k_effect, 0.02


ainL inch 1
ainR inch 2

aoutL = ainL * ampdbfs(kdirect) + (gachannelsO[0] + gachannelsO[2] + gachannelsO[4]) * ampdbfs(keffect)
aoutR = ainR * ampdbfs(kdirect) + (gachannelsO[1] + gachannelsO[3] + gachannelsO[5]) * ampdbfs(keffect)

kvuin1 rms gachannels[0] + gachannels[1]
cabbageSetValue "vuin1", portk(kvuin1 * 10, .25), metro(5)

kvuin2 rms gachannels[2] + gachannels[3]
cabbageSetValue "vuin2", portk(kvuin2 * 10, .25), metro(5)

kvuin3 rms gachannels[4] + gachannels[5]
cabbageSetValue "vuin3", portk(kvuin3 * 10, .25), metro(5)


kvu1L rms gachannelsO[0]
kvu1R rms gachannelsO[1]
cabbageSetValue "vuL1", portk(kvu1L * 10, .25), metro(5)
cabbageSetValue "vuR1", portk(kvu1R * 10, .25), metro(5)

kvu2L rms gachannelsO[2]
kvu2R rms gachannelsO[3]
cabbageSetValue "vuL2", portk(kvu2L * 10, .25), metro(5)
cabbageSetValue "vuR2", portk(kvu2R * 10, .25), metro(5)

kvu3L rms gachannelsO[4]
kvu3R rms gachannelsO[5]
cabbageSetValue "vuL3", portk(kvu3L * 10, .25), metro(5)
cabbageSetValue "vuR3", portk(kvu3R * 10, .25), metro(5)

kmaL rms aoutL
kmaR rms aoutR
cabbageSetValue "vuLM", portk(kmaL*10, .25), metro(5)
cabbageSetValue "vuRM", portk(kmaR*10, .25), metro(5)






outs aoutL, aoutR

gachannels[0] = 0
gachannels[1] = 0
gachannels[2] = 0
gachannels[3] = 0
gachannels[4] = 0
gachannels[5] = 0

gachannelsO[0] = 0
gachannelsO[1] = 0
gachannelsO[2] = 0
gachannelsO[3] = 0
gachannelsO[4] = 0
gachannelsO[5] = 0
endin



</CsInstruments>
<CsScore>
f0 z
i1 0 -1
i20 0 -1


</CsScore>
</CsoundSynthesizer>
