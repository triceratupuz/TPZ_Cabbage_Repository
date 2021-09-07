/*
PRESET SAVE
define instrument numbers in ;DEFINITIONS Macros
define channels excluded from preset in gSIgnoreChannels[] array
define channels to be updated by preset in gSSaveChannels[] array
USAGE
Preset are stored in the pouplate directory declared in the listbox widget (must be the same as filebutton widget)
If MIDI program change call is required, preset name must start with XXX_
where XXX is the corresponding midi PC number

TAILS
as above, channels to be updated by preset in gSSaveChannels[] array
define READINSTR number and corresponding instrument definition
in $LOADINSTR instrument definiion be sure to have the correct instruments (parameters reader and effect itself)

*/
<Cabbage>
form caption("DelayTails") size(510, 150), guiMode("queue") pluginId("tpp1") colour("white")



label bounds(360, 10, 126, 20) text("<No Preset>") channel("presetName") colour(50, 50, 50)  fontColour("red")
listbox bounds(360, 30, 126, 100), populate("*.pre", "TPZ_DelayTails"), channel("recallCombo"), channelType("string")
filebutton bounds(360, 120, 126, 20) channel("saveFile") text("Save") populate("*.pre","TPZ_DelayTails") mode("save") colour:0(50, 50, 50) colour:1(50, 50, 50) 


rslider bounds(12, 5, 85, 79), channel("time"), range(0, 3, 0), text("time")
rslider bounds(98, 5, 85, 79), channel("feedback"), range(0, 1, 0), text("feed")
rslider bounds(184, 5, 85, 79), channel("dw"), range(0, 1, 0), text("D-W")

rslider bounds(270, 5, 85, 79), channel("tail"), range(0, 7, 0), text("tail")


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
gSSaveChannels[] fillarray "time", "feedback", "dw", "tail"
;Store filenames according MIDI PC
gSfilenamesMidi[] init 128
;Start presets instruments
event_i "i", $FILLMIDIINSTR, 0, -1
event_i "i", $CONTINSTR, 1, -1

;DEFINITIONS FOR TAIL SYSTEM
#define READINSTR #10#
;store gui values in array o be read by effect istance
giparamslength lenarray gSSaveChannels
giSimultaneousIstances init 5
gkwidgetValues[][] init giparamslength, giSimultaneousIstances
;counter to index the istances
gistace init 0




instr 1
aL inch 1
aR inch 2

;reset output audio
gaoL = 0
gaoR = 0

;Start new parameters reader
event_i "i", $READINSTR + 0.01 + 0.01 * gistace, 0, -1, gistace
;Start new effect istance
event_i "i", 20 + 0.01 + 0.01 * gistace, 0, -1, gistace
;Start output
event_i "i", 30, 0, -1
endin




instr $READINSTR;read channels and put in array
;p4 is current istance
kidx = 0
while kidx < giparamslength do
    gkwidgetValues[kidx][p4] = cabbageGetValue:k(gSSaveChannels[kidx])
    kidx += 1
od
endin




instr 20;delay
;p4 is current istance
;p5 is tail time

;get parametes index according to gSSaveChannels[] array
ktime port gkwidgetValues[0][p4], 0.01
kfeed port gkwidgetValues[1][p4], 0.01
kdw port gkwidgetValues[2][p4], 0.01

kenvelopeIn linsegr 0, 0.02, 1, 0.02, 0
kenvelopeOut linsegr 0, 0.02, 1, p5, 0

aL inch 1
aR inch 2

adL delayr 3.5
afeedL deltap ktime
delayw aL * kenvelopeIn + afeedL * kfeed

adR delayr 3.5
afeedR deltap ktime
delayw aR * kenvelopeIn + afeedR * kfeed



gaoL += (aL * (1-kdw) + (afeedL * kenvelopeOut) * kdw); accumulate output
gaoR += (aR * (1-kdw) + (afeedR * kenvelopeOut) * kdw); in case of other istances outputting

endin


instr 30;output always on to output the values accumulated by the variour istances of effect
outs gaoL, gaoR
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

;Turnoff OLD parameters reader
event_i "i", -1 * $READINSTR - 0.01 - 0.01 * gistace, 0, -1
;Turnoff old effect istance
event_i "i", -20 - 0.01 - 0.01 * gistace, 0, -1, gistace


;Load File
kOk = cabbageChannelStateRecall:k(SFileName, gSIgnoreChannels)

;Channels to update while loop for channels defined in gSSaveChannels[]
kcount init 0
klenarray lenarray gSSaveChannels
while kcount < klenarray do
    cabbageSetValue gSSaveChannels[kcount], cabbageGetValue:k(gSSaveChannels[kcount]), k(1)
    kcount = kcount + 1
od


;Increment current istance value
gistace_prev = gistace
gistace = (gistace + 1) % giSimultaneousIstances
;Turnon new parameters reader
event_i "i", $READINSTR + 0.01 + 0.01 * gistace, 0, -1, gistace

;get tail value
ktail cabbageGetValue "tail";can not be retreived withi the instrument since it's in a karray
;Turnon new effect istance
event "i", 20 + 0.01 + 0.01 * gistace, 0, -1, gistace, ktail

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
