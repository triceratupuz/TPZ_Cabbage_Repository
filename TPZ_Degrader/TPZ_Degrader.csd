;Degrader
;developed by Triceratupuz Lab
;http://triceratupuz.altervista.org/
;REV 20210713


<Cabbage>
form caption("Degrader") size(250, 100), guiMode("queue") pluginId("tpdg") colour(150, 150, 150)
rslider bounds(5, 5, 60, 60), channel("bits"), range(0, 32, 16, 1, .01), text("Bits"), trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black") colour(150, 150, 150)
rslider bounds(65, 5, 60, 60), channel("fold"), range(0, 16, 0, 1, .01), text("Fold"), trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black") colour(150, 150, 150)
rslider bounds(125, 5, 60, 60), channel("dw"), range(0, 1, 1, 1, .01), text("Dry-wet"), trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black") colour(150, 150, 150)
rslider bounds(185, 5, 60, 60), channel("gain"), range(-150, 18, 0, 6.2, .01), text("Gain"), trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black") colour(150, 150, 150)

combobox bounds(5, 70, 178, 25), populate("*.snaps")
filebutton bounds(185, 70, 60, 25), text("Save"), mode("preset"), populate("*.snaps")


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


instr 1
kbits chnget "bits"
kfold chnget "fold"
kdw chnget "dw"
kgain chnget "gain"

aL inch 1
aR inch 2

kvalues	 pow 2, kbits
abitL = (int((aL/0dbfs)*kvalues))/kvalues
abitR = (int((aR/0dbfs)*kvalues))/kvalues

afoldL fold abitL, kfold
afoldR fold abitR, kfold

aoutL = aL * cos(kdw * $M_PI_2) + afoldL * sin(kdw * $M_PI_2)
aoutR = aR * cos(kdw * $M_PI_2) + afoldR * sin(kdw * $M_PI_2)


outs aoutL * ampdbfs(kgain), aoutR * ampdbfs(kgain)
endin

</CsInstruments>
<CsScore>
f0 z
i1 0 -1
</CsScore>
</CsoundSynthesizer>
