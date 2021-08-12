/*
NOTES
define instrument numbers in ;DEFINITIONS Macros
define channels excluded from preset in gSIgnoreChannels[] array
define channels to be updated by preset in gSSaveChannels[] array

USAGE
Preset are stored in the pouplate directory declared in the listbox widget

If MIDI program change call is required, preset name must start with XXX_
where XXX is the corresponding midi PC number
*/
<Cabbage>
form caption("ListboxPresetsMidi") size(400, 300), guiMode("queue") pluginId("tpp0")



label bounds(10, 10, 226, 20) text("<No Preset>") channel("presetName") colour(50, 50, 50)  fontColour("red")
listbox bounds(10, 30, 226, 120), populate("*.pre", "presetListbox"), channel("recallCombo"), channelType("string")
filebutton bounds(10, 150, 226, 20) channel("saveFile") text("Save") populate("*.pre","presetListbox") mode("save") colour:0(50, 50, 50) colour:1(50, 50, 50) 
button bounds(250, 10, 70, 40) channel("tp3"), text("Preset3", "Preset1")

rslider bounds(12, 210, 85, 79), channel("att"), range(0, 1, 0.01), text("Att.")
rslider bounds(98, 210, 85, 79), channel("dec"), range(0, 1, 0.4), text("Dec.")
rslider bounds(184, 210, 85, 79), channel("sus"), range(0, 1, 0.7), text("Sus.")
rslider bounds(270, 210, 85, 79), channel("rel"), range(0, 1, 0.8), text("Rel.")


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



;DEFINITIONS FOR PRESET SYSTEM
;presets instrument numbers
#define CONTINSTR #1010#
#define LOADINSTR #1011#
#define SAVEINSTR #1012#
#define FILLMIDIINSTR #1013#
;widgets to ignore
gSIgnoreChannels[] fillarray "presetName", "recallCombo", "saveFile"
;widgets to save and update
gSSaveChannels[] fillarray "att", "dec", "sus", "rel"
;Store filenames according MIDI PC
gSfilenamesMidi[] init 128
;Start presets instruments
event_i "i", $FILLMIDIINSTR, 0, -1
event_i "i", $CONTINSTR, 1, -1


instr 1
;dummy Test
endin



instr $CONTINSTR ;Always on control
;Current directory
gSCurrentDir cabbageGet "recallCombo", "currentDir"
;filetype without * at beginning
SFileType_ cabbageGet "recallCombo", "fileType"
idelimFit strrindex SFileType_, "."
gSFileType strsub SFileType_, idelimFit

;MIDI EQUIVALENT WITH BUTTON
kpr chnget "tp3"
;printk2 kpr
kdata1 = (kpr > 0.5 ? 3 : 1) 
if changed(kpr) == 1 then
    Sfnam = gSfilenamesMidi[kdata1]
    kcopare strcmpk Sfnam, ""
    if kcopare != 0 then
        cabbageSetValue "recallCombo", sprintfk("%s", Sfnam), k(1)
    endif
endif

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
;causes Csound to run for about 7000 years...
f0 z
;starts instrument 1 and runs it for a week
i 1 0 -1
</CsScore>
</CsoundSynthesizer>
