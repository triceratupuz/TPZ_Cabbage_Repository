;MidiFilter
;developed by Triceratupuz Lab
;http://triceratupuz.altervista.org/
;REV 20210921
<Cabbage>
form caption("Midi Filter") size(360, 227), guiMode("queue") pluginId("mftp") colour(190,190,190)
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

massign 0, 0

gimidiin ftgen 1, 0, 64, -2, -1

instr 1
iY init 1

Seventl init "bounds(5, 5, 80, 15), text(\"Event\"), fontColour(\"black\")"
cabbageCreate "label", Seventl
Schannell init "bounds(105, 5, 80, 12), text(\"Channel min\"), fontColour(\"blue\")"
cabbageCreate "label", Schannell
Schannell init "bounds(105, 18, 80, 12), text(\"Channel max\"), fontColour(\"red\")"
cabbageCreate "label", Schannell
Sdata1l init "bounds(185, 5, 80, 12), text(\"Data1 min\"), fontColour(\"blue\")"
cabbageCreate "label", Sdata1l
Sdata1l init "bounds(185, 18, 80, 12), text(\"Data1 max\"), fontColour(\"red\")"
cabbageCreate "label", Sdata1l
Sdata2l init "bounds(265, 5, 80, 12), text(\"Data2 min\"), fontColour(\"blue\")"
cabbageCreate "label", Sdata2l
Sdata2l init "bounds(265, 18, 80, 12), text(\"Data2 max\"), fontColour(\"red\")"
cabbageCreate "label", Sdata2l


while iY <= 3 do
    ;background
    Sbackground sprintf "bounds(5, %d, 350, 60), colour(\"white\"), shape(\"sharp\"), channel(\"filt%d\")", (iY-1) * 63 + 35 ,  iY
    cabbageCreate "image", Sbackground
    ;Event
    Sevent sprintf "bounds(5, 5, 100, 15), channel(\"event%d\"), colour(\"white\"), fontColour(\"black\"), items(\"block all\", \"thru all\", \"thru channel\", \"note\", \"note on\", \"note off\", \"cc\", \"pc\", \"pitch bend\", \"poly afrettouch\", \"channel aftertouch\") parent(\"filt%d\"))", iY, iY
    cabbageCreate "combobox", Sevent
    ;Channel
    SchannelMin sprintf "bounds(105, 5, 80, 25), range(1, 16, 1, 1, 1), channel(\"channelmin%d\"), colour(\"blue\") parent(\"filt%d\"))", iY, iY
    cabbageCreate "nslider", SchannelMin
    SchannelMax sprintf "bounds(105, 30, 80, 25), range(1, 16, 16, 1, 1), channel(\"channelmax%d\"), colour(\"red\") parent(\"filt%d\"))", iY, iY
    cabbageCreate "nslider", SchannelMax
    ;data1
    Sdata1Min sprintf "bounds(185, 5, 80, 25), range(0, 127, 1, 1, 1), channel(\"data1min%d\"), colour(\"blue\") parent(\"filt%d\"))", iY, iY
    cabbageCreate "nslider", Sdata1Min
    Sdata1Max sprintf "bounds(185, 30, 80, 25), range(0, 127, 127, 1, 1), channel(\"data1max%d\"), colour(\"red\") parent(\"filt%d\"))", iY, iY
    cabbageCreate "nslider", Sdata1Max
    ;data2
    Sdata2Min sprintf "bounds(265, 5, 80, 25), range(0, 127, 1, 1, 1), channel(\"data2min%d\"), colour(\"blue\") parent(\"filt%d\"))", iY, iY
    cabbageCreate "nslider", Sdata2Min
    Sdata2Max sprintf "bounds(265, 30, 80, 25), range(0, 127, 127, 1, 1), channel(\"data2max%d\"), colour(\"red\") parent(\"filt%d\"))", iY, iY
    cabbageCreate "nslider", Sdata2Max
    iY +=1
od

;midi in storege
;clear storage table
kidx = 0
while kidx < tableng(gimidiin) do
    tabw k(0), kidx, gimidiin
    kidx += 4;clear only the event type
od
;fill table
kidx = 0
remidiin:
kstatus, kchan, kdata1, kdata2 midiin
    ;printk2 kstatus
    tabw kstatus, kidx, gimidiin
    tabw kchan, kidx + 1, gimidiin
    tabw kdata1, kidx + 2, gimidiin
    tabw kdata2, kidx + 3, gimidiin
kidx += 4
if kstatus > 0 kgoto remidiin


kval1 cabbageGetValue "event1"
kon1 init 0
if changed(kval1) == 1 && kval1 > 1 && kon1 == 0 then
    event "i", 10 + 0.01, 0, -1, 1
    kon1 = 1
elseif changed(kval1) == 1 && kval1 == 1 then
    event "i", -10 - 0.01, 0, -1, 1
    kon1 = 0
endif

kval2 cabbageGetValue "event2"
kon2 init 0
if changed(kval2) == 1 && kval2 > 1 && kon2 == 0 then
    event "i", 10 + 0.02, 0, -1, 2
    kon2 = 1
elseif changed(kval2) == 1 && kval2 == 1 then
    event "i", -10 - 0.02, 0, -1, 2
    kon2 = 0
endif

kval3 cabbageGetValue "event3"
kon3 init 0
if changed(kval3) == 1 && kval3 > 1 && kon3 == 0 then
    event "i", 10 + 0.03, 0, -1, 3
    kon2 = 1
elseif changed(kval3) == 1 && kval3 == 1 then
    event "i", -10 - 0.03, 0, -1, 3
    kon3 = 0
endif

endin




instr 10;filter
print p1
kevent_ cabbageGetValue sprintf("event%d", p4)
kchanmin cabbageGetValue sprintf("channelmin%d", p4)
kchanmax cabbageGetValue sprintf("channelmax%d", p4)
kdata1min cabbageGetValue sprintf("data1min%d", p4)
kdata1max cabbageGetValue sprintf("data1max%d", p4)
kdata2min cabbageGetValue sprintf("data2min%d", p4)
kdata2max cabbageGetValue sprintf("data2max%d", p4)

kevent = 0
;read storage table
kidx = 0
while kidx < tableng(gimidiin) do
    kstatus tab kidx, gimidiin
    kstatus round kstatus
    if kstatus > 0 then
        kchannel tab kidx + 1, gimidiin
        kdata1 tab kidx + 2, gimidiin
        kdata2 tab kidx + 3, gimidiin    
        if kevent_ == 2 then;thru
            event "i", 20 + 0.001 * kidx, 0, -1, kstatus, kchannel, kdata1, kdata2
        elseif kevent_ == 3 then;channel pass
            if kchannel >= kchanmin && kchannel <= kchanmax then
                event "i", 20 + 0.001 * kidx, 0, -1, kstatus, kchannel, kdata1, kdata2
            endif
        elseif kevent_ == 4 then;notes only
            if kstatus == 128 || kstatus == 144 then
                if kchannel >= kchanmin && kchannel <= kchanmax then
                    if kdata1 >= kdata1min && kdata1 <= kdata1max && kdata2 >= kdata2min && kdata2 <= kdata2max then
                       event "i", 20 + 0.001 * kidx, 0, -1, kstatus, kchannel, kdata1, kdata2  
                    endif
                endif
            endif
        elseif  kevent_ == 5 then;notes only
            if kstatus == 144 then
                if kchannel >= kchanmin && kchannel <= kchanmax then
                    if kdata1 >= kdata1min && kdata1 <= kdata1max && kdata2 >= kdata2min && kdata2 <= kdata2max then
                       event "i", 20 + 0.001 * kidx, 0, -1, kstatus, kchannel, kdata1, kdata2  
                    endif
                endif
            endif
        elseif  kevent_ == 6 then;notes only
            if kstatus == 128 then
                if kchannel >= kchanmin && kchannel <= kchanmax then
                    if kdata1 >= kdata1min && kdata1 <= kdata1max && kdata2 >= kdata2min && kdata2 <= kdata2max then
                       event "i", 20 + 0.001 * kidx, 0, -1, kstatus, kchannel, kdata1, kdata2  
                    endif
                endif
            endif
        elseif  kevent_ == 7 then;cc
            if kstatus == 176 then
                if kchannel >= kchanmin && kchannel <= kchanmax then
                    if kdata1 >= kdata1min && kdata1 <= kdata1max && kdata2 >= kdata2min && kdata2 <= kdata2max then
                       event "i", 20 + 0.001 * kidx, 0, -1, kstatus, kchannel, kdata1, kdata2  
                    endif
                endif
            endif
        elseif  kevent_ == 8 then;pc
            if kstatus == 192 then
                if kchannel >= kchanmin && kchannel <= kchanmax then
                    if kdata1 >= kdata1min && kdata1 <= kdata1max then
                       event "i", 20 + 0.001 * kidx, 0, -1, kstatus, kchannel, kdata1, kdata2  
                    endif
                endif
            endif
       elseif  kevent_ == 9 then;bend
            if kstatus == 224 then
                if kchannel >= kchanmin && kchannel <= kchanmax then
                    if kdata1 >= kdata1min && kdata1 <= kdata1max && kdata2 >= kdata2min && kdata2 <= kdata2max then
                       event "i", 20 + 0.001 * kidx, 0, -1, kstatus, kchannel, kdata1, kdata2  
                    endif
                endif
            endif
       elseif  kevent_ == 10 then;poly aftouch
            if kstatus == 160 then
                if kchannel >= kchanmin && kchannel <= kchanmax then
                    if kdata1 >= kdata1min && kdata1 <= kdata1max && kdata2 >= kdata2min && kdata2 <= kdata2max then
                       event "i", 20 + 0.001 * kidx, 0, -1, kstatus, kchannel, kdata1, kdata2  
                    endif
                endif
            endif                       
       elseif  kevent_ == 11 then;ch aftouch
            if kstatus == 208 then
                if kchannel >= kchanmin && kchannel <= kchanmax then
                    if kdata1 >= kdata1min && kdata1 <= kdata1max && kdata2 >= kdata2min && kdata2 <= kdata2max then
                       event "i", 20 + 0.001 * kidx, 0, -1, kstatus, kchannel, kdata1, kdata2  
                    endif
                endif
            endif          
        
        endif
    endif
    kidx += 4
od

endin


instr 20;midiout
;istatus, ichan, idata1, idata2
print p4, p5, p6, p7
midiout_i p4, p5, p6, p7
turnoff
endin



</CsInstruments>
<CsScore>
f0 z
i 1 0 -1
i 15 0 -1
</CsScore>
</CsoundSynthesizer>
