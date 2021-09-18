;MidiMonitor
;developed by Triceratupuz Lab
;http://triceratupuz.altervista.org/
;REV 20210916

<Cabbage>
form caption("Midi Monitor") size(410, 300), guiMode("queue"), pluginId("tzmm") colour("grey")
label bounds(5, 5, 100, 15), text("Time"), fontColour("black")
label bounds(105, 5, 50, 15), text("Event"), fontColour("black")
label bounds(155, 5, 100, 15), text("Description"), fontColour("black")
label bounds(255, 5, 50, 15), text("Chan"), fontColour("black")
label bounds(305, 5, 50, 15), text("Data1"), fontColour("black")
label bounds(355, 5, 50, 15), text("data2"), fontColour("black")
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

instr 1
;Create interface
iY = 1
iH = 25
iLines = 10
while iY <= iLines do

    Stime sprintf "bounds(5, %d, 100, %d), range(0, 360000, 0, 1, 0.001), channel(\"time%d\"), colour(\"black\")", ((iY - 1) * iH) + 25, iH, iY
    cabbageCreate "nslider", Stime
    Sevent sprintf "bounds(105, %d, 50, %d), range(0, 500, 0, 1, 1), channel(\"event%d\"), colour(\"black\")", (iY - 1) * iH + 25, iH, iY
    cabbageCreate "nslider", Sevent
    Sbackd sprintf "bounds(155, %d, 100, %d), colour(\"black\")", (iY - 1) * iH + 26, iH - 2
    cabbageCreate "image", Sbackd
    Seventd sprintf "bounds(155, %d, 100, %d), text(\"\"), colour(\"black\") fontColour(\"white\") channel(\"eventd%d\")", (iY - 1) * iH + 26 + iH/4, iH / 2, iY
    cabbageCreate "label", Seventd
    Schannel sprintf "bounds(255, %d, 50, %d), range(0, 500, 0, 1, 1), channel(\"channel%d\"), colour(\"black\")", (iY - 1) * iH + 25, iH, iY
    cabbageCreate "nslider", Schannel
    Sdata1 sprintf "bounds(305, %d, 50, %d), range(0, 500, 0, 1, 1), channel(\"data1%d\"), colour(\"black\")", (iY - 1) * iH + 25, iH, iY
    cabbageCreate "nslider", Sdata1
    Sdata2 sprintf "bounds(355, %d, 50, %d), range(0, 500, 0, 1, 1), channel(\"data2%d\"), colour(\"black\")", (iY - 1) * iH + 25, iH, iY
    cabbageCreate "nslider", Sdata2
    iY += 1
od

Sread sprintf "bounds(6, %d, 399, 20), text(\"Stopped\", \"Monitoring\"), channel(\"read\"), value(1)", (iY - 1) * iH + 25
cabbageCreate "button", Sread


kred cabbageGetValue "read"
;printk2 kred

;MIDI with midi thru
remidi:
    kstatus, kchan, kdata1, kdata2 midiin
    if kstatus != 0 then
        midiout kstatus, kchan, kdata1, kdata2
        if cabbageGetValue("read") == 1 then
            kseconds rtclock
            kcounter = iLines
            while kcounter > 0 do
                ktime cabbageGetValue sprintfk("time%d", kcounter - 1)
                kevent cabbageGetValue sprintfk("event%d", kcounter - 1)
                kchannel cabbageGetValue sprintfk("channel%d", kcounter - 1)
                kdatap1 cabbageGetValue sprintfk("data1%d", kcounter - 1)
                kdatap2 cabbageGetValue sprintfk("data2%d", kcounter - 1)
                Seventd cabbageGet sprintfk("eventd%d", kcounter - 1), "text"
            
                cabbageSetValue  sprintfk("time%d", kcounter), ktime, 1
                cabbageSetValue  sprintfk("event%d", kcounter), kevent, 1
                cabbageSetValue  sprintfk("channel%d", kcounter), kchannel, 1
                cabbageSetValue  sprintfk("data1%d", kcounter), kdatap1, 1
                cabbageSetValue  sprintfk("data2%d", kcounter), kdatap2, 1
                cabbageSet k(1), sprintfk("eventd%d", kcounter), "text", sprintfk("%s", Seventd)
                kcounter += -1
            od
            cabbageSetValue  "time1", kseconds, 1
            cabbageSetValue  "event1", kstatus, 1
            cabbageSetValue  "channel1", kchan, 1
            cabbageSetValue  "data11", kdata1, 1
            cabbageSetValue  "data21", kdata2, 1
            if kstatus == 128 then
                Smessage sprintfk "%s", "note OFF"
            elseif kstatus == 144 then
                Smessage sprintfk "%s", "note ON"
            elseif kstatus == 160 then
                Smessage sprintfk "%s", "poly aftouch"
            elseif kstatus == 176 then
                Smessage sprintfk "%s", "CC"
            elseif kstatus == 192 then
                Smessage sprintfk "%s", "PC"
            elseif kstatus == 208 then
                Smessage sprintfk "%s", "chan aftouch"            
            elseif kstatus == 224 then
                Smessage sprintfk "%s", "pitch bend"                    
            endif
            cabbageSet k(1), "eventd1", "text", sprintfk("%s", Smessage)
        endif
    endif
if kstatus != 0 kgoto remidi




endin

</CsInstruments>
<CsScore>
f0 z
i 1 0 -1
</CsScore>
</CsoundSynthesizer>
