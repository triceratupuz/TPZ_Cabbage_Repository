;Delay Matrix 3 X 3
;developed by Triceratupuz Lab
;http://triceratupuz.altervista.org/
;REV 20210920
<Cabbage>

#define POTSIZ 79
#define POTSIZC 50
#define POTSIZ2 60
#define RED 255, 0, 0
#define GREEN 0, 155, 0
#define YELLOW 255, 255, 0
#define PLATEW 550

#define MIXSLID textBox(1), range(0, 4, 0, 0.5), trackerColour("white") 
#define DLYPOT textBox(1), trackerColour("gray"), textColour("black"), valueTextBox(1)

form size(755, 310), caption("Delay Matrix 3 X 3"), guiMode("queue"), pluginId("dmtp"), colour(50, 50, 50)

image bounds(5, 5, $PLATEW , 98), colour( $RED , 190), corners(5)
{
vslider bounds(0, 0, 40, 80), channel("DIR_IN_1"), colour("white"), $MIXSLID
vslider bounds(30, 0, 40, 80), channel("DEL_IN_1_1"), colour( $RED ), $MIXSLID
vslider bounds(60, 0, 40, 80), channel("DEL_IN_2_1"), colour( $GREEN ), $MIXSLID
vslider bounds(90, 0, 40, 80), channel("DEL_IN_3_1"), colour( $YELLOW ), $MIXSLID
combobox bounds(143, 2, $POTSIZC, 15), channel("TIMEMODE_1"), value(1), items("sec", "BpM")
rslider bounds(130, 18, $POTSIZ, $POTSIZ), channel("TIME_1"), range(0, 10, 0), text("time"), $DLYPOT
rslider bounds(180, 18, $POTSIZ, $POTSIZ), channel("FEED_1"), range(0, 1.5, 0), text("feed"), $DLYPOT
rslider bounds(230, 18, $POTSIZ, $POTSIZ), channel("SHIFT_1"), range(-12, 12, 0), text("shift"), $DLYPOT
combobox bounds(243, 2, $POTSIZC, 15), channel("SHIFTMODE_1"), value(1), items("off", "loop", "post")
rslider bounds(280, 18, $POTSIZ, $POTSIZ), channel("LF_1"), range(20, 18000, 20, 0.5, 1), text("LF"), $DLYPOT
rslider bounds(330, 18, $POTSIZ, $POTSIZ), channel("HF_1"), range(20, 18000, 18000, 0.5, 1), text("HF"), $DLYPOT
rslider bounds(380, 18, $POTSIZ, $POTSIZ), channel("DW_1"), range(0, 1, 1), text("D-W"), $DLYPOT
rslider bounds(430, 18, $POTSIZ, $POTSIZ), channel("PAN_1"), range(0, 1, 0.5), text("PAN"), $DLYPOT
rslider bounds(480, 18, $POTSIZ, $POTSIZ), channel("OUT_1"), range(-60, 12, 0), text("out"), $DLYPOT
}

image bounds(5, 105, $PLATEW , 98), colour( $GREEN , 190), corners(5)
{
vslider bounds(0, 0, 40, 80), channel("DIR_IN_2"), colour("white"), $MIXSLID
vslider bounds(30, 0, 40, 80), channel("DEL_IN_1_2"), colour( $RED ), $MIXSLID
vslider bounds(60, 0, 40, 80), channel("DEL_IN_2_2"), colour( $GREEN ), $MIXSLID
vslider bounds(90, 0, 40, 80), channel("DEL_IN_3_2"), colour( $YELLOW ), $MIXSLID
combobox bounds(143, 2, $POTSIZC, 15), channel("TIMEMODE_2"), value(1), items("sec", "BpM")
rslider bounds(130, 18, $POTSIZ, $POTSIZ), channel("TIME_2"), range(0, 10, 0), text("time"), $DLYPOT
rslider bounds(180, 18, $POTSIZ, $POTSIZ), channel("FEED_2"), range(0, 1.5, 0), text("feed"), $DLYPOT
rslider bounds(230, 18, $POTSIZ, $POTSIZ), channel("SHIFT_2"), range(-12, 12, 0), text("shift"), $DLYPOT
combobox bounds(243, 2, $POTSIZC, 15), channel("SHIFTMODE_2"), value(1), items("off", "loop", "post")
rslider bounds(280, 18, $POTSIZ, $POTSIZ), channel("LF_2"), range(20, 18000, 20, 0.5, 1), text("LF"), $DLYPOT
rslider bounds(330, 18, $POTSIZ, $POTSIZ), channel("HF_2"), range(20, 18000, 18000, 0.5, 1), text("HF"), $DLYPOT
rslider bounds(380, 18, $POTSIZ, $POTSIZ), channel("DW_2"), range(0, 1, 1), text("D-W"), $DLYPOT
rslider bounds(430, 18, $POTSIZ, $POTSIZ), channel("PAN_2"), range(0, 1, 0.5), text("PAN"), $DLYPOT
rslider bounds(480, 18, $POTSIZ, $POTSIZ), channel("OUT_2"), range(-60, 12, 0), text("out"), $DLYPOT
}

image bounds(5, 205, $PLATEW , 98), colour( $YELLOW , 190), corners(5)
{
vslider bounds(0, 0, 40, 80), channel("DIR_IN_3"), colour("white"), $MIXSLID
vslider bounds(30, 0, 40, 80), channel("DEL_IN_1_3"), colour( $RED ), $MIXSLID
vslider bounds(60, 0, 40, 80), channel("DEL_IN_2_3"), colour( $GREEN ), $MIXSLID
vslider bounds(90, 0, 40, 80), channel("DEL_IN_3_3"), colour( $YELLOW ), $MIXSLID
combobox bounds(143, 2, $POTSIZC, 15), channel("TIMEMODE_3"), value(1), items("sec", "BpM")
rslider bounds(130, 18, $POTSIZ, $POTSIZ), channel("TIME_3"), range(0, 10, 0), text("time"), $DLYPOT
rslider bounds(180, 18, $POTSIZ, $POTSIZ), channel("FEED_3"), range(0, 1.5, 0), text("feed"), $DLYPOT
rslider bounds(230, 18, $POTSIZ, $POTSIZ), channel("SHIFT_3"), range(-12, 12, 0), text("shift"), $DLYPOT
combobox bounds(243, 2, $POTSIZC, 15), channel("SHIFTMODE_3"), value(1), items("off", "loop", "post")
rslider bounds(280, 18, $POTSIZ, $POTSIZ), channel("LF_3"), range(20, 18000, 20, 0.5, 1), text("LF"), $DLYPOT
rslider bounds(330, 18, $POTSIZ, $POTSIZ), channel("HF_3"), range(20, 18000, 18000, 0.5, 1), text("HF"), $DLYPOT
rslider bounds(380, 18, $POTSIZ, $POTSIZ), channel("DW_3"), range(0, 1, 1), text("D-W"), $DLYPOT
rslider bounds(430, 18, $POTSIZ, $POTSIZ), channel("PAN_3"), range(0, 1, 0.5), text("PAN"), $DLYPOT
rslider bounds(480, 18, $POTSIZ, $POTSIZ), channel("OUT_3"), range(-60, 12, 0), text("out"), $DLYPOT
}


image bounds(560, 5, 190, 300), colour(50, 50, 50, 0)
{
    image bounds(0, 0, 190, 70), colour(150,150,100), corners(5)
    {
        ;Direct
        rslider bounds(5, 5, $POTSIZ2, $POTSIZ2), channel("DIRECT"), range(-160, 12, 0, 9.8, 0.01), textBox(1), trackerColour("white"), text("Direct"), textColour("white")
        ;Delay
        rslider bounds(65, 5, $POTSIZ2, $POTSIZ2), channel("DELAY"), range(-160, 12, 0, 9.8, 0.01), textBox(1), trackerColour("white"), text("Delay"), textColour("white")
        ;Extratime
        rslider bounds(125, 5, $POTSIZ2, $POTSIZ2), channel("EXTRATIME"), range(0, 10, 0, 1, 0.01), textBox(1), trackerColour("white"), text("Extra T"), textColour("white")
    }
    ;Bpm
    label bounds(5, 80, $POTSIZ2, 20), text("Bpm"), fontColour("white")
    combobox bounds(65, 80, $POTSIZ2, 20), channel("BPMMODE"), value(1), items("Manual", "Host")
    nslider bounds(125, 80, $POTSIZ2, 20), channel("Bpm"), range(1, 400, 60, 1, 0.001), colour("black")

    image  bounds(0, 105, 160, 195), colour(150, 50, 50){
        label bounds(0, 0, 160, 20) text("<No Preset>") channel("presetName") colour(40, 40, 40)  fontColour("red")
        listbox bounds(0, 20, 160, 155), populate("*.pre", "TPZ_DelayMatrix_3x3_pre"), channel("recallCombo"), channelType("string")
        filebutton bounds(0, 175, 160, 20) channel("saveFile") text("Save") populate("*.pre","TPZ_DelayMatrix_3x3_pre") mode("save") colour:0(0, 0, 0) colour:1(0, 0, 0) 
    }

    vmeter bounds(164, 105, 12, 195) channel("vu1") value(0) outlineColour(200, 200, 200), overlayColour(0, 0, 0) meterColour:0(255, 0, 0) meterColour:1(255, 255, 0) meterColour:2(0, 255, 0) outlineThickness(1) 
    vmeter bounds(178, 105, 12, 195) channel("vu2") value(0) outlineColour(200, 200, 200), overlayColour(0, 0, 0) meterColour:0(255, 0, 0) meterColour:1(255, 255, 0) meterColour:2(0, 255, 0) outlineThickness(1) 
}


</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d -+rtmidi=NULL -M0 -Q0 -m0d 
</CsOptions>
<CsInstruments>
ksmps = 128
nchnls = 2
0dbfs=1

massign 0,0

;inputoutput
gaAudio_io[] init 4
;max number cof simultaneous presets
giMaxChains init 6


;istance counter
gicur_run init 0









#define DELAYLINE(NUM)#

;P4 active chain

;Input mixing values

kd0 port gkwidgetValues[kdxValues][p4], 0.01
kdxValues +=1
kd1 port gkwidgetValues[kdxValues][p4], 0.01
kdxValues +=1
kd2 port gkwidgetValues[kdxValues][p4], 0.01
kdxValues +=1
kd3 port gkwidgetValues[kdxValues][p4], 0.01
kdxValues +=1


aindly$NUM AtanLimit adir * kd0 + ad1 * kd1 + ad2 * kd2 + ad3 * kd3

;delay
ktm = gkwidgetValues[kdxValues][p4]
kdxValues +=1
kdt = gkwidgetValues[kdxValues][p4]
kdxValues +=1
kfe port gkwidgetValues[kdxValues][p4], 0.01
kdxValues +=1
;shift
kshmode_$NUM = gkwidgetValues[kdxValues][p4]
kdxValues +=1
kshift_$NUM port gkwidgetValues[kdxValues][p4], 0.01
kdxValues +=1
;filters
klf port gkwidgetValues[kdxValues][p4], 0.01
kdxValues +=1
khf port gkwidgetValues[kdxValues][p4], 0.01
kdxValues +=1
;out
kdw port gkwidgetValues[kdxValues][p4], 0.01
kdxValues +=1
kpa port gkwidgetValues[kdxValues][p4], 0.01
kdxValues +=1
kou port gkwidgetValues[kdxValues][p4], 0.01
kdxValues +=1




ktime init 0
if ktm == 1 then
	ktime_ = kdt
else
	ktime_ = kdt * 60 / gkbpm
endif

ktime port ktime_, 0.05
atime interp ktime

afeed_$NUM init 0
atapPI_$NUM init 0

kloopsh_ init 0
kpostsh_ init 0


if kshmode_$NUM == 2  then
    kloopsh_ = 1
    kpostsh_ = 0
elseif kshmode_$NUM == 3 then
    kloopsh_ = 0
    kpostsh_ = 1
else
    kloopsh_ = 0
    kpostsh_ = 0
endif

kloopsh port kloopsh_, 0.02
kpostsh port kpostsh_, 0.02


abuff$NUM delayr 60
		atap_$NUM deltapi atime
		;filtering
		atapLP_$NUM butlp atap_$NUM, khf
		atapHP_$NUM buthp atapLP_$NUM, klf
		;loop shifting
		fsigL_$NUM  pvsanal   atapHP_$NUM, 1024, 512, 1024, 1
        ftpsL_$NUM  pvscale   fsigL_$NUM, semitone(kshift_$NUM)
        ashL_$NUM pvsynth   ftpsL_$NUM
        ;mix
		afeed_$NUM = atapHP_$NUM * (1 - kloopsh) + ashL_$NUM * kloopsh
		delayw aindly$NUM + afeed_$NUM * kfe


;Post shifting
fsigP_$NUM  pvsanal   afeed_$NUM, 1024, 512, 1024, 1
ftpsP_$NUM  pvscale   fsigP_$NUM, semitone(kshift_$NUM)
ashP_$NUM pvsynth   ftpsP_$NUM
ashP_$NUM = afeed_$NUM * (1 - kpostsh) + ashP_$NUM * kpostsh

aout_$NUM = ashP_$NUM * kdw + aindly$NUM * (1 - kdw)

aL$NUM, aR$NUM pan2 aout_$NUM * ampdb(kou) * kenvmatrix, kpa
#



opcode AtanLimit, a, a
ain xin
aout = 2 * taninv(ain) / 3.1415927
xout aout
endop




;DEFINITIONS FOR PRESET SYSTEM
;presets instrument numbers
#define CONTINSTR #1010#
#define LOADINSTR #1011#
#define SAVEINSTR #1012#
#define FILLMIDIINSTR #1013#
;widgets to ignore
gSIgnoreChannels[] fillarray "presetName", "recallCombo", "saveFile", "BPMMODE", "Bpm", "vu1", "vu2"
;widgets to save and update
gSSaveChannels[] fillarray "DIR_IN_1", "DEL_IN_1_1", "DEL_IN_2_1", "DEL_IN_3_1", "TIMEMODE_1", "TIME_1", "FEED_1", "SHIFTMODE_1", "SHIFT_1", "LF_1", "HF_1", "DW_1", "PAN_1", "OUT_1",
                            "DIR_IN_2", "DEL_IN_1_2", "DEL_IN_2_2", "DEL_IN_3_2", "TIMEMODE_2", "TIME_2", "FEED_2", "SHIFTMODE_2",  "SHIFT_2", "LF_2", "HF_2", "DW_2", "PAN_2", "OUT_2",
                            "DIR_IN_3", "DEL_IN_1_3", "DEL_IN_2_3", "DEL_IN_3_3", "TIMEMODE_3", "TIME_3", "FEED_3", "SHIFTMODE_3", "SHIFT_3", "LF_3", "HF_3", "DW_3", "PAN_3", "OUT_3",
                            "DIRECT", "DELAY", "EXTRATIME"
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



gkbpm init 60


instr 1
a1,a2 ins
gaAudio_io[0] = a1
gaAudio_io[1] = a2


;BPM
kbpmType cabbageGetValue "BPMMODE"
if kbpmType == 1 then;manual
	kbpm_m cabbageGetValue "Bpm"
	if kbpm_m != gkbpm then
	    cabbageSetValue "Bpm", kbpm_m
	    gkbpm = kbpm_m
	endif
else ;HOST
	kbpm_h cabbageGetValue "HOST_BPM"
	kbpm_m cabbageGetValue "Bpm"
	if kbpm_h != kbpm_m then
	    cabbageSetValue "Bpm", kbpm_h
	    gkbpm = kbpm_h
	endif
endif


;Start new parameters reader
event_i "i", $READINSTR + 0.01 + 0.01 * gistace, 0, -1, gistace
;Start new effect istance
event_i "i", 50 + 0.01 + 0.01 * gistace, 0, -1, gistace, 0
;Start output
event_i "i", 100, 0, -1

endin




instr $READINSTR;read channels and put in array
;p4 is current istance
kidx = 0
while kidx < giparamslength do
    gkwidgetValues[kidx][p4] = cabbageGetValue:k(gSSaveChannels[kidx])
    kidx += 1
od
endin




instr 50
kenvin linsegr 0, 0.05, 1, 0.05, 0
kenvmatrix linsegr 0, 0.05, 1, p5, 0

adirL = gaAudio_io[0] * kenvin
adirR = gaAudio_io[1] * kenvin
adir = (adirL + adirR) / 1.41

af1 init 0
af2 init 0
af3 init 0
ad1 = af1 * kenvmatrix
ad2 = af2 * kenvmatrix
ad3 = af3 * kenvmatrix

kdxValues = 0;index in the save array
$DELAYLINE(1)
$DELAYLINE(2)
$DELAYLINE(3)

;Internal routing to other delays
af1 = aout_1
af2 = aout_2
af3 = aout_3

;mixing output
kdirp port gkwidgetValues[kdxValues][p4], 0.01
kdxValues += 1
kdelay port gkwidgetValues[kdxValues][p4], 0.01
kdxValues += 1

;to output
gaAudio_io[2] AtanLimit gaAudio_io[2] + (aL1 + aL2 + aL3) * ampdb(kdelay) + gaAudio_io[0] * kenvin * ampdb(kdirp)
gaAudio_io[3] AtanLimit gaAudio_io[3] + (aR1 + aR2 + aR3) * ampdb(kdelay) + gaAudio_io[1] * kenvin * ampdb(kdirp)
endin






instr 100;vumeter and out

aoutLo AtanLimit gaAudio_io[2]
aoutRo AtanLimit gaAudio_io[3]

kupdtrig metro 3
kmaxL max_k aoutLo, kupdtrig, 1
kmaxR max_k aoutRo, kupdtrig, 1
cabbageSetValue "vu1", portk(kmaxL, .25), kupdtrig
cabbageSetValue "vu2", portk(kmaxR, .25), kupdtrig

outs gaAudio_io[2], gaAudio_io[3]

gaAudio_io[2] = 0
gaAudio_io[3] = 0
endin





instr $CONTINSTR ;Always on control
;Current directory
gSCurrentDir cabbageGet "recallCombo", "currentDir"
;filetype without * at beginning
SFileType_ cabbageGet "recallCombo", "fileType"
idelimFit strrindex SFileType_, "."
gSFileType strsub SFileType_, idelimFit

;MIDI
remidi:
    kstatus, kchan, kdata1, kdata2 midiin
    if kstatus != 0 then
        midiout kstatus, kchan, kdata1, kdata2
    endif 
    if kstatus == 192 then
        Sfnam = gSfilenamesMidi[kdata1]
        kcopare strcmpk Sfnam, ""
        if kcopare != 0 then
            cabbageSetValue "recallCombo", sprintfk("%s", Sfnam), k(1)
        endif
    endif
if kstatus != 0 kgoto remidi

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
event_i "i", -50 - 0.01 - 0.01 * gistace, 0, -1, gistace


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
gistace = (gistace + 1) % giSimultaneousIstances
;Turnon new parameters reader
event_i "i", $READINSTR + 0.01 + 0.01 * gistace, 0, -1, gistace

;get tail value
ktail cabbageGetValue "EXTRATIME";can not be retreived withi the instrument since it's in a karray
;Turnon new effect istance
event "i", 50 + 0.01 + 0.01 * gistace, 0, -1, gistace, ktail + 0.01

;kill itself
turnoff
endin






instr $SAVEINSTR ;Save presets
SSaveFileName cabbageGetValue "saveFile"
;Add extension if missing
if strrindex(SSaveFileName, gSFileType) == -1 then
     SSaveFileName strcat SSaveFileName, gSFileType
endif
;prints "%s\n", SSaveFileName

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
i 1 0 -1
e
</CsScore>
</CsoundSynthesizer>