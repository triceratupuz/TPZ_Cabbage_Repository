;MidiMessanger
;developed by Triceratupuz Lab
;http://triceratupuz.altervista.org/
;REV 20210921
<Cabbage>
form caption("Midi Messanger") size(430, 90), guiMode("queue"), pluginId("tmm0"), colour("white")
label bounds(5, 25, 100, 15) text("Message")
combobox bounds(5, 46, 100, 18), channel("event"), colour("black"), fontColour("white"), items("note On", "note Off", "PC", "CC", "pitch bend", "poly aftouch", "chan aftouch")
label bounds(105, 5, 100, 15) text("Message")
label bounds(105, 25, 100, 15) text("number")
nslider  bounds(105, 45, 80, 20) channel("number") range(0, 300, 0, 1, 1) 
label bounds(185, 25, 80, 15) text("Channel")
nslider bounds(185, 45, 80, 20) channel("channel") range(1, 16, 1, 1, 1) 
label bounds(265, 25, 80, 15) text("Data1")
nslider bounds(265, 45, 80, 20) channel("data1") range(1, 127, 1, 1, 1) 
label bounds(345, 25, 80, 15) text("Data2")
nslider bounds(345, 45, 80, 20) channel("data2") range(1, 127, 1, 1, 1) 
button bounds(5, 65, 420, 20) channel("send") text("send","send") colour:0("black") colour:1("black")

</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d -+rtmidi=NULL -M0 -Q0 -m0d 
</CsOptions>
<CsInstruments>
ksmps = 32
nchnls = 2
0dbfs = 1

massign 0, 0

giMidiMessages ftgen  2, 0, 16, -2, 0, 144, 128, 192, 176, 224, 160, 208


;instrument will be triggered by keyboard widget
instr 1
kmess cabbageGetValue "event"
if changed(kmess) == 1 then
    kval tab kmess, giMidiMessages
    cabbageSetValue "number", kval, changed(kmess)
endif



;MIDI thru
remidi:
    kstatus, kchan, kdata1, kdata2 midiin
    if kstatus != 0 then
        midiout kstatus, kchan, kdata1, kdata2
    endif
if kstatus != 0 kgoto remidi


;Midi Message
ksend cabbageGetValue "send"
if changed(ksend) == 1 then
    kev cabbageGetValue "number"
    kch cabbageGetValue "channel"
    kd1 cabbageGetValue "data1"
    kd2 cabbageGetValue "data2"
    midiout kev, kch, kd1, kd2
endif
endin


</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f0 z
i1 0 -1
</CsScore>
</CsoundSynthesizer>
