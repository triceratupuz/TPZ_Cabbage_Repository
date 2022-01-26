<Cabbage>
form size(915, 445), guiMode("queue"), caption("5 Limbs Drum Seqencer"), pluginId("tz5l"), colour(200,200,200)
combobox bounds(5, 0, 98, 20), channel("BpmType"), value(2), items("Manual", "HOST")

label bounds(105, 20, 98, 15), text("Bpm"), fontColour("black")
nslider bounds(105, 0, 98, 20), channel("Bpm_m"), colour("white"), fontColour("black"), range(0, 555, 60, 1, 0.01)

label bounds(205, 20, 98, 15), text("Channel"), fontColour("black")
nslider bounds(205, 0, 98, 20), channel("Mchannel"), colour("white"), fontColour("black"), range(1, 16, 10, 1, 1)

label bounds(305, 20, 98, 15), text("Speed"), fontColour("black")
nslider bounds(305, 0, 98, 20), channel("Speed"), colour("white"), fontColour("black"), range(0, 8, 1, 1, 0.001)

label bounds(405, 20, 98, 15), text("Error Time"), fontColour("black")
nslider bounds(405, 0, 98, 20), channel("ErrorT"), colour("white"), fontColour("black"), range(0, 1, 0, 1, 0.01)

label bounds(505, 20, 98, 15), text("Error Velocity"), fontColour("black")
nslider bounds(505, 0, 98, 20), channel("ErrorV"), colour("white"), fontColour("black"), range(0, 1, 0, 1, 0.01)

button bounds(750, 0, 160, 39), channel("StartStop"), text("Play","Stop"), colour:0("black"), colour:1("red"), value(0) 
combobox bounds(750, 40, 160, 19), channel("StartStopType"), value(2), items("Manual", "HOST")


image bounds(750, 60, 160, 380), channel("disp"), colour(0,0,0)
{
label bounds(0, 0, 160, 16) text("<No Preset>") channel("presetName") colour(50, 50, 50)  fontColour("red")
listbox bounds(0, 20, 160, 340) populate("*.pres","TPZ_5LimbsDrumSeq_pres") channel("recallCombo") channelType("string") colour("grey")
combobox bounds(0, 340, 160, 20), channel("changePresetMode"), value(2), items("Free change", "Change at Beat Pattern1", "Change at End Pattern1")
filebutton bounds(0, 360, 160, 20) channel("saveFile") text("Save") populate("*.pres","TPZ_5LimbsDrumSeq_pres") mode("save") colour:0(50, 50, 50) colour:1(50, 50, 50) 
}





</Cabbage>
<CsoundSynthesizer>
<CsOptions>
;-n -d -+rtmidi=NULL -M0 -m0d --midi-key=4
-dm0 -n -+rtmidi=null -M0 -Q0

</CsOptions>
<CsInstruments>
ksmps = 128
nchnls = 2
0dbfs=1

massign 0, 0



;DEFINITIONS FOR PRESET SYSTEM
;presets instrument numbers
#define CONTINSTR #1000#
#define LOADINSTR #1011#
#define SAVEINSTR #1012#
#define FILLMIDIINSTR #1013#
;widgets to ignore
gSIgnoreChannels[] fillarray "presetName", "recallCombo", "saveFile", "changePresetMode",
                            "ScrubberID1", "ScrubberID2", "ScrubberID3", "ScrubberID4", "ScrubberID5",
                            "Notesame1", "Notesame2", "Notesame3", "Notesame4", "Notesame5",
                            "SamePit1", "SamePit2", "SamePit3", "SamePit4", "SamePit5",
                            "BpmType", "Bpm_m", "Mchannel", "Speed", "ErrorT", "ErrorV", "StartStop"
                            
                            
;widgets to save and update
;gSSaveChannels[] fillarray "att", "dec", "sus", "rel"
gSSaveChannels[] init 68 * 5
;Store filenames according MIDI PC
gSfilenamesMidi[] init 128
;Start presets instruments
event_i "i", $FILLMIDIINSTR, 0, -1
event_i "i", $CONTINSTR, 1, -1




#define PITCHSAME(N)#
;assign the same value to the whole table and gui line
;by activating instr 9
ksp$N cabbageGetValue "SamePit$N"
kref$N cabbageGetValue "Notesame$N"
if changed(ksp$N) == 1 then
    kidx = 0
    while  kidx < 32 do
        Sch sprintfk "Note%d_%d", $N, kidx
        cabbageSetValue Sch, kref$N
        kidx += 1
    od
endif
#



gkBPM init 60
giPerRow init 32

;sync change preset to paattern1
gkpattern1loop init 0
gkpattern1beat init -1




instr 1
;Gui design

iX, iY, ichs init 0

while iY < 5 do
    ;background
    Sbackground sprintf "bounds(5, %d, 740, 79), colour(\"white\"), plant(\"seq%d\"), shape(\"sharp\")", iY * 80 + 40, iY + 1
    cabbageCreate "image", Sbackground
    ;scrubber
    Scrubber sprintf "bounds(10, %d, 20, 73), colour(10,50,15,100), shape(\"sharp\"), channel(\"ScrubberID%d\")", iY * 80 + 45, iY + 1
    cabbageCreate "image", Scrubber
    ;Steps
    Sstepsl sprintf "bounds(655, %d, 48, 10), text(\"steps\"), fontColour(\"black\")", iY * 80 + 45 + 3
    cabbageCreate "label", Sstepsl
    Ssteps sprintf "bounds(695, %d, 48, 20), channel(\"Steps%d\"), colour(\"white\"), fontColour(\"black\"), range(1, 32, 16, 1, 1)", iY * 80 + 45, iY + 1
    cabbageCreate "nslider", Ssteps
    gSSaveChannels[ichs] = sprintf("Steps%d", iY+1)
    ichs += 1
    ;Speed
    Sspeedl sprintf "bounds(655, %d, 48, 10), text(\"speed\"), fontColour(\"black\")", iY * 80 + 65 + 3
    cabbageCreate "label", Sspeedl
    Sspeed sprintf "bounds(695, %d, 48, 20), channel(\"Speed%d\"), colour(\"white\"), fontColour(\"black\"), range(0, 8, 1, 1, 0.001)", iY * 80 + 65, iY + 1
    cabbageCreate "nslider", Sspeed
    gSSaveChannels[ichs] = sprintf("Speed%d", iY+1)
    ichs += 1
    ;Channel
    Schannl sprintf "bounds(655, %d, 48, 8), text(\"channel\"), fontColour(\"black\")", iY * 80 + 85 + 3
    cabbageCreate "label", Schannl
    Schann sprintf "bounds(695, %d, 48, 15), channel(\"MidiChan%d\"), colour(\"white\"), fontColour(\"black\"), items(\"master\", \"1\", \"2\", \"3\", \"4\", \"5\", \"6\", \"7\", \"8\", \"9\", \"10\", \"11\", \"12\", \"13\", \"14\", \"15\", \"16\")", iY * 80 + 85, iY + 1
    cabbageCreate "combobox", Schann
    gSSaveChannels[ichs] = sprintf("MidiChan%d", iY+1)
    ichs += 1
    
    
    
    ;Note
    Snote sprintf "bounds(655, %d, 48, 20), channel(\"Notesame%d\"), colour(\"white\"), fontColour(\"black\"), range(0, 127, 1, 1, 1)", iY * 80 + 98, iY + 1
    cabbageCreate "nslider", Snote
    ;NoteButton
    Ssamepit sprintf "bounds(695, %d, 48, 15), channel(\"SamePit%d\"), text(\"ToAll\",\"ToAll\"), colour(\"black\"), value(0), latched(0)", iY * 80 + 102, iY + 1
    cabbageCreate "button", Ssamepit


    while iX < 32 do
        ;volumes
        Svolumes sprintf "bounds(%d, %d, 20, 50), channel(\"Volu%d_%d\"), colour(100, 100, 100), alpha(0.5), trackerColour(\"red\"), range(0, 127, 0, 1, 1), textBox(0)", iX * 20 + 10, iY * 80 + 45, iY + 1, iX
        cabbageCreate "vslider", Svolumes
        gSSaveChannels[ichs] = sprintf("Volu%d_%d", iY+1, iX)
        ichs += 1
        ;note
        Snotes sprintf "bounds(%d, %d, 25, 20), rotate(-1.57, 0, 0), channel(\"Note%d_%d\"), colour(\"white\"), fontColour(\"black\"), range(0, 127, 1, 1, 1), textBox(0)", iX * 20 + 10, iY * 80 + 118, iY + 1, iX
        cabbageCreate "nslider", Snotes
        gSSaveChannels[ichs] = sprintf("Note%d_%d", iY+1, iX)
        ichs += 1
                
        iX += 1
    od

    iX = 0
    iY += 1
od


;BPM
;kf1 init 60
kbpmType cabbageGetValue "BpmType"
if kbpmType == 1 then;manual
	kbpm_m cabbageGetValue "Bpm_m"
	if kbpm_m != gkBPM then
	    cabbageSetValue "Bpm_m", kbpm_m
	    gkBPM = kbpm_m
	endif

else ;HOST
	kbpm_h cabbageGetValue "HOST_BPM"
	kbpm_m cabbageGetValue "Bpm_m"
	if kbpm_h != kbpm_m then
	    cabbageSetValue "Bpm_m", kbpm_h
	    gkBPM = kbpm_h
	endif
endif

;Start/Stop

kStaStoT cabbageGetValue "StartStopType"
kStaStoPH chnget "IS_PLAYING"
kStaStoRH chnget "IS_RECORDING"


if kStaStoT == 2 then
    if ((changed(kStaStoPH) == 1) && (kStaStoPH == 1)) || ((changed(kStaStoRH) == 1) && (kStaStoRH == 1)) then
        cabbageSetValue "StartStop", k(1)
    elseif ((changed(kStaStoPH) == 1) && (kStaStoPH == 0)) || ((changed(kStaStoRH) == 1) && (kStaStoRH == 0)) then
        cabbageSetValue "StartStop", k(0)
    endif
endif



kStaSto cabbageGetValue "StartStop"
if changed(kStaSto) == 1 && kStaSto == 1 then
    event "i", 1120.01, 0, -1, 1
    event "i", 1120.02, 0, -1, 2
    event "i", 1120.03, 0, -1, 3
    event "i", 1120.04, 0, -1, 4
    event "i", 1120.05, 0, -1, 5
elseif changed(kStaSto) == 1 && kStaSto == 0 then
    event "i", -1120.01, 0, -1, 1
    event "i", -1120.02, 0, -1, 2
    event "i", -1120.03, 0, -1, 3
    event "i", -1120.04, 0, -1, 4
    event "i", -1120.05, 0, -1, 5
endif


$PITCHSAME(1)
$PITCHSAME(2)
$PITCHSAME(3)
$PITCHSAME(4)
$PITCHSAME(5)

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
    event "i", 1005, 0, -1
endif

;Save
SSaveFileName, kTrigS cabbageGetValue "saveFile"
if kTrigS == 1 then
    event "i", $SAVEINSTR, 0, 0.1
endif

endin




instr 1005 ;change preset depending on mode
kmode cabbageGetValue "changePresetMode"
   
   if kmode == 1 then;free
        event "i", $LOADINSTR, 0, .1
        turnoff
   elseif kmode == 2 then;best loop1
        if changed(gkpattern1beat) == 1 then
            event "i", $LOADINSTR, 0, .1
            turnoff
        endif
   elseif kmode == 3 then;end loop1
        if gkpattern1loop == 1 && changed(gkpattern1loop) == 1 then
            event "i", $LOADINSTR, 0, .1
            turnoff
        endif
    else
        turnoff
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






instr 1120;metronome

;print p1
Sstepsch	sprintf	"Steps%d",p4
ksteps cabbageGetValue Sstepsch

Sspeesch	sprintf	"Speed%d",p4
kspeed cabbageGetValue Sspeesch

kspeedGlobal cabbageGetValue "Speed"

kerror cabbageGetValue "ErrorT"
ktime unirand kerror * 60 / (kspeedGlobal * kspeed * 4 * gkBPM)

ktr metro kspeedGlobal * kspeed * 4 * gkBPM / 60
kcount init -1
if ktr == 1 then
	kcount = (kcount + 1) % ksteps
	event "i", 1122 + .0001 * p4 + 0.01 * kcount, kerror, -1, p4, kcount, kspeedGlobal * kspeed

    ;to manage the change preset at pattern 1 end
    if p4 == 1 then
        if kcount == 0 then
            gkpattern1loop = 1
        else
            gkpattern1loop = 0
        endif
    gkpattern1beat = kcount    
    endif

endif


endin




instr 1122;pointer

iScrubPos	=	10 + (p5 * 20)			; derive x-position
Smsg	sprintf	"pos(%d,%d)",iScrubPos, (p4 - 1) * 80 + 45		; create message string
Sscrubsch	sprintf	"ScrubberID%d",p4
;chnset	Smsg, Sscrubsch				; send new position to widget
cabbageSet Sscrubsch, Smsg

;note out
SchV sprintf "Volu%d_%d", p4, p5
ivel cabbageGetValue SchV
if ivel > 0 then
    SchN sprintf "Note%d_%d", p4, p5
    inote cabbageGetValue SchN
    
    Schch sprintf "MidiChan%d", p4
    imidic cabbageGetValue Schch
    if imidic == 1 then
        imidic cabbageGetValue "Mchannel"
    else 
        imidic = imidic - 1
    endif
   
    event "i", 1200 + 0.001 * p4 + 0.0001 * p5, 0,  15 / (gkBPM  * p6), ivel, inote, p6, imidic
endif

turnoff
endin






instr 1200; midi note output
;p4 vol
;p5 note
;p6 speed
;p7 channel

print p5, p4, p7
inum = int(p5)

ierror cabbageGetValue "ErrorV"
ivel = p4 + p4 * birnd(ierror)
ivel limit ivel, 0, 127

idur = 0.999 * p3

;print inum, ivel
noteondur p7, inum, ivel, idur

endin






</CsInstruments>  
<CsScore>
f0 z
i1 0 -1

</CsScore>
</CsoundSynthesizer>