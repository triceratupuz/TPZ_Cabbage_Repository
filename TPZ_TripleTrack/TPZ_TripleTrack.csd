;TripleTrack
;developed by Triceratupuz Lab
;http://triceratupuz.altervista.org/
;REV 20210917
<Cabbage>
form caption("Triple Track") size(572, 283), guiMode("queue") pluginId("tttz"), colour(120,120,120)

image bounds(5, 5, 525,78), colour(80,80,80){
label bounds(5, 5, 100, 18), text("direct"), fontColour(125, 125, 125), align("left")
label bounds(5, 25, 100, 18), text("input"), fontColour(125, 125, 125), align("left")
combobox bounds(5, 45, 100, 20), channel("input"), items("stereo", "left", "right"), value(1)
vslider bounds(105, 1, 30, 70), channel("directE_100"), range(-15, 15, 0, 1, .01), text("100")
vslider bounds(135, 1, 30, 70), channel("directE_200"), range(-15, 15, 0, 1, .01), text("200")
vslider bounds(165, 1, 30, 70), channel("directE_400"), range(-15, 15, 0, 1, .01), text("400")
vslider bounds(195, 1, 30, 70), channel("directE_800"), range(-15, 15, 0, 1, .01), text("800")
vslider bounds(225, 1, 30, 70), channel("directE_16k"), range(-15, 15, 0, 1, .01), text("1.6k")
vslider bounds(255, 1, 30, 70), channel("directE_32k"), range(-15, 15, 0, 1, .01), text("3.2k")
vslider bounds(285, 1, 30, 70), channel("directE_64k"), range(-15, 15, 0, 1, .01), text("6.4k")
hslider bounds(315, 25, 70, 20), channel("directL"), range(0, 1, 0, 1, .01), trackerColour(0,0,0,0), outlineColour(0, 0, 0, 50), colour("white"),gapMarkers(1), markerStart(0), markerEnd(1)
label bounds(315, 45, 70, 15), text("pan L"), fontColour(125, 125, 125), align("centre")
hslider bounds(385, 25, 70, 20), channel("directR"), range(0, 1, 1, 1, .01), trackerColour(0,0,0,0), outlineColour(0, 0, 0, 50), colour("white"),gapMarkers(1), markerStart(0), markerEnd(1)
label bounds(385, 45, 70, 15), text("pan R"), fontColour(125, 125, 125), align("centre")
rslider bounds(455, 5, 80, 60), channel("directG"), range(-160, 12, 0, 9.5, .01), valueTextBox(1), valuePostfix(" dB"), trackerColour("white")
}

image bounds(5, 87, 525,78), colour(100,20,20){
button bounds(5, 5, 100, 18), channel("track1"), colour:0("black"), colour:1(255, 20, 20) text("Off", "ON")
rslider bounds(5, 25, 100, 50), channel("trackD1"), range(0, 100, 0, 1, 1), , valueTextBox(1), valuePostfix(" ms")
vslider bounds(105, 1, 30, 70), channel("trackE_100_1"), range(-15, 15, 0, 1, .01), text("100")
vslider bounds(135, 1, 30, 70), channel("trackE_200_1"), range(-15, 15, 0, 1, .01), text("200")
vslider bounds(165, 1, 30, 70), channel("trackE_400_1"), range(-15, 15, 0, 1, .01), text("400")
vslider bounds(195, 1, 30, 70), channel("trackE_800_1"), range(-15, 15, 0, 1, .01), text("800")
vslider bounds(225, 1, 30, 70), channel("trackE_16k_1"), range(-15, 15, 0, 1, .01), text("1.6k")
vslider bounds(255, 1, 30, 70), channel("trackE_32k_1"), range(-15, 15, 0, 1, .01), text("3.2k")
vslider bounds(285, 1, 30, 70), channel("trackE_64k_1"), range(-15, 15, 0, 1, .01), text("6.4k")
hslider bounds(315, 25, 70, 20), channel("trackL1"), range(0, 1, 0, 1, .01), trackerColour(0,0,0,0), outlineColour(0, 0, 0, 50), colour("white"),gapMarkers(1), markerStart(0), markerEnd(1)
label bounds(315, 45, 70, 15), text("pan L"), fontColour(125, 125, 125), align("centre")
hslider bounds(385, 25, 70, 20), channel("trackR1"), range(0, 1, 1, 1, .01), trackerColour(0,0,0,0), outlineColour(0, 0, 0, 50), colour("white"),gapMarkers(1), markerStart(0), markerEnd(1)
label bounds(385, 45, 70, 15), text("pan R"), fontColour(125, 125, 125), align("centre")
rslider bounds(455, 5, 80, 60), channel("trackG1"), range(-160, 12, 0, 9.5, .01), valueTextBox(1), valuePostfix(" dB"), trackerColour("white")
}

image bounds(5, 169, 525,78), colour(100,20,20){
button bounds(5, 5, 100, 18), channel("track2"), colour:0("black"), colour:1(255, 20, 20) text("Off", "ON")
rslider bounds(5, 25, 100, 50), channel("trackD2"), range(0, 100, 0, 1, 1), , valueTextBox(1), valuePostfix(" ms")
vslider bounds(105, 1, 30, 70), channel("trackE_100_2"), range(-15, 15, 0, 1, .01), text("100")
vslider bounds(135, 1, 30, 70), channel("trackE_200_2"), range(-15, 15, 0, 1, .01), text("200")
vslider bounds(165, 1, 30, 70), channel("trackE_400_2"), range(-15, 15, 0, 1, .01), text("400")
vslider bounds(195, 1, 30, 70), channel("trackE_800_2"), range(-15, 15, 0, 1, .01), text("800")
vslider bounds(225, 1, 30, 70), channel("trackE_16k_2"), range(-15, 15, 0, 1, .01), text("1.6k")
vslider bounds(255, 1, 30, 70), channel("trackE_32k_2"), range(-15, 15, 0, 1, .01), text("3.2k")
vslider bounds(285, 1, 30, 70), channel("trackE_64k_2"), range(-15, 15, 0, 1, .01), text("6.4k")
hslider bounds(315, 25, 70, 20), channel("trackL2"), range(0, 1, 0, 1, .01), trackerColour(0,0,0,0), outlineColour(0, 0, 0, 50), colour("white"),gapMarkers(1), markerStart(0), markerEnd(1)
label bounds(315, 45, 70, 15), text("pan L"), fontColour(125, 125, 125), align("centre")
hslider bounds(385, 25, 70, 20), channel("trackR2"), range(0, 1, 1, 1, .01), trackerColour(0,0,0,0), outlineColour(0, 0, 0, 50), colour("white"),gapMarkers(1), markerStart(0), markerEnd(1)
label bounds(385, 45, 70, 15), text("pan R"), fontColour(125, 125, 125), align("centre")
rslider bounds(455, 5, 80, 60), channel("trackG2"), range(-160, 12, 0, 9.5, .01), valueTextBox(1), valuePostfix(" dB"), trackerColour("white")
}

vmeter bounds(535, 5, 15, 243) channel("vu1") value(0) outlineColour(0, 0, 0), overlayColour(0, 0, 0) meterColour:0(255, 0, 0) meterColour:1(255, 255, 0) meterColour:2(0, 255, 0) outlineThickness(1) 
vmeter bounds(552, 5, 15, 243) channel("vu2") value(0) outlineColour(0, 0, 0), overlayColour(0, 0, 0) meterColour:0(255, 0, 0) meterColour:1(255, 255, 0) meterColour:2(0, 255, 0) outlineThickness(1) 

combobox bounds(5, 252, 400, 25), populate("*.snaps")
filebutton bounds(407, 252, 161, 25), text("Save"), mode("preset"), populate("*.snaps")

</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
ksmps = 32
nchnls = 2
0dbfs = 1


giport init 0.01
gaout[] init 8

instr 1

aL inch 1
aR inch 2

;input mode
kinput cabbageGetValue "input"
printk2 kinput
if kinput = 1 then
    gaout[0] = aL
    gaout[1] = aR
elseif kinput = 2 then
    gaout[0] = aL
    gaout[1] = aL
elseif kinput = 3 then
    gaout[0] = aR
    gaout[1] = aR
endif



kpar1_ cabbageGetValue "directE_100"
kpar1 port kpar1_, giport

kpar2_ cabbageGetValue "directE_200"
kpar2 port kpar2_, giport

kpar3_ cabbageGetValue "directE_400"
kpar3 port kpar3_, giport

kpar4_ cabbageGetValue "directE_800"
kpar4 port kpar4_, giport

kpar5_ cabbageGetValue "directE_16k"
kpar5 port kpar5_, giport

kpar6_ cabbageGetValue "directE_32k"
kpar6 port kpar6_, giport

kpar7_ cabbageGetValue "directE_64k"
kpar7 port kpar7_, giport



a1L pareq gaout[0], 141.46, ampdb(kpar1), 1.413, 1
a2L pareq a1L, 200, ampdb(kpar2), 1.413, 0
a3L pareq a2L, 400, ampdb(kpar3), 1.413, 0
a4L pareq a3L, 800, ampdb(kpar4), 1.413, 0
a5L pareq a4L, 1600, ampdb(kpar5), 1.413, 0
a6L pareq a5L, 3200, ampdb(kpar6), 1.413, 0
a7L pareq a6L, 4539, ampdb(kpar7), 1.413, 2

a1R pareq gaout[1], 141.46, ampdb(kpar1), 1.413, 1
a2R pareq a1R, 200, ampdb(kpar2), 1.413, 0
a3R pareq a2R, 400, ampdb(kpar3), 1.413, 0
a4R pareq a3R, 800, ampdb(kpar4), 1.413, 0
a5R pareq a4R, 1600, ampdb(kpar5), 1.413, 0
a6R pareq a5R, 3200, ampdb(kpar6), 1.413, 0
a7R pareq a6R, 4539, ampdb(kpar7), 1.413, 2


kpanL_ cabbageGetValue "directL"
kpanL port kpanL_, giport
kpanR_ cabbageGetValue "directR"
kpanR port kpanR_, giport
kgain_ cabbageGetValue "directG"
kgain port ampdb(kgain_), giport


aLL, aLR pan2 a7L * kgain, kpanL
aRL, aRR pan2 a7R * kgain, kpanR

gaout[2] = aLL + aRL
gaout[3] = aLR + aRR


;activate other voices
kact1 cabbageGetValue "track1"
if changed(kact1) == 1 && kact1 == 1 then
    event "i", 10.1, 0, -1, 1
elseif changed(kact1) == 1 && kact1 == 0 then
    event "i", -10.1, 0, -1, 1
endif

kact2 cabbageGetValue "track2"
if changed(kact2) == 1 && kact2 == 1 then
    event "i", 10.2, 0, -1, 2
elseif changed(kact2) == 1 && kact2 == 0 then
    event "i", -10.2, 0, -1, 2
endif


endin



instr 10;voice

kdelay_ cabbageGetValue sprintf("trackD%d", p4)
kdelay port kdelay_, giport
adel = a(kdelay)

kpar1_ cabbageGetValue sprintf("trackE_100_%d", p4)
kpar1 port kpar1_, giport

kpar2_ cabbageGetValue sprintf("trackE_200_%d", p4)
kpar2 port kpar2_, giport

kpar3_ cabbageGetValue sprintf("trackE_400_%d", p4)
kpar3 port kpar3_, giport

kpar4_ cabbageGetValue sprintf("trackE_800_%d", p4)
kpar4 port kpar4_, giport

kpar5_ cabbageGetValue sprintf("trackE_16k_%d", p4)
kpar5 port kpar5_, giport

kpar6_ cabbageGetValue sprintf("trackE_32k_%d", p4)
kpar6 port kpar6_, giport

kpar7_ cabbageGetValue sprintf("trackE_64k_%d", p4)
kpar7 port kpar7_, giport


aL vdelay3 gaout[0], adel, 200
aR vdelay3 gaout[1], adel, 200

a1L pareq aL, 141.46, ampdb(kpar1), 1.413, 1
a2L pareq a1L, 200, ampdb(kpar2), 1.413, 0
a3L pareq a2L, 400, ampdb(kpar3), 1.413, 0
a4L pareq a3L, 800, ampdb(kpar4), 1.413, 0
a5L pareq a4L, 1600, ampdb(kpar5), 1.413, 0
a6L pareq a5L, 3200, ampdb(kpar6), 1.413, 0
a7L pareq a6L, 4539, ampdb(kpar7), 1.413, 2

a1R pareq aR, 141.46, ampdb(kpar1), 1.413, 1
a2R pareq a1R, 200, ampdb(kpar2), 1.413, 0
a3R pareq a2R, 400, ampdb(kpar3), 1.413, 0
a4R pareq a3R, 800, ampdb(kpar4), 1.413, 0
a5R pareq a4R, 1600, ampdb(kpar5), 1.413, 0
a6R pareq a5R, 3200, ampdb(kpar6), 1.413, 0
a7R pareq a6R, 4539, ampdb(kpar7), 1.413, 2



kpanL_ cabbageGetValue sprintf("trackL%d", p4)
kpanL port kpanL_, giport
kpanR_ cabbageGetValue sprintf("trackR%d", p4)
kpanR port kpanR_, giport
kgain_ cabbageGetValue sprintf("trackG%d", p4)
kgain port ampdb(kgain_), giport





aLL, aLR pan2 a7L * kgain, kpanL
aRL, aRR pan2 a7R * kgain, kpanR

gaout[2 + p4 * 2] = aLL + aRL
gaout[3 + p4 * 2] = aLR + aRR

endin



instr 20;Out
aL = 0
aR = 0
kindex = 0
while kindex < 8 do
    aL += gaout[kindex]
    aR += gaout[kindex + 1]
    gaout[kindex] = 0
    gaout[kindex + 1] = 0
    kindex += 2
od

outs aL, aR

kupdtrig metro 3

kmaxL max_k aL, kupdtrig, 1
kmaxR max_k aR, kupdtrig, 1

cabbageSetValue "vu1", portk(kmaxL, .25), kupdtrig
cabbageSetValue "vu2", portk(kmaxR, .25), kupdtrig

endin

</CsInstruments>
<CsScore>
f0 z
i1 0 -1
i20 0 -1
</CsScore>
</CsoundSynthesizer>
