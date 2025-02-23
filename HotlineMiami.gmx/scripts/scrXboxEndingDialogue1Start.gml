if reload>0 exit
reload=2
if question=1 {
if select>-1 {
if select=0 scrDialogueGetAnswers(question1[currentquestion])
if select=1 scrDialogueGetAnswers(question2[currentquestion])
change=1
}
}
else {
if current<messages {if face[current]>face[current+1] change=1 if face[current]<face[current+1] change=1 current+=1} else {
if currentquestion<4 {
question=1
currentquestion+=1
change=1
current=0
} else {stop=1}
}
}
