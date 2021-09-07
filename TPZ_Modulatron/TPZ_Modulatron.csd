;Modulatron
;developed by Triceratupuz Lab
;http://triceratupuz.altervista.org/
;REV 20210906

<Cabbage>
form caption("Modulatron") size(600, 570), guiMode("queue") pluginId("motz") colour("grey")

#define BUTT text("") colour:0(0, 0, 0) colour:1(0, 255, 0) fontColour:0(0,255,0) fontColour:1(0,0,0) corners(10)
#define KNOB textColour("black") valueTextBox(1) textBoxColour("black") valueTextBoxBounds(0, 40, 60, 16)

button bounds(5, 5, 80, 560), channel("bypass1") $BUTT
{
rslider bounds(10, 5, 60, 75) channel("pitch1") range(-24, 24, 0, 1, 0.01) text("PITCH") $KNOB
rslider bounds(10, 80, 60, 75) channel("delay1") range(0, 6, 0, 1, 0.001) text("DELAY") $KNOB
combobox bounds(10, 150, 60, 20) channel("delayt1") items("sec", "bpm") fontColour("white")
rslider bounds(10, 175, 60, 75) channel("moda1") range(0, 1, 0, 1, 0.01) text("MOD A") $KNOB
rslider bounds(10, 250, 60, 75) channel("modf1") range(0, 32, 0, 1, 0.001) text("MOD F") $KNOB
rslider bounds(10, 325, 60, 75) channel("feed1") range(0, 1, 0, 1, 0.01) text("FEED") $KNOB
rslider bounds(10, 400, 60, 75) channel("pan1") range(0, 1, 0.5, 1, 0.01) text("PAN") $KNOB
rslider bounds(10, 475, 60, 75) channel("out1") range(-160, 12, 0, 9.5, 0.1) text("OUT") $KNOB
}

button bounds(90, 5, 80, 560), channel("bypass2") $BUTT
{
rslider bounds(10, 5, 60, 75) channel("pitch2") range(-24, 24, 0, 1, 0.01) text("PITCH") $KNOB
rslider bounds(10, 80, 60, 75) channel("delay2") range(0, 6, 0, 1, 0.001) text("DELAY") $KNOB
combobox bounds(10, 150, 60, 20) channel("delayt2") items("sec", "bpm") fontColour("white")
rslider bounds(10, 175, 60, 75) channel("moda2") range(0, 1, 0, 1, 0.01) text("MOD A") $KNOB
rslider bounds(10, 250, 60, 75) channel("modf2") range(0, 32, 0, 1, 0.001) text("MOD F") $KNOB
rslider bounds(10, 325, 60, 75) channel("feed2") range(0, 1, 0, 1, 0.01) text("FEED") $KNOB
rslider bounds(10, 400, 60, 75) channel("pan2") range(0, 1, 0.5, 1, 0.01) text("PAN") $KNOB
rslider bounds(10, 475, 60, 75) channel("out2") range(-160, 12, 0, 9.5, 0.1) text("OUT") $KNOB
}

button bounds(175, 5, 80, 560), channel("bypass3") $BUTT
{
rslider bounds(10, 5, 60, 75) channel("pitch3") range(-24, 24, 0, 1, 0.01) text("PITCH") $KNOB
rslider bounds(10, 80, 60, 75) channel("delay3") range(0, 6, 0, 1, 0.001) text("DELAY") $KNOB
combobox bounds(10, 150, 60, 20) channel("delayt3") items("sec", "bpm") fontColour("white")
rslider bounds(10, 175, 60, 75) channel("moda3") range(0, 1, 0, 1, 0.01) text("MOD A") $KNOB
rslider bounds(10, 250, 60, 75) channel("modf3") range(0, 32, 0, 1, 0.001) text("MOD F") $KNOB
rslider bounds(10, 325, 60, 75) channel("feed3") range(0, 1, 0, 1, 0.01) text("FEED") $KNOB
rslider bounds(10, 400, 60, 75) channel("pan3") range(0, 1, 0.5, 1, 0.01) text("PAN") $KNOB
rslider bounds(10, 475, 60, 75) channel("out3") range(-160, 12, 0, 9.5, 0.1) text("OUT") $KNOB
}

button bounds(260, 5, 80, 560), channel("bypass4") $BUTT
{
rslider bounds(10, 5, 60, 75) channel("pitch4") range(-24, 24, 0, 1, 0.01) text("PITCH") $KNOB
rslider bounds(10, 80, 60, 75) channel("delay4") range(0, 6, 0, 1, 0.001) text("DELAY") $KNOB
combobox bounds(10, 150, 60, 20) channel("delayt4") items("sec", "bpm") fontColour("white")
rslider bounds(10, 175, 60, 75) channel("moda4") range(0, 1, 0, 1, 0.01) text("MOD A") $KNOB
rslider bounds(10, 250, 60, 75) channel("modf4") range(0, 32, 0, 1, 0.001) text("MOD F") $KNOB
rslider bounds(10, 325, 60, 75) channel("feed4") range(0, 1, 0, 1, 0.01) text("FEED") $KNOB
rslider bounds(10, 400, 60, 75) channel("pan4") range(0, 1, 0.5, 1, 0.01) text("PAN") $KNOB
rslider bounds(10, 475, 60, 75) channel("out4") range(-160, 12, 0, 9.5, 0.1) text("OUT") $KNOB
}

button bounds(345, 5, 80, 560), channel("bypass5") $BUTT
{
rslider bounds(10, 5, 60, 75) channel("pitch5") range(-24, 24, 0, 1, 0.01) text("PITCH") $KNOB
rslider bounds(10, 80, 60, 75) channel("delay5") range(0, 6, 0, 1, 0.001) text("DELAY") $KNOB
combobox bounds(10, 150, 60, 20) channel("delayt5") items("sec", "bpm") fontColour("white")
rslider bounds(10, 175, 60, 75) channel("moda5") range(0, 1, 0, 1, 0.01) text("MOD A") $KNOB
rslider bounds(10, 250, 60, 75) channel("modf5") range(0, 32, 0, 1, 0.001) text("MOD F") $KNOB
rslider bounds(10, 325, 60, 75) channel("feed5") range(0, 1, 0, 1, 0.01) text("FEED") $KNOB
rslider bounds(10, 400, 60, 75) channel("pan5") range(0, 1, 0.5, 1, 0.01) text("PAN") $KNOB
rslider bounds(10, 475, 60, 75) channel("out5") range(-160, 12, 0, 9.5, 0.1) text("OUT") $KNOB
}


combobox bounds(430, 5, 165, 20) channel("BpmMode") items("Host BpM", "Manual BpM") fontColour("white")
nslider bounds(430, 25, 165, 30) channel("BpMv") range(0, 500, 60, 1, 0.001) colour("blue")
rslider bounds(420, 65, 80, 90) channel("direct") range(-160, 12, 0, 9.5, 0.1) text("DIRECT") textColour("black") valueTextBox(1) textBoxColour("black")
rslider bounds(490, 65, 80, 90) channel("effect") range(-160, 12, 0, 9.5, 0.1) text("EFFECT") textColour("black") valueTextBox(1) textBoxColour("black")

vmeter bounds(570, 65, 10, 90) channel("vu1") value(0) outlineColour(0, 0, 0), overlayColour(0, 0, 0) meterColour:0(255, 0, 0) meterColour:1(255, 255, 0) meterColour:2(0, 255, 0) outlineThickness(1) 
vmeter bounds(580, 65, 10, 90) channel("vu2") value(0) outlineColour(0, 0, 0), overlayColour(0, 0, 0) meterColour:0(255, 0, 0) meterColour:1(255, 255, 0) meterColour:2(0, 255, 0) outlineThickness(1) 

label bounds(430, 165, 165, 20) text("<No Preset>") channel("presetName") colour(50, 50, 50)  fontColour("green")
listbox bounds(430, 185, 165, 360), populate("*.pre", "TPZ_Modulatron"), channel("recallCombo"), channelType("string")
filebutton bounds(430, 545, 165, 20) channel("saveFile") text("Save") populate("*.pre","TPZ_Modulatron") mode("save") colour:0(50, 50, 50) colour:1(50, 50, 50) 



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



#define ACTV(NUM)#
kbyp_$NUM cabbageGetValue "bypass$NUM"
if kbyp_$NUM == 1 && changed2(kbyp_$NUM) == 1 then
    event "i", 10 + 0.01 * $NUM, giport, -1, $NUM
elseif kbyp_$NUM == 0 && changed2(kbyp_$NUM) == 1 then
    event "i", -10 - 0.01 * $NUM, 0, -1
endif
#



opcode AtanLimit, a, a
ain xin
aout = 2 * taninv(ain) / 3.1415927
xout aout
endop



gaut[] init 12
giport init 0.02
gkbpm init 60



;DEFINITIONS FOR PRESET SYSTEM
;presets instrument numbers
#define CONTINSTR #1010#
#define LOADINSTR #1011#
#define SAVEINSTR #1012#
#define FILLMIDIINSTR #1013#
;widgets to ignore
gSIgnoreChannels[] fillarray "presetName", "recallCombo", "saveFile", "vu1", "vu2"
;widgets to save and update
gSSaveChannels[] fillarray "bypass1","pitch1","delay1","delayt1","moda1","modf1","feed1","pan1","out1",
                            "bypass2","pitch2","delay2","delayt2","moda2","modf2","feed2","pan2","out2",
                            "bypass3","pitch3","delay3","delayt3","moda3","modf3","feed3","pan3","out3",
                            "bypass4","pitch4","delay4","delayt4","moda4","modf4","feed4","pan4","out4",
                            "bypass5","pitch5","delay5","delayt5","moda5","modf5","feed5","pan5","out5",
                            "direct", "effect", "BpmMode"
;Store filenames according MIDI PC
gSfilenamesMidi[] init 128
;Start presets instruments
event_i "i", $FILLMIDIINSTR, 0, -1
event_i "i", $CONTINSTR, 1, -1








instr 1;input and control

a1 inch 1
a2 inch 2

gaut[0] = a1
gaut[1] = a2

ifftsize = 1024
ioverlap = ifftsize / 4
iwinsize = ifftsize
iwintype = 0
gfinput pvsanal (a1 + a2) / $M_SQRT2, ifftsize, ioverlap, iwinsize, iwintype 

$ACTV(1)
$ACTV(2)
$ACTV(3)
$ACTV(4)
$ACTV(5)


kBPM chnget "HOST_BPM"
kbpmMode chnget "BpmMode"
ktrigBpm changed kbpmMode
if kbpmMode == 1 then
	gkbpm = kBPM
	cabbageSetValue "BpMv", kBPM
	cabbageSet ktrigBpm, "BpMv", " colour(\"red\")"
elseif kbpmMode == 2 then
	gkbpm cabbageGetValue "BpMv"
	cabbageSet ktrigBpm, "BpMv", " colour(\"green\")"
endif


event_i "i", 20, 0, -1
endin




instr 10;pitchshifteddelay
print p1
Spitch sprintf "pitch%d", p4
kpitch_ cabbageGetValue Spitch
kpitch port semitone(kpitch_), giport

if kpitch_ == 0 then
    kpitchbyp_ = 1
else
    kpitchbyp_ = 0
endif
kpitchpas_ = (kpitchbyp_ + 1) % 2
kpitchbyp port kpitchbyp_, giport
kpitchpas port kpitchpas_, giport


Sdelay sprintf "delay%d", p4
Sdelayt sprintf "delayt%d", p4
kdelay_ cabbageGetValue Sdelay
kdelayt cabbageGetValue Sdelayt
if kdelayt == 1 then;seconds
    kdly = kdelay_
elseif kdelayt == 2 then;beats
    kdly = kdelay_ * 60 / gkbpm
endif
ktime port kdly, giport

Smoda sprintf "moda%d", p4
kmoda_ cabbageGetValue Smoda
kmoda port kmoda_, giport
Smodf sprintf "modf%d", p4
kmodf_ cabbageGetValue Smodf
kmodf port kmodf_, giport
alfo lfo 1, kmodf, 0
adTime = ktime - ktime * kmoda * ((alfo + 1) * 0.5)

Sfeed sprintf "feed%d", p4
kfeed_ cabbageGetValue Sfeed
kfeed port kfeed_, giport

Span sprintf "pan%d", p4
kpan_ cabbageGetValue Span
kpan port kpan_, giport

Sout sprintf "out%d", p4
kout_ cabbageGetValue Sout
kout port ampdbfs(kout_), giport


kdecl linsegr 0, giport, 0, giport, 1, giport, 0
fsig pvscale gfinput, kpitch
apiched_ pvsynth fsig

apiched = kpitchpas * apiched_ + kpitchbyp * (gaut[0] + gaut[1]) / $M_SQRT2

adump delayr 20
atap deltapi adTime
if kdelay_ < 0.001 then
    atap = apiched
endif
delayw apiched + atap * kfeed


aL, aR pan2 atap * kout, kpan
gaut[2 * p4] = aL * kdecl
gaut[2 * p4 + 1] = aR * kdecl
endin


instr 20;output
kdir_ cabbageGetValue "direct"
keff_ cabbageGetValue "effect"
kdir port ampdbfs(kdir_), giport
keff port ampdbfs(keff_), giport

aL = gaut[0] * kdir + (gaut[2] + gaut[4] + gaut[6] + gaut[8] + gaut[10]) * keff 
aR = gaut[1] * kdir + (gaut[3] + gaut[5] + gaut[7] + gaut[9] + gaut[11]) * keff

outs aL, aR

kupdtrig metro 3
kmaxL rms aL, 20
kmaxR rms aR, 20
cabbageSetValue "vu1", portk(kmaxL, .25), kupdtrig
cabbageSetValue "vu2", portk(kmaxR, .25), kupdtrig


kind = 0
while kind < lenarray(gaut) do
    gaut[kind] = 0
    kind += 1
od

endin





instr $CONTINSTR ;Always on control
;Current directory
gSCurrentDir cabbageGet "recallCombo", "currentDir"
;filetype without * at beginning
SFileType_ cabbageGet "recallCombo", "fileType"
idelimFit strrindex SFileType_, "."
gSFileType strsub SFileType_, idelimFit


;MIDI
kstatus, kchan, kdata1, kdata2 midiin
if kstatus == 192 then
    Sfnam = gSfilenamesMidi[kdata1]
    kcopare strcmpk Sfnam, ""
    if kcopare != 0 then
        cabbageSetValue "recallCombo", sprintfk("%s", Sfnam), k(1)
    endif
endif

;Load
SfromBox, kTrigL cabbageGetValue "recallCombo"
if kTrigL == 1 then
    event "i", $LOADINSTR, 0, 0.1
endif

;Save
SSaveFileName, kTrigS cabbageGetValue "saveFile"
if kTrigS == 1 then
    event "i", $SAVEINSTR, 0, 0.1
endif

endin






instr $LOADINSTR ;Load presets
;Update file
SFileName cabbageGetValue "recallCombo"
istrlen    strlen   SFileName
idelimiter strrindex SFileName, "/"
SnameNoPath strsub SFileName, idelimiter + 1, istrlen
;SnameNoExt filaname without extension
idelimiterd strrindex SnameNoPath, "."
SnameNoExt strsub SnameNoPath, 0, idelimiterd
;Create identifier for label
StoLabel sprintf "text(%s)", SnameNoExt
cabbageSet "presetName", StoLabel

;Load File
kOk = cabbageChannelStateRecall:k(SFileName, gSIgnoreChannels)

;Channels to update while loop for channels defined in gSSaveChannels[]
kcount init 0
klenarray lenarray gSSaveChannels
while kcount < klenarray do
    cabbageSetValue gSSaveChannels[kcount], cabbageGetValue:k(gSSaveChannels[kcount]), k(1)
    kcount = kcount + 1
od

;kill itself
turnoff
endin






instr $SAVEINSTR ;Save presets
SSaveFileName cabbageGetValue "saveFile"
;Add extension if missing
if strrindex(SSaveFileName, gSFileType) == -1 then
     SSaveFileName strcat SSaveFileName, gSFileType
endif
prints "%s\n", SSaveFileName

;save channels in a file
iOk cabbageChannelStateSave SSaveFileName

;refresh files in listbox
cabbageSet "recallCombo", "refreshFiles(1)" 
;update midi files array
event_i "i", $FILLMIDIINSTR, 1, 0.1

;kill itself
turnoff
endin



instr $FILLMIDIINSTR;fill the midi to file array gSfilenamesMidi[]
;Current directory
gSCurrentDir cabbageGet "recallCombo", "currentDir"
;filetype without * at beginning
SFileType_ cabbageGet "recallCombo", "fileType"
idelimFit strrindex SFileType_, "."
gSFileType strsub SFileType_, idelimFit

;get files in the directory
SFilenames[] directory gSCurrentDir, gSFileType

;printarray SFilenames
iNumberOfFiles lenarray SFilenames
;print iNumberOfFiles

;clear the midi to file array 
idx = 0
while idx < lenarray(gSfilenamesMidi) do
    gSfilenamesMidi[idx] = ""
    idx += 1
od

;fill the midi array
idxN = 0
while idxN < lenarray(SFilenames) do
    
    istrlen    strlen   SFilenames[idxN]
    idelimiterD strrindex SFilenames[idxN], "/"
    Sname strsub SFilenames[idxN], idelimiterD + 1, istrlen
    
    idelimiterN strrindex Sname, "_"
    if idelimiterN > 0 then;check if assigned to midi
        Snumber strsub Sname, 0, idelimiterN
        ir strtod Snumber;GET MIDIPRESET NUMBER
        ;print ir
        gSfilenamesMidi[ir] = SFilenames[idxN]
    endif
    idxN += 1
od
;printarray gSfilenamesMidi
turnoff
endin




</CsInstruments>
<CsScore>
f0 z
i1 0 -1 
</CsScore>
</CsoundSynthesizer>
