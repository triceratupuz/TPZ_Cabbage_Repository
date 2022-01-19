<Cabbage>
form caption("Droner") size(690, 645), guiMode("queue"), pluginId("drtp"), colour("grey")

image bounds(5, 5, 610, 100), colour(70,70,70){
rslider bounds(5, 5, 90, 90), channel("freq1"), range(0, 3000, 0, 0.3, 0.001), text("frequency"), valueTextBox(1)
checkbox bounds(6, 5, 15, 15) channel("freqtun1"), fontColour:1(255, 255, 255)
rslider bounds(85, 5, 90, 90), channel("amp1"), range(0, 1, 0,1, 0.001), text("amplitude"), valueTextBox(1)
vslider bounds(165, 5, 20, 90), channel("wavsi1"), range(0, 1, 0, 1, 0.001), text("si") 
vslider bounds(185, 5, 20, 90), channel("wavtr1"), range(0, 1, 0, 1, 0.001), text("tr")
vslider bounds(205, 5, 20, 90), channel("wavsq1"), range(0, 1, 0, 1, 0.001), text("sq")


rslider bounds(225, 5, 90, 90), channel("freqmod1"), range(0, 1, 0, 1, 0.001), text("freq_mod"), valueTextBox(1)
checkbox bounds(305, 15, 125, 10) channel("freqmod1_1"), fontColour:1(255, 255, 255) text("1")
checkbox bounds(305, 25, 125, 10) channel("freqmod2_1"), fontColour:1(255, 255, 255) text("2")
checkbox bounds(305, 35, 125, 10) channel("freqmod3_1"), fontColour:1(255, 255, 255) text("3")
checkbox bounds(305, 45, 125, 10) channel("freqmod4_1"), fontColour:1(255, 255, 255) text("4")
checkbox bounds(305, 55, 125, 10) channel("freqmod5_1"), fontColour:1(255, 255, 255) text("5")
checkbox bounds(305, 65, 125, 10) channel("freqmod6_1"), fontColour:1(255, 255, 255) text("6")


rslider bounds(335, 5, 90, 90), channel("ampmod1"), range(0, 1, 0, 0.5, 0.001), text("amp_mod"), valueTextBox(1)
checkbox bounds(415, 15, 125, 10) channel("ampmod1_1"), fontColour:1(255, 255, 255) text("1")
checkbox bounds(415, 25, 125, 10) channel("ampmod2_1"), fontColour:1(255, 255, 255) text("2")
checkbox bounds(415, 35, 125, 10) channel("ampmod3_1"), fontColour:1(255, 255, 255) text("3")
checkbox bounds(415, 45, 125, 10) channel("ampmod4_1"), fontColour:1(255, 255, 255) text("4")
checkbox bounds(415, 55, 125, 10) channel("ampmod5_1"), fontColour:1(255, 255, 255) text("5")
checkbox bounds(415, 65, 125, 10) channel("ampmod6_1"), fontColour:1(255, 255, 255) text("6")


rslider bounds(440, 5, 90, 90), channel("pan1"), range(0, 1, 0.5, 1, 0.001), text("pan"), valueTextBox(1)
rslider bounds(520, 5, 90, 90), channel("vol1"), range(0, 2, 1, 1, 0.001), text("volume"), valueTextBox(1)

}

image bounds(5, 107, 610, 100), colour(70,70,70){
rslider bounds(5, 5, 90, 90), channel("freq2"), range(0, 3000, 0, 0.3, 0.001), text("frequency"), valueTextBox(1)
checkbox bounds(6, 5, 15, 15) channel("freqtun2"), fontColour:1(255, 255, 255)
rslider bounds(85, 5, 90, 90), channel("amp2"), range(0, 1, 0,1, 0.001), text("amplitude"), valueTextBox(1)
vslider bounds(165, 5, 20, 90), channel("wavsi2"), range(0, 1, 0, 1, 0.001), text("si") 
vslider bounds(185, 5, 20, 90), channel("wavtr2"), range(0, 1, 0, 1, 0.001), text("tr")
vslider bounds(205, 5, 20, 90), channel("wavsq2"), range(0, 1, 0, 1, 0.001), text("sq")

rslider bounds(225, 5, 90, 90), channel("freqmod2"), range(0, 1, 0, 1, 0.001), text("freq_mod"), valueTextBox(1)
checkbox bounds(305, 15, 125, 10) channel("freqmod1_2"), fontColour:1(255, 255, 255) text("1")
checkbox bounds(305, 25, 125, 10) channel("freqmod2_2"), fontColour:1(255, 255, 255) text("2")
checkbox bounds(305, 35, 125, 10) channel("freqmod3_2"), fontColour:1(255, 255, 255) text("3")
checkbox bounds(305, 45, 125, 10) channel("freqmod4_2"), fontColour:1(255, 255, 255) text("4")
checkbox bounds(305, 55, 125, 10) channel("freqmod5_2"), fontColour:1(255, 255, 255) text("5")
checkbox bounds(305, 65, 125, 10) channel("freqmod6_2"), fontColour:1(255, 255, 255) text("6")


rslider bounds(335, 5, 90, 90), channel("ampmod2"), range(0, 1, 0, 0.5, 0.001), text("amp_mod"), valueTextBox(1)
checkbox bounds(415, 15, 125, 10) channel("ampmod1_2"), fontColour:1(255, 255, 255) text("1")
checkbox bounds(415, 25, 125, 10) channel("ampmod2_2"), fontColour:1(255, 255, 255) text("2")
checkbox bounds(415, 35, 125, 10) channel("ampmod3_2"), fontColour:1(255, 255, 255) text("3")
checkbox bounds(415, 45, 125, 10) channel("ampmod4_2"), fontColour:1(255, 255, 255) text("4")
checkbox bounds(415, 55, 125, 10) channel("ampmod5_2"), fontColour:1(255, 255, 255) text("5")
checkbox bounds(415, 65, 125, 10) channel("ampmod6_2"), fontColour:1(255, 255, 255) text("6")


rslider bounds(440, 5, 90, 90), channel("pan2"), range(0, 1, 0.5, 1, 0.001), text("pan"), valueTextBox(1)
rslider bounds(520, 5, 90, 90), channel("vol2"), range(0, 2, 1, 1, 0.001), text("volume"), valueTextBox(1)


}

image bounds(5, 209, 610, 100), colour(70,70,70){
rslider bounds(5, 5, 90, 90), channel("freq3"), range(0, 3000, 0, 0.3, 0.001), text("frequency"), valueTextBox(1)
checkbox bounds(6, 5, 15, 15) channel("freqtun3"), fontColour:1(255, 255, 255)
rslider bounds(85, 5, 90, 90), channel("amp3"), range(0, 1, 0,1, 0.001), text("amplitude"), valueTextBox(1)
vslider bounds(165, 5, 20, 90), channel("wavsi3"), range(0, 1, 0, 1, 0.001), text("si") 
vslider bounds(185, 5, 20, 90), channel("wavtr3"), range(0, 1, 0, 1, 0.001), text("tr")
vslider bounds(205, 5, 20, 90), channel("wavsq3"), range(0, 1, 0, 1, 0.001), text("sq")


rslider bounds(225, 5, 90, 90), channel("freqmod3"), range(0, 1, 0, 1, 0.001), text("freq_mod"), valueTextBox(1)
checkbox bounds(305, 15, 125, 10) channel("freqmod1_3"), fontColour:1(255, 255, 255) text("1")
checkbox bounds(305, 25, 125, 10) channel("freqmod2_3"), fontColour:1(255, 255, 255) text("2")
checkbox bounds(305, 35, 125, 10) channel("freqmod3_3"), fontColour:1(255, 255, 255) text("3")
checkbox bounds(305, 45, 125, 10) channel("freqmod4_3"), fontColour:1(255, 255, 255) text("4")
checkbox bounds(305, 55, 125, 10) channel("freqmod5_3"), fontColour:1(255, 255, 255) text("5")
checkbox bounds(305, 65, 125, 10) channel("freqmod6_3"), fontColour:1(255, 255, 255) text("6")

rslider bounds(335, 5, 90, 90), channel("ampmod3"), range(0, 1, 0, 0.5, 0.001), text("amp_mod"), valueTextBox(1)
checkbox bounds(415, 15, 125, 10) channel("ampmod1_3"), fontColour:1(255, 255, 255) text("1")
checkbox bounds(415, 25, 125, 10) channel("ampmod2_3"), fontColour:1(255, 255, 255) text("2")
checkbox bounds(415, 35, 125, 10) channel("ampmod3_3"), fontColour:1(255, 255, 255) text("3")
checkbox bounds(415, 45, 125, 10) channel("ampmod4_3"), fontColour:1(255, 255, 255) text("4")
checkbox bounds(415, 55, 125, 10) channel("ampmod5_3"), fontColour:1(255, 255, 255) text("5")
checkbox bounds(415, 65, 125, 10) channel("ampmod6_3"), fontColour:1(255, 255, 255) text("6")


rslider bounds(440, 5, 90, 90), channel("pan3"), range(0, 1, 0.5, 1, 0.001), text("pan"), valueTextBox(1)
rslider bounds(520, 5, 90, 90), channel("vol3"), range(0, 2, 1, 1, 0.001), text("volume"), valueTextBox(1)

}


image bounds(5, 311, 610, 100), colour(70,70,70){
rslider bounds(5, 5, 90, 90), channel("freq4"), range(0, 3000, 0, 0.3, 0.001), text("frequency"), valueTextBox(1)
checkbox bounds(6, 5, 15, 15) channel("freqtun4"), fontColour:1(255, 255, 255)
rslider bounds(85, 5, 90, 90), channel("amp4"), range(0, 1, 0,1, 0.001), text("amplitude"), valueTextBox(1)
vslider bounds(165, 5, 20, 90), channel("wavsi4"), range(0, 1, 0, 1, 0.001), text("si") 
vslider bounds(185, 5, 20, 90), channel("wavtr4"), range(0, 1, 0, 1, 0.001), text("tr")
vslider bounds(205, 5, 20, 90), channel("wavsq4"), range(0, 1, 0, 1, 0.001), text("sq")


rslider bounds(225, 5, 90, 90), channel("freqmod4"), range(0, 1, 0, 1, 0.001), text("freq_mod"), valueTextBox(1)
checkbox bounds(305, 15, 125, 10) channel("freqmod1_4"), fontColour:1(255, 255, 255) text("1")
checkbox bounds(305, 25, 125, 10) channel("freqmod2_4"), fontColour:1(255, 255, 255) text("2")
checkbox bounds(305, 35, 125, 10) channel("freqmod3_4"), fontColour:1(255, 255, 255) text("3")
checkbox bounds(305, 45, 125, 10) channel("freqmod4_4"), fontColour:1(255, 255, 255) text("4")
checkbox bounds(305, 55, 125, 10) channel("freqmod5_4"), fontColour:1(255, 255, 255) text("5")
checkbox bounds(305, 65, 125, 10) channel("freqmod6_4"), fontColour:1(255, 255, 255) text("6")


rslider bounds(335, 5, 90, 90), channel("ampmod4"), range(0, 1, 0, 0.5, 0.001), text("amp_mod"), valueTextBox(1)
checkbox bounds(415, 15, 125, 10) channel("ampmod1_4"), fontColour:1(255, 255, 255) text("1")
checkbox bounds(415, 25, 125, 10) channel("ampmod2_4"), fontColour:1(255, 255, 255) text("2")
checkbox bounds(415, 35, 125, 10) channel("ampmod3_4"), fontColour:1(255, 255, 255) text("3")
checkbox bounds(415, 45, 125, 10) channel("ampmod4_4"), fontColour:1(255, 255, 255) text("4")
checkbox bounds(415, 55, 125, 10) channel("ampmod5_4"), fontColour:1(255, 255, 255) text("5")
checkbox bounds(415, 65, 125, 10) channel("ampmod6_4"), fontColour:1(255, 255, 255) text("6")


rslider bounds(440, 5, 90, 90), channel("pan4"), range(0, 1, 0.5, 1, 0.001), text("pan"), valueTextBox(1)
rslider bounds(520, 5, 90, 90), channel("vol4"), range(0, 2, 1, 1, 0.001), text("volume"), valueTextBox(1)

}


image bounds(5, 413, 610, 100), colour(70,70,70){
rslider bounds(5, 5, 90, 90), channel("freq5"), range(0, 3000, 0, 0.3, 0.001), text("frequency"), valueTextBox(1)
checkbox bounds(6, 5, 15, 15) channel("freqtun5"), fontColour:1(255, 255, 255)
rslider bounds(85, 5, 90, 90), channel("amp5"), range(0, 1, 0,1, 0.001), text("amplitude"), valueTextBox(1)
vslider bounds(165, 5, 20, 90), channel("wavsi5"), range(0, 1, 0, 1, 0.001), text("si") 
vslider bounds(185, 5, 20, 90), channel("wavtr5"), range(0, 1, 0, 1, 0.001), text("tr")
vslider bounds(205, 5, 20, 90), channel("wavsq5"), range(0, 1, 0, 1, 0.001), text("sq")


rslider bounds(225, 5, 90, 90), channel("freqmod5"), range(0, 1, 0, 1, 0.001), text("freq_mod"), valueTextBox(1)
checkbox bounds(305, 15, 125, 10) channel("freqmod1_5"), fontColour:1(255, 255, 255) text("1")
checkbox bounds(305, 25, 125, 10) channel("freqmod2_5"), fontColour:1(255, 255, 255) text("2")
checkbox bounds(305, 35, 125, 10) channel("freqmod3_5"), fontColour:1(255, 255, 255) text("3")
checkbox bounds(305, 45, 125, 10) channel("freqmod4_5"), fontColour:1(255, 255, 255) text("4")
checkbox bounds(305, 55, 125, 10) channel("freqmod5_5"), fontColour:1(255, 255, 255) text("5")
checkbox bounds(305, 65, 125, 10) channel("freqmod6_5"), fontColour:1(255, 255, 255) text("6")


rslider bounds(335, 5, 90, 90), channel("ampmod5"), range(0, 1, 0, 0.5, 0.001), text("amp_mod"), valueTextBox(1)
checkbox bounds(415, 15, 125, 10) channel("ampmod1_5"), fontColour:1(255, 255, 255) text("1")
checkbox bounds(415, 25, 125, 10) channel("ampmod2_5"), fontColour:1(255, 255, 255) text("2")
checkbox bounds(415, 35, 125, 10) channel("ampmod3_5"), fontColour:1(255, 255, 255) text("3")
checkbox bounds(415, 45, 125, 10) channel("ampmod4_5"), fontColour:1(255, 255, 255) text("4")
checkbox bounds(415, 55, 125, 10) channel("ampmod5_5"), fontColour:1(255, 255, 255) text("5")
checkbox bounds(415, 65, 125, 10) channel("ampmod6_5"), fontColour:1(255, 255, 255) text("6")

rslider bounds(440, 5, 90, 90), channel("pan5"), range(0, 1, 0.5, 1, 0.001), text("pan"), valueTextBox(1)
rslider bounds(520, 5, 90, 90), channel("vol5"), range(0, 2, 1, 1, 0.001), text("volume"), valueTextBox(1)

}

image bounds(5, 515, 610, 100), colour(70,70,70){
rslider bounds(5, 5, 90, 90), channel("freq6"), range(0, 3000, 0, 0.3, 0.001), text("frequency"), valueTextBox(1)
checkbox bounds(6, 5, 15, 15) channel("freqtun6"), fontColour:1(255, 255, 255)
rslider bounds(85, 5, 90, 90), channel("amp6"), range(0, 1, 0,1, 0.001), text("amplitude"), valueTextBox(1)
vslider bounds(165, 5, 20, 90), channel("wavsi6"), range(0, 1, 0, 1, 0.001), text("si") 
vslider bounds(185, 5, 20, 90), channel("wavtr6"), range(0, 1, 0, 1, 0.001), text("tr")
vslider bounds(205, 5, 20, 90), channel("wavsq6"), range(0, 1, 0, 1, 0.001), text("sq")


rslider bounds(225, 5, 90, 90), channel("freqmod6"), range(0, 1, 0, 1, 0.001), text("freq_mod"), valueTextBox(1)
checkbox bounds(305, 15, 125, 10) channel("freqmod1_6"), fontColour:1(255, 255, 255) text("1")
checkbox bounds(305, 25, 125, 10) channel("freqmod2_6"), fontColour:1(255, 255, 255) text("2")
checkbox bounds(305, 35, 125, 10) channel("freqmod3_6"), fontColour:1(255, 255, 255) text("3")
checkbox bounds(305, 45, 125, 10) channel("freqmod4_6"), fontColour:1(255, 255, 255) text("4")
checkbox bounds(305, 55, 125, 10) channel("freqmod5_6"), fontColour:1(255, 255, 255) text("5")
checkbox bounds(305, 65, 125, 10) channel("freqmod6_6"), fontColour:1(255, 255, 255) text("6")

rslider bounds(335, 5, 90, 90), channel("ampmod6"), range(0, 1, 0, 0.5, 0.001), text("amp_mod"), valueTextBox(1)
checkbox bounds(415, 15, 125, 10) channel("ampmod1_6"), fontColour:1(255, 255, 255) text("1")
checkbox bounds(415, 25, 125, 10) channel("ampmod2_6"), fontColour:1(255, 255, 255) text("2")
checkbox bounds(415, 35, 125, 10) channel("ampmod3_6"), fontColour:1(255, 255, 255) text("3")
checkbox bounds(415, 45, 125, 10) channel("ampmod4_6"), fontColour:1(255, 255, 255) text("4")
checkbox bounds(415, 55, 125, 10) channel("ampmod5_6"), fontColour:1(255, 255, 255) text("5")
checkbox bounds(415, 65, 125, 10) channel("ampmod6_6"), fontColour:1(255, 255, 255) text("6")


rslider bounds(440, 5, 90, 90), channel("pan6"), range(0, 1, 0.5, 1, 0.001), text("pan"), valueTextBox(1)
rslider bounds(520, 5, 90, 90), channel("vol6"), range(0, 2, 1, 1, 0.001), text("volume"), valueTextBox(1)

}



vslider bounds(570, 5, 140, 300), channel("tuning"), range(-1, 1, 0, 1, 0.01)

nslider bounds(650, 10, 30, 25), channel("tuningmax"), range(0, 127, 127, 1, 1)
label bounds(650, 35, 30, 10), text("max"), align("centre")
nslider bounds(650, 140, 30, 25), channel("tuningneu"), range(0, 127, 69, 1, 1)
label bounds(650, 165, 30, 10), text("neu"), align("centre")
nslider bounds(650, 275, 30, 25), channel("tuningmin"), range(0, 127, 0, 1, 1)
label bounds(650, 260, 30, 10), text("min"), align("centre")

vslider bounds(580, 315, 140, 180), channel("vol"), range(0, 4, 1, 0.5, 0.001), text("volume"), valueTextBox(1)

rslider bounds(605, 515, 90, 90), channel("por"), range(0, 15, 1, 1, 0.001), text("portamento"), valueTextBox(1)

combobox bounds(5, 620, 250, 20), populate("*.snaps")
filebutton bounds(260, 620, 60, 20), text("Save"), mode("preset"), populate("*.snaps")

</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d -+rtmidi=NULL -M0 -Q0 -m0d
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
ksmps = 32
nchnls = 2
0dbfs = 1
massign 0,0


gaoscilstore[] init 6
gaoscout[] init 2


giSine ftgen 1, 0, 16384, 10, 1
giTriangle ftgen 2, 0, 16384, 8, 0, 2048 *2, 1, 4096*2, -1, 2048*2, 0
giSquare ftgen 3, 0, 16384, 8, 0, 10*2, 1, 4080*2, 1, 9*2, -1, 4080*2, -1, 10*2, 0


instr 1


event_i "i", 10.01, 0.1, -1, 1
event_i "i", 10.02, 0.1, -1, 2
event_i "i", 10.03, 0.1, -1, 3
event_i "i", 10.04, 0.1, -1, 4
event_i "i", 10.05, 0.1, -1, 5
event_i "i", 10.06, 0.1, -1, 6
event_i "i", 50, 0, -1, 2




kmintuning cabbageGetValue "tuningmin"
kneutuning cabbageGetValue "tuningneu"
kmaxtuning cabbageGetValue "tuningmax"



;MIDI
kstatus, kchan, kdata1, kdata2 midiin
;printk2 kdata1
if kstatus == 144 then
    if kdata1 == kneutuning then
        kmastertu  = 0
    elseif kdata1 < kneutuning then
        kmastertu = -1 + (kdata1 - kmintuning) / (kneutuning - kmintuning)
    elseif kdata1 > kneutuning then
        kmastertu = (kdata1 - kneutuning) / (kmaxtuning - kneutuning)

    endif
    
    cabbageSetValue "tuning", kmastertu
endif



;gui
kmastertuning_ cabbageGetValue "tuning"
if kmastertuning_ == 0 then
    kmastertu  = 0
elseif kmastertuning_ < 0 then
    kmastertu = (kneutuning - kmintuning) * kmastertuning_
elseif kmastertuning_ > 0 then
    kmastertu = (kmaxtuning - kneutuning) * kmastertuning_
endif    
    
kpor cabbageGetValue "por"
gkmastertuning portk kmastertu, kpor

endin






instr 10;voice p4 = index

Sfreq sprintf "freq%d", p4
Sfreqtun sprintf "freqtun%d", p4
Samp sprintf "amp%d", p4
Sfreqmod sprintf "freqmod%d", p4
Sfreqmod1_ sprintf "freqmod1_%d", p4
Sfreqmod2_ sprintf "freqmod2_%d", p4
Sfreqmod3_ sprintf "freqmod3_%d", p4
Sfreqmod4_ sprintf "freqmod4_%d", p4
Sfreqmod5_ sprintf "freqmod5_%d", p4
Sfreqmod6_ sprintf "freqmod6_%d", p4

Sampmod sprintf "ampmod%d", p4
Sampmod1_ sprintf "ampmod1_%d", p4
Sampmod2_ sprintf "ampmod2_%d", p4
Sampmod3_ sprintf "ampmod3_%d", p4
Sampmod4_ sprintf "ampmod4_%d", p4
Sampmod5_ sprintf "ampmod5_%d", p4
Sampmod6_ sprintf "ampmod6_%d", p4


Stabsi sprintf "wavsi%d", p4
Stabtr sprintf "wavtr%d", p4
Stabsq sprintf "wavsq%d", p4

Span sprintf "pan%d", p4
Svol sprintf "vol%d", p4


kfreq_ cabbageGetValue Sfreq
kfreq port kfreq_, 0.02
kfreqtun cabbageGetValue Sfreqtun
kamp_ cabbageGetValue Samp
kamp port kamp_, 0.02
kfreqmod_ cabbageGetValue Sfreqmod
kfreqmod port kfreqmod_, 0.02
kfreqmod1_ cabbageGetValue Sfreqmod1_
kmodf1 port kfreqmod1_, 0.02
kfreqmod2_ cabbageGetValue Sfreqmod2_
kmodf2 port kfreqmod2_, 0.02
kfreqmod3_ cabbageGetValue Sfreqmod3_
kmodf3 port kfreqmod3_, 0.02
kfreqmod4_ cabbageGetValue Sfreqmod4_
kmodf4 port kfreqmod4_, 0.02
kfreqmod5_ cabbageGetValue Sfreqmod5_
kmodf5 port kfreqmod5_, 0.02
kfreqmod6_ cabbageGetValue Sfreqmod6_
kmodf6 port kfreqmod6_, 0.02

kampmod_ cabbageGetValue Sampmod
kampmod port kampmod_, 0.02
kampmod1_ cabbageGetValue Sampmod1_
kmoda1 port kampmod1_, 0.02
kampmod2_ cabbageGetValue Sampmod2_
kmoda2 port kampmod2_, 0.02
kampmod3_ cabbageGetValue Sampmod3_
kmoda3 port kampmod3_, 0.02
kampmod4_ cabbageGetValue Sampmod4_
kmoda4 port kampmod4_, 0.02
kampmod5_ cabbageGetValue Sampmod5_
kmoda5 port kampmod5_, 0.02
kampmod6_ cabbageGetValue Sampmod6_
kmoda6 port kampmod6_, 0.02

ktabsi_ cabbageGetValue Stabsi
ktabtr_ cabbageGetValue Stabtr
ktabsq_ cabbageGetValue Stabsq

ktab_sum = (ktabsi_ + ktabtr_ + ktabsq_) + 0.000000001


ktabsi port ktabsi_ / ktab_sum, 0.02
ktabtr port ktabtr_ / ktab_sum, 0.02
ktabsq port ktabsq_ / ktab_sum, 0.02



kpan_ cabbageGetValue Span
kpan port kpan_, 0.02
kvolume_ cabbageGetValue Svol
kkvolume port kvolume_, 0.02




aamp = kamp + kamp * kampmod * (kmoda1 * gaoscilstore[0] + kmoda2 * gaoscilstore[1] + kmoda3 * gaoscilstore[2] + kmoda4 * gaoscilstore[3] + kmoda5 * gaoscilstore[4] + kmoda6 * gaoscilstore[5])

if kfreqtun == 0 then
    kmastertuning_ = 0
else
    kmastertuning_ = gkmastertuning
endif

kmastertuning port semitone(kmastertuning_), 0.05

afreq = (kfreq + kfreq * kfreqmod * (kmodf1 * gaoscilstore[0] + kmodf2 * gaoscilstore[1] + kmodf3 * gaoscilstore[2] + kmodf4 * gaoscilstore[3] + kmodf5 * gaoscilstore[4] + kmodf6 * gaoscilstore[5])) * kmastertuning

;ktab init 1
;aosc oscilikt aamp, afreq, ktab 

asi oscili ktabsi, afreq, 1
atr oscili ktabtr, afreq, 2
asq oscili ktabsq, afreq, 3
aosc = aamp * (asi + atr + asq)


gaoscilstore[p4-1] = aosc

aoscL, aoscR pan2 aosc * kkvolume, kpan
gaoscout[0] = gaoscout[0] + aoscL
gaoscout[1] = gaoscout[1] + aoscR

endin




instr 50;output
kv_ cabbageGetValue "vol"
kv port kv_, 0.05


outs gaoscout[0] * kv, gaoscout[1] * kv
gaoscout[0] = 0
gaoscout[1] = 0
endin

</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f0 z
i 1 0 -1
</CsScore>
</CsoundSynthesizer>
