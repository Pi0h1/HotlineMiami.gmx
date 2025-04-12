if skip<30 skip+=1 else {
if room=rmDream1 objEffector.nextroom=rmSequence1
if room=rmDream2 objEffector.nextroom=rmSequence5
if room=rmDream3 objEffector.nextroom=rmSequence9
if room=rmTutorial {
objEffector.nextroom=rmDream1
objEffector.next=1
objEffector.fade=1
on=0
exit
}
objEffector.next=1
objEffector.fade=1
objEffector.newsong=1
objEffector.song=working_directory+"\\DeepCover.mp3"
on=0
}
